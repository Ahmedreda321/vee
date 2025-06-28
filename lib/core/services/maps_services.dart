// import 'package:flutter/material.dart';
// import 'package:flutter_map/flutter_map.dart';
// import 'package:location/location.dart';
// import 'package:latlong2/latlong.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// import '../constants/app_constants.dart';
// import '../theme/app_colors.dart';

// class MapsServices {
//   static Future<List<LatLng>> getRoute(double fromLat, double fromLng,
//       double toLat, double toLng, String apiKey) async {
//     final url =
//         'https://api.openrouteservice.org/v2/directions/driving-car?api_key=$apiKey&start=$fromLng,$fromLat&end=$toLng,$toLat';
//     final response = await http.get(Uri.parse(url));
//     if (response.statusCode == 200) {
//       final data = json.decode(response.body);
//       final List<dynamic> coordinates =
//           data['features'][0]['geometry']['coordinates'];
//       return coordinates.map((coord) => LatLng(coord[1], coord[0])).toList();
//     } else {
//       throw Exception('Failed to load route');
//     }
//   }

//   static Future<LatLng> getLatLngFromNominatimLink(String link) async {
//     final response = await http.get(Uri.parse(link));
//     if (response.statusCode == 200) {
//       final List<dynamic> data = json.decode(response.body);
//       if (data.isNotEmpty) {
//         final firstResult = data[0];
//         return LatLng(
//           double.parse(firstResult['lat']),
//           double.parse(firstResult['lon']),
//         );
//       } else {
//         throw Exception('No results found');
//       }
//     } else {
//       throw Exception('Failed to get Nominatim data');
//     }
//   }
// }

// class MapScreen extends StatefulWidget {
//   const MapScreen({
//     super.key,
//     required this.pickupLocationNominatimLink,
//     required this.destinationLocationNominatimLink,
//   });
//   final String pickupLocationNominatimLink;
//   final String destinationLocationNominatimLink;

//   @override
//   State<MapScreen> createState() => _MapScreenState();
// }

// class _MapScreenState extends State<MapScreen> {
//   LatLng? _fromLocation;
//   LatLng? _toLocation;
//   final MapController _mapController = MapController();
//   LocationData? _currentLocation;
//   List<LatLng> _routePoints = [];
//   final String mapToken = AppConstants.mapToken;
//   bool _locationsLoaded = false;

//   @override
//   void initState() {
//     super.initState();
//     _fetchLocations();
//     _getCurrentLocation();
//   }

//   Future<void> _fetchLocations() async {
//     try {
//       final fromLocation = await MapsServices.getLatLngFromNominatimLink(
//           widget.pickupLocationNominatimLink);
//       final toLocation = await MapsServices.getLatLngFromNominatimLink(
//           widget.destinationLocationNominatimLink);
//       setState(() {
//         _fromLocation = fromLocation;
//         _toLocation = toLocation;
//         _locationsLoaded = true;
//       });
//       _getRoute();
//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Error fetching locations: $e')),
//       );
//     }
//   }

//   Future<void> _getRoute() async {
//     if (_fromLocation == null || _toLocation == null) return;

//     try {
//       _routePoints = await MapsServices.getRoute(
//         _fromLocation!.latitude,
//         _fromLocation!.longitude,
//         _toLocation!.latitude,
//         _toLocation!.longitude,
//         mapToken,
//       );
//       setState(() {});
//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Error fetching route: $e')),
//       );
//       _routePoints = [];
//     }
//   }

//   Future<void> _getCurrentLocation() async {
//     Location location = Location();
//     bool serviceEnabled;
//     PermissionStatus permissionGranted;

//     serviceEnabled = await location.serviceEnabled();
//     if (!serviceEnabled) {
//       serviceEnabled = await location.requestService();
//       if (!serviceEnabled) return;
//     }

//     permissionGranted = await location.hasPermission();
//     if (permissionGranted == PermissionStatus.denied) {
//       permissionGranted = await location.requestPermission();
//       if (permissionGranted != PermissionStatus.granted) return;
//     }

//     _currentLocation = await location.getLocation();
//     setState(() {});
//   }

//   @override
//   Widget build(BuildContext context) {
//     if (!_locationsLoaded || _fromLocation == null || _toLocation == null) {
//       return const Scaffold(
//         body: Center(
//           child: CircularProgressIndicator(),
//         ),
//       );
//     }

//     return Scaffold(
//       floatingActionButton: _currentLocation != null
//           ? FloatingActionButton(
//               onPressed: () {
//                 _mapController.move(
//                     LatLng(_currentLocation!.latitude!,
//                         _currentLocation!.longitude!),
//                     18.0);
//               },
//               child: const Icon(Icons.my_location, color: AppColor.primaryColor),
//             )
//           : null,
//       body: FlutterMap(
//         mapController: _mapController,
//         options: MapOptions(
//           initialCenter: _fromLocation!,
//           initialZoom: 13.0,
//         ),
//         children: [
//           TileLayer(
//             urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
//             subdomains: const ['a', 'b', 'c'],
//           ),
//           if (_routePoints.isNotEmpty)
//             PolylineLayer(
//               polylines: [
//                 Polyline(
//                   points: _routePoints,
//                   strokeWidth: 4.0,
//                   color: Colors.blue,
//                 ),
//               ],
//             ),
//           MarkerLayer(
//             markers: [
//               Marker(
//                 width: 80.0,
//                 height: 80.0,
//                 point: _fromLocation!,
//                 child: const Icon(Icons.location_on, color: Colors.red, size: 40),
//               ),
//               Marker(
//                 width: 80.0,
//                 height: 80.0,
//                 point: _toLocation!,
//                 child: const Icon(Icons.location_on, color: Colors.blue, size: 40),
//               ),
//               if (_currentLocation != null)
//                 Marker(
//                   width: 80.0,
//                   height: 80.0,
//                   point: LatLng(_currentLocation!.latitude!,
//                       _currentLocation!.longitude!),
//                   child: const Icon(Icons.my_location, color: Colors.green, size: 40),
//                 ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }

//***********************************اول حل **************************************** */

// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:flutter_map/flutter_map.dart';
// import 'package:location/location.dart';
// import 'package:latlong2/latlong.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// import '../constants/app_constants.dart';
// import '../theme/app_colors.dart';
// import '../utils/app_shared_pref_consts.dart';
// import '../utils/app_shared_preferences.dart';
// import 'logger_service.dart';

// class MapsServices {
//   static Future<List<LatLng>> getRoute(double fromLat, double fromLng,
//       double toLat, double toLng, String apiKey) async {
//     final url =
//         'https://api.openrouteservice.org/v2/directions/driving-car?api_key=$apiKey&start=$fromLng,$fromLat&end=$toLng,$toLat';
//     final response = await http.get(Uri.parse(url));
//     if (response.statusCode == 200) {
//       final data = json.decode(response.body);
//       final List<dynamic> coordinates =
//           data['features'][0]['geometry']['coordinates'];
//       return coordinates.map((coord) => LatLng(coord[1], coord[0])).toList();
//     } else {
//       throw Exception('Failed to load route');
//     }
//   }

//   static Future<LatLng> getLatLngFromNominatimLink(String link) async {
//     final response = await http.get(Uri.parse(link));
//     if (response.statusCode == 200) {
//       final List<dynamic> data = json.decode(response.body);
//       if (data.isNotEmpty) {
//         final firstResult = data[0];
//         return LatLng(
//           double.parse(firstResult['lat']),
//           double.parse(firstResult['lon']),
//         );
//       } else {
//         throw Exception('No results found');
//       }
//     } else {
//       throw Exception('Failed to get Nominatim data');
//     }
//   }
// }

// class MapScreen extends StatefulWidget {
//   const MapScreen({
//     super.key,
//     required this.pickupLocationNominatimLink,
//     required this.destinationLocationNominatimLink,
//   });
//   final String pickupLocationNominatimLink;
//   final String destinationLocationNominatimLink;

//   @override
//   State<MapScreen> createState() => _MapScreenState();
// }

// class _MapScreenState extends State<MapScreen> {
//   LatLng? _fromLocation;
//   LatLng? _toLocation;
//   final MapController _mapController = MapController();
//   LocationData? _currentLocation;
//   List<LatLng> _routePoints = [];
//   final String mapToken = AppConstants.mapToken;
//   bool _locationsLoaded = false;
//   final Location _location = Location();
//   StreamSubscription<LocationData>? _locationSubscription;

//   @override
//   void initState() {
//     super.initState();
//     _fetchLocations();
//     _startLocationUpdates();
//   }

//   Future<void> _fetchLocations() async {
//     try {
//       final fromLocation = await MapsServices.getLatLngFromNominatimLink(
//           widget.pickupLocationNominatimLink);
//       final toLocation = await MapsServices.getLatLngFromNominatimLink(
//           widget.destinationLocationNominatimLink);
//       setState(() {
//         _fromLocation = fromLocation;
//         _toLocation = toLocation;
//         _locationsLoaded = true;
//       });
//       _getRoute();
//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Error fetching locations: $e')),
//       );
//     }
//   }

//   Future<void> _getRoute() async {
//     if (_fromLocation == null || _toLocation == null) return;

//     try {
//       _routePoints = await MapsServices.getRoute(
//         _fromLocation!.latitude,
//         _fromLocation!.longitude,
//         _toLocation!.latitude,
//         _toLocation!.longitude,
//         mapToken,
//       );
//       setState(() {});
//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Error fetching route: $e')),
//       );
//       _routePoints = [];
//     }
//   }

//   Future<void> _startLocationUpdates() async {
//     bool serviceEnabled;
//     PermissionStatus permissionGranted;

//     serviceEnabled = await _location.serviceEnabled();
//     if (!serviceEnabled) {
//       serviceEnabled = await _location.requestService();
//       if (!serviceEnabled) return;
//     }

//     permissionGranted = await _location.hasPermission();
//     if (permissionGranted == PermissionStatus.denied) {
//       permissionGranted = await _location.requestPermission();
//       if (permissionGranted != PermissionStatus.granted) return;
//     }

//     _location.changeSettings(
//       accuracy: LocationAccuracy.high,
//       interval: 1000,
//       distanceFilter: 10,
//     );

//     _locationSubscription =
//         _location.onLocationChanged.listen((LocationData locationData) async {
//       setState(() {
//         _currentLocation = locationData;
//       });

//       try {
//         final response = await http.post(
//           Uri.parse(
//               'https://example.com/update-location'), //TODO استبدلها بالـ endpoint بتاعك
//           headers: {
//             'Content-Type': 'application/json',
//             'Authorization':
//                 'Bearer ${await AppPreferences.getSecureData(AppSharedPrefConsts.userToken)}'
//           },
//           body: json.encode({
//             'latitude': locationData.latitude,
//             'longitude': locationData.longitude,
//           }),
//         );
//         AppLogger.d('تم إرسال تحديث الموقع: ${response.statusCode}');
//       } catch (e) {
//         AppLogger.e('خطأ في إرسال تحديث الموقع: $e');
//       }
//     });
//   }

//   @override
//   void dispose() {
//     _locationSubscription?.cancel();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     if (!_locationsLoaded || _fromLocation == null || _toLocation == null) {
//       return const Scaffold(
//         body: Center(
//           child: CircularProgressIndicator(),
//         ),
//       );
//     }

//     return Scaffold(
//       floatingActionButton: _currentLocation != null
//           ? FloatingActionButton(
//               onPressed: () {
//                 _mapController.move(
//                     LatLng(_currentLocation!.latitude!,
//                         _currentLocation!.longitude!),
//                     18.0);
//               },
//               child:
//                   const Icon(Icons.my_location, color: AppColor.primaryColor),
//             )
//           : null,
//       body: FlutterMap(
//         mapController: _mapController,
//         options: MapOptions(
//           initialCenter: _fromLocation!,
//           initialZoom: 13.0,
//         ),
//         children: [
//           TileLayer(
//             urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
//             subdomains: const ['a', 'b', 'c'],
//           ),
//           if (_routePoints.isNotEmpty)
//             PolylineLayer(
//               polylines: [
//                 Polyline(
//                   points: _routePoints,
//                   strokeWidth: 4.0,
//                   color: Colors.blue,
//                 ),
//               ],
//             ),
//           MarkerLayer(
//             markers: [
//               Marker(
//                 width: 80.0,
//                 height: 80.0,
//                 point: _fromLocation!,
//                 child:
//                     const Icon(Icons.location_on, color: Colors.red, size: 40),
//               ),
//               Marker(
//                 width: 80.0,
//                 height: 80.0,
//                 point: _toLocation!,
//                 child:
//                     const Icon(Icons.location_on, color: Colors.blue, size: 40),
//               ),
//               if (_currentLocation != null)
//                 Marker(
//                   width: 80.0,
//                   height: 80.0,
//                   point: LatLng(_currentLocation!.latitude!,
//                       _currentLocation!.longitude!),
//                   child: const Icon(Icons.my_location,
//                       color: Colors.green, size: 40),
//                 ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }

//******************تاني طريقة*************** */

import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:http/http.dart' as http;
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart';

import '../constants/app_constants.dart';
import '../network/endpoint_constants.dart';
import '../theme/app_colors.dart';
import '../utils/app_shared_pref_consts.dart';
import '../utils/app_shared_preferences.dart';
import 'logger_service.dart';

class MapsServices {
  static Future<List<LatLng>> getRoute(double fromLat, double fromLng,
      double toLat, double toLng, String apiKey) async {
    final url =
        'https://api.openrouteservice.org/v2/directions/driving-car?api_key=$apiKey&start=$fromLng,$fromLat&end=$toLng,$toLat';

    final response = await http.get(
      Uri.parse(url),
      headers: {'timeout': '30'},
    ).timeout(
      const Duration(seconds: 30),
      onTimeout: () => throw TimeoutException('Route request timeout'),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List<dynamic> coordinates =
          data['features'][0]['geometry']['coordinates'];
      return coordinates.map((coord) => LatLng(coord[1], coord[0])).toList();
    } else {
      throw Exception('Failed to load route: ${response.statusCode}');
    }
  }

  static Future<LatLng> getLatLngFromNominatimLink(String link) async {
    final response = await http
        .get(
          Uri.parse(link),
        )
        .timeout(
          const Duration(seconds: 30),
          onTimeout: () => throw TimeoutException('Nominatim request timeout'),
        );

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
      throw Exception('Failed to get Nominatim data: ${response.statusCode}');
    }
  }

  static double calculateDistance(LatLng point1, LatLng point2) {
    const double earthRadius = 6371000; // متر
    final double lat1Rad = point1.latitude * (pi / 180);
    final double lat2Rad = point2.latitude * (pi / 180);
    final double deltaLat = (point2.latitude - point1.latitude) * (pi / 180);
    final double deltaLng = (point2.longitude - point1.longitude) * (pi / 180);

    final double a = sin(deltaLat / 2) * sin(deltaLat / 2) +
        cos(lat1Rad) * cos(lat2Rad) * sin(deltaLng / 2) * sin(deltaLng / 2);
    final double c = 2 * atan2(sqrt(a), sqrt(1 - a));

    return earthRadius * c;
  }

  static Future<bool> sendLocationUpdate({
    required double latitude,
    required double longitude,
    String? driverId,
    String? tripId,
    int retryCount = 3,
  }) async {
    final String? token =
        await AppPreferences.getSecureData(AppSharedPrefConsts.userToken);

    if (token == null) {
      AppLogger.e('No authentication token found');
      return false;
    }

    for (int attempt = 0; attempt < retryCount; attempt++) {
      try {
        final response = await http
            .post(
              Uri.parse(ApiConstants.tripLocation),
              headers: {
                'Content-Type': 'application/json',
                'Authorization': 'Bearer $token',
              },
              body: json.encode({
                'latitude': latitude,
                'longitude': longitude,
                'timestamp': DateTime.now(),
                'driver_id': driverId,
                'trip_id': tripId,
                'accuracy': 'high',
              }),
            )
            .timeout(
              const Duration(seconds: 15),
              onTimeout: () =>
                  throw TimeoutException('Location update timeout'),
            );

        if (response.statusCode == 200 || response.statusCode == 201) {
          AppLogger.d('Location updated successfully: ${response.statusCode}');
          return true;
        } else {
          AppLogger.w(
              'Location update failed: ${response.statusCode} - ${response.body}');
          if (response.statusCode >= 400 && response.statusCode < 500) {
            // Client error - don't retry
            return false;
          }
        }
      } catch (e) {
        AppLogger.e('Location update attempt ${attempt + 1} failed: $e');
        if (attempt == retryCount - 1) {
          return false;
        }
        // Wait before retry
        await Future.delayed(Duration(seconds: (attempt + 1) * 2));
      }
    }
    return false;
  }
}

class LocationTracker {
  static const double _minimumDistance = 10.0; // 10 متر
  static const Duration _locationTimeout = Duration(seconds: 30);

  LatLng? _lastSentLocation;
  Timer? _periodicTimer;
  StreamSubscription<LocationData>? _locationSubscription;
  final Location _location = Location();
  bool _isTracking = false;

  // Callback functions
  Function(LatLng)? onLocationUpdate;
  Function(String)? onError;

  bool get isTracking => _isTracking;

  Future<bool> startTracking({
    Function(LatLng)? onLocationUpdate,
    Function(String)? onError,
    String? driverId,
    String? tripId,
  }) async {
    if (_isTracking) return true;

    this.onLocationUpdate = onLocationUpdate;
    this.onError = onError;

    try {
      bool serviceEnabled = await _location.serviceEnabled();
      if (!serviceEnabled) {
        serviceEnabled = await _location.requestService();
        if (!serviceEnabled) {
          onError?.call('Location service not enabled');
          return false;
        }
      }

      PermissionStatus permissionGranted = await _location.hasPermission();
      if (permissionGranted == PermissionStatus.denied) {
        permissionGranted = await _location.requestPermission();
        if (permissionGranted != PermissionStatus.granted) {
          onError?.call('Location permission not granted');
          return false;
        }
      }

      await _location.changeSettings(
        accuracy: LocationAccuracy.high,
        interval: 5000,
        distanceFilter: 5,
      );

      _locationSubscription =
          _location.onLocationChanged.timeout(_locationTimeout).listen(
        (LocationData locationData) {
          _handleLocationUpdate(locationData, driverId, tripId);
        },
        onError: (error) {
          AppLogger.e('Location tracking error: $error');
          onError?.call(error.toString());
        },
      );

      _isTracking = true;
      AppLogger.d('Location tracking started successfully');
      return true;
    } catch (e) {
      AppLogger.e('Failed to start location tracking: $e');
      onError?.call(e.toString());
      return false;
    }
  }

  void _handleLocationUpdate(
      LocationData locationData, String? driverId, String? tripId) {
    if (locationData.latitude == null || locationData.longitude == null) {
      return;
    }

    final currentLocation =
        LatLng(locationData.latitude!, locationData.longitude!);

    // تحديث UI
    onLocationUpdate?.call(currentLocation);

    // تحقق من المسافة قبل الإرسال
    if (_shouldSendUpdate(currentLocation)) {
      _sendLocationToServer(currentLocation, driverId, tripId);
    }
  }

  bool _shouldSendUpdate(LatLng currentLocation) {
    if (_lastSentLocation == null) {
      return true; // أول تحديث
    }

    final distance =
        MapsServices.calculateDistance(_lastSentLocation!, currentLocation);
    return distance >= _minimumDistance;
  }

  void _sendLocationToServer(
      LatLng location, String? driverId, String? tripId) async {
    try {
      final success = await MapsServices.sendLocationUpdate(
        latitude: location.latitude,
        longitude: location.longitude,
        driverId: driverId,
        tripId: tripId,
      );

      if (success) {
        _lastSentLocation = location;
        AppLogger.d(
            'Location sent: ${location.latitude}, ${location.longitude}');
      } else {
        AppLogger.w('Failed to send location update');
      }
    } catch (e) {
      AppLogger.e('Error sending location: $e');
      onError?.call('Failed to send location update');
    }
  }

  void stopTracking() {
    _isTracking = false;
    _locationSubscription?.cancel();
    _periodicTimer?.cancel();
    _lastSentLocation = null;
    AppLogger.d('Location tracking stopped');
  }

  void dispose() {
    stopTracking();
  }
}

class MapScreen extends StatefulWidget {
  const MapScreen({
    super.key,
    required this.pickupLocationNominatimLink,
    required this.destinationLocationNominatimLink,
    this.driverId,
    this.tripId,
  });

  final String pickupLocationNominatimLink;
  final String destinationLocationNominatimLink;
  final String? driverId;
  final String? tripId;

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

  // ✅ استخدام الـ Location Tracker الجديد
  final LocationTracker _locationTracker = LocationTracker();
  bool _isLocationTrackingActive = false;

  @override
  void initState() {
    super.initState();
    _fetchLocations();
    _startLocationTracking();
  }

  @override
  void dispose() {
    _locationTracker.dispose();
    super.dispose();
  }

  Future<void> _fetchLocations() async {
    try {
      final fromLocation = await MapsServices.getLatLngFromNominatimLink(
          widget.pickupLocationNominatimLink);
      final toLocation = await MapsServices.getLatLngFromNominatimLink(
          widget.destinationLocationNominatimLink);

      if (mounted) {
        setState(() {
          _fromLocation = fromLocation;
          _toLocation = toLocation;
          _locationsLoaded = true;
        });
        _getRoute();
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error fetching locations: $e')),
        );
      }
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
      if (mounted) {
        setState(() {});
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error fetching route: $e')),
        );
      }
      _routePoints = [];
    }
  }

  Future<void> _startLocationTracking() async {
    final success = await _locationTracker.startTracking(
      driverId: widget.driverId,
      tripId: widget.tripId,
      onLocationUpdate: (LatLng location) {
        if (mounted) {
          setState(() {
            _currentLocation = LocationData.fromMap({
              'latitude': location.latitude,
              'longitude': location.longitude,
            });
          });
        }
      },
      onError: (String error) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Location tracking error: $error')),
          );
        }
      },
    );

    if (mounted) {
      setState(() {
        _isLocationTrackingActive = success;
      });
    }
  }

  void _moveToCurrentLocation() {
    if (_currentLocation != null) {
      _mapController.move(
        LatLng(_currentLocation!.latitude!, _currentLocation!.longitude!),
        18.0,
      );
    }
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
              onPressed: _moveToCurrentLocation,
              child: Icon(
                Icons.my_location,
                color: _isLocationTrackingActive
                    ? AppColor.primaryColor
                    : Colors.grey,
              ),
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
                child:
                    const Icon(Icons.location_on, color: Colors.red, size: 40),
              ),
              Marker(
                width: 80.0,
                height: 80.0,
                point: _toLocation!,
                child:
                    const Icon(Icons.location_on, color: Colors.blue, size: 40),
              ),
              if (_currentLocation != null)
                Marker(
                  width: 80.0,
                  height: 80.0,
                  point: LatLng(_currentLocation!.latitude!,
                      _currentLocation!.longitude!),
                  child: Icon(Icons.my_location,
                      color: _isLocationTrackingActive
                          ? Colors.green
                          : Colors.orange,
                      size: 40),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
