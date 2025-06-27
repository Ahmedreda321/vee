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

  static Future<LatLng> getLatLngFromNominatimLink(String link) async {
    final response = await http.get(Uri.parse(link));
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      if (data.isNotEmpty) {
        final firstResult = data[0];
        return LatLng(
          double.parse(firstResult['lat']),
          double.parse(firstResult['lon']),
        );
      } else {
        throw Exception('No results found');
      }
    } else {
      throw Exception('Failed to get Nominatim data');
    }
  }
}

class MapScreen extends StatefulWidget {
  const MapScreen({
    super.key,
    required this.pickupLocationNominatimLink,
    required this.destinationLocationNominatimLink,
  });
  final String pickupLocationNominatimLink;
  final String destinationLocationNominatimLink;

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  LatLng? _fromLocation;
  LatLng? _toLocation;
  final MapController _mapController = MapController();
  LocationData? _currentLocation;
  List<LatLng> _routePoints = [];
  final String mapToken = AppConstants.mapToken;
  bool _locationsLoaded = false;

  @override
  void initState() {
    super.initState();
    _fetchLocations();
    _getCurrentLocation();
  }

  Future<void> _fetchLocations() async {
    try {
      final fromLocation = await MapsServices.getLatLngFromNominatimLink(
          widget.pickupLocationNominatimLink);
      final toLocation = await MapsServices.getLatLngFromNominatimLink(
          widget.destinationLocationNominatimLink);
      setState(() {
        _fromLocation = fromLocation;
        _toLocation = toLocation;
        _locationsLoaded = true;
      });
      _getRoute();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error fetching locations: $e')),
      );
    }
  }

  Future<void> _getRoute() async {
    if (_fromLocation == null || _toLocation == null) return;
    
    try {
      _routePoints = await MapsServices.getRoute(
        _fromLocation!.latitude,
        _fromLocation!.longitude,
        _toLocation!.latitude,
        _toLocation!.longitude,
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
    if (!_locationsLoaded || _fromLocation == null || _toLocation == null) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return Scaffold(
      floatingActionButton: _currentLocation != null
          ? FloatingActionButton(
              onPressed: () {
                _mapController.move(
                    LatLng(_currentLocation!.latitude!,
                        _currentLocation!.longitude!),
                    18.0);
              },
              child: const Icon(Icons.my_location, color: AppColor.primaryColor),
            )
          : null,
      body: FlutterMap(
        mapController: _mapController,
        options: MapOptions(
          initialCenter: _fromLocation!,
          initialZoom: 13.0,
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
                point: _fromLocation!,
                child: const Icon(Icons.location_on, color: Colors.red, size: 40),
              ),
              Marker(
                width: 80.0,
                height: 80.0,
                point: _toLocation!,
                child: const Icon(Icons.location_on, color: Colors.blue, size: 40),
              ),
              if (_currentLocation != null)
                Marker(
                  width: 80.0,
                  height: 80.0,
                  point: LatLng(_currentLocation!.latitude!,
                      _currentLocation!.longitude!),
                  child: const Icon(Icons.my_location, color: Colors.green, size: 40),
                ),
            ],
          ),
        ],
      ),
    );
  }
}