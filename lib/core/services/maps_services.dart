import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:location/location.dart';
import 'package:latlong2/latlong.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../constants/app_constants.dart';
import '../theme/app_colors.dart';

class MapsServices {
  static Future<List<LatLng>> getRoute(double fromLat, double fromLng,
      double toLat, double toLng, String apiKey) async {
    final url =
        'https://api.openrouteservice.org/v2/directions/driving-car?api_key=$apiKey&start=$fromLng,$fromLat&end=$toLng,$toLat';
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List<dynamic> coordinates =
          data['features'][0]['geometry']['coordinates'];
      return coordinates.map((coord) => LatLng(coord[1], coord[0])).toList();
    } else {
      throw Exception('Failed to load route');
    }
  }
}

class MapScreen extends StatefulWidget {
  const MapScreen({
    super.key,
    required this.fromLat,
    required this.fromLng,
    required this.toLat,
    required this.toLng,
  });
  final double fromLat;
  final double fromLng;
  final double toLat;
  final double toLng;

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late final LatLng _fromLocation;
  late final LatLng _toLocation;
  final MapController _mapController = MapController();
  LocationData? _currentLocation;
  List<LatLng> _routePoints = [];
  final String mapToken = AppConstants.mapToken; 

  @override
  void initState() {
    super.initState();
    _fromLocation = LatLng(widget.fromLat, widget.fromLng);
    _toLocation = LatLng(widget.toLat, widget.toLng);
    _getRoute();
    _getCurrentLocation();
  }

  Future<void> _getRoute() async {
    try {
      _routePoints = await MapsServices.getRoute(
        widget.fromLat,
        widget.fromLng,
        widget.toLat,
        widget.toLng,
        mapToken,
      );
      setState(() {});
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error fetching route: $e')),
      );
      _routePoints = [];
    }
  }

  Future<void> _getCurrentLocation() async {
    Location location = Location();
    bool serviceEnabled;
    PermissionStatus permissionGranted;

    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) return;
    }

    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) return;
    }

    _currentLocation = await location.getLocation();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _mapController.move(LatLng(_currentLocation!.latitude!, _currentLocation!.longitude!), 18.0);
        },
        child: const Icon(Icons.my_location, color: AppColor.primaryColor),
      ),
      body: FlutterMap(
        mapController: _mapController,
        options: MapOptions(
          initialCenter: _fromLocation,
          initialZoom: 18.0,
        ),
        children: [
          TileLayer(
            urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
            subdomains: const ['a', 'b', 'c'],
          ),
          if (_routePoints.isNotEmpty)
            PolylineLayer(
              polylines: [
                Polyline(
                  points: _routePoints,
                  strokeWidth: 4.0,
                  color: Colors.blue,
                ),
              ],
            ),
          MarkerLayer(
            markers: [
              Marker(
                width: 80.0,
                height: 80.0,
                point: _fromLocation,
                child: const Icon(Icons.location_on, color: Colors.red),
              ),
              Marker(
                width: 80.0,
                height: 80.0,
                point: _toLocation,
                child: const Icon(Icons.location_on, color: Colors.blue),
              ),
              if (_currentLocation != null)
                Marker(
                  width: 80.0,
                  height: 80.0,
                  point: LatLng(_currentLocation!.latitude!,
                      _currentLocation!.longitude!),
                  child: const Icon(Icons.my_location, color: Colors.green),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
