// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:flutter_map/flutter_map.dart';
// import 'package:latlong2/latlong.dart';
// import 'package:location/location.dart';

// import '../../constants/app_constants.dart';
// import '../../theme/app_colors.dart';
// import '../../theme/app_shadows.dart';
// import '../logger_service.dart';
// import 'location_tracker.dart';
// import 'maps_services.dart';

// /// Main map screen widget for displaying trip routes and navigation
// class MapScreen extends StatefulWidget {
//   const MapScreen({
//     super.key,
//     required this.pickupLocationNominatimLink,
//     required this.destinationLocationNominatimLink,
//     this.driverId,
//     this.tripId,
//   });

//   final String pickupLocationNominatimLink;
//   final String destinationLocationNominatimLink;
//   final String? driverId;
//   final String? tripId;

//   @override
//   State<MapScreen> createState() => _MapScreenState();
// }

// class _MapScreenState extends State<MapScreen> {
//   // Map and location controllers
//   final MapController _mapController = MapController();
//   final LocationTracker _locationTracker = LocationTracker();

//   // Location data
//   LatLng? _pickupLocation;
//   LatLng? _destinationLocation;
//   LocationData? _currentLocation;

//   // Route data
//   List<LatLng> _currentToPickupRoute = [];
//   List<LatLng> _pickupToDestinationRoute = [];
//   List<LatLng> _currentToDestinationRoute = [];

//   // State flags
//   bool _locationsLoaded = false;
//   bool _hasReachedPickup = false;
//   bool _isLocationTrackingActive = false;

//   // Configuration
//   static const double _pickupReachThreshold = 50.0;
//   static const double _mapZoom = 13.0;
//   static const double _currentLocationZoom = 18.0;

//   // Distance tracking
//   double _remainingDistance = 0.0;

//   @override
//   void initState() {
//     super.initState();
//     _initializeMap();
//   }

//   @override
//   void dispose() {
//     _locationTracker.dispose();
//     super.dispose();
//   }

//   /// Initializes the map by fetching locations and starting tracking
//   Future<void> _initializeMap() async {
//     await _fetchLocations();
//     await _startLocationTracking();
//   }

//   /// Fetches pickup and destination locations from Nominatim links
//   Future<void> _fetchLocations() async {
//     try {
//       final results = await Future.wait([
//         MapsServices.getLatLngFromNominatimLink(widget.pickupLocationNominatimLink),
//         MapsServices.getLatLngFromNominatimLink(widget.destinationLocationNominatimLink),
//       ]);

//       if (mounted) {
//         setState(() {
//           _pickupLocation = results[0];
//           _destinationLocation = results[1];
//           _locationsLoaded = true;
//         });
//         await _getInitialRoutes();
//       }
//     } catch (e) {
//       _showError('Error fetching locations: $e');
//     }
//   }

//   /// Gets initial route from pickup to destination
//   Future<void> _getInitialRoutes() async {
//     if (_pickupLocation == null || _destinationLocation == null) return;

//     try {
//       _pickupToDestinationRoute = await MapsServices.getRoute(
//         fromLat: _pickupLocation!.latitude,
//         fromLng: _pickupLocation!.longitude,
//         toLat: _destinationLocation!.latitude,
//         toLng: _destinationLocation!.longitude,
//         apiKey: AppConstants.mapToken,
//       );

//       if (mounted) {
//         setState(() {});
//       }
//     } catch (e) {
//       _showError('Error fetching route: $e');
//     }
//   }

//   /// Starts location tracking
//   Future<void> _startLocationTracking() async {
//     final success = await _locationTracker.startTracking(
//       driverId: widget.driverId,
//       tripId: widget.tripId,
//       onLocationUpdate: _handleLocationUpdate,
//       onError: _handleLocationError,
//     );

//     if (mounted) {
//       setState(() {
//         _isLocationTrackingActive = success;
//       });
//     }
//   }

//   /// Handles location updates from the location tracker
//   void _handleLocationUpdate(LatLng location) {
//     if (!mounted) return;

//     setState(() {
//       _currentLocation = LocationData.fromMap({
//         'latitude': location.latitude,
//         'longitude': location.longitude,
//       });
//     });

//     _updateRoutesBasedOnCurrentLocation(location);
//   }

//   /// Handles location tracking errors
//   void _handleLocationError(String error) {
//     if (mounted) {
//       _showError('Location tracking error: $error');
//     }
//   }

//   /// Updates routes based on current location and pickup status
//   Future<void> _updateRoutesBasedOnCurrentLocation(LatLng currentLocation) async {
//     if (_pickupLocation == null || _destinationLocation == null) return;

//     _calculateRemainingDistance(currentLocation);

//     try {
//       if (!_hasReachedPickup) {
//         await _handlePrePickupRouting(currentLocation);
//       }

//       if (_hasReachedPickup) {
//         await _handlePostPickupRouting(currentLocation);
//       }

//       if (mounted) {
//         setState(() {});
//       }
//     } catch (e) {
//       AppLogger.e('Error updating routes: $e');
//     }
//   }

//   /// Handles routing before reaching pickup location
//   Future<void> _handlePrePickupRouting(LatLng currentLocation) async {
//     final distanceToPickup = MapsServices.calculateDistance(
//       currentLocation,
//       _pickupLocation!,
//     );

//     if (distanceToPickup <= _pickupReachThreshold) {
//       setState(() {
//         _hasReachedPickup = true;
//         _currentToPickupRoute = [];
//       });
//       AppLogger.d('Reached pickup location!');
//     } else {
//       _currentToPickupRoute = await MapsServices.getRoute(
//         fromLat: currentLocation.latitude,
//         fromLng: currentLocation.longitude,
//         toLat: _pickupLocation!.latitude,
//         toLng: _pickupLocation!.longitude,
//         apiKey: AppConstants.mapToken,
//       );
//     }
//   }

//   /// Handles routing after reaching pickup location
//   Future<void> _handlePostPickupRouting(LatLng currentLocation) async {
//     _currentToDestinationRoute = await MapsServices.getRoute(
//       fromLat: currentLocation.latitude,
//       fromLng: currentLocation.longitude,
//       toLat: _destinationLocation!.latitude,
//       toLng: _destinationLocation!.longitude,
//       apiKey: AppConstants.mapToken,
//     );
//   }

//   /// Calculates remaining distance to target location
//   void _calculateRemainingDistance(LatLng currentLocation) {
//     if (_pickupLocation == null || _destinationLocation == null) return;

//     final targetLocation = _hasReachedPickup ? _destinationLocation! : _pickupLocation!;
//     final distance = MapsServices.calculateDistance(currentLocation, targetLocation);

//     setState(() {
//       _remainingDistance = distance;
//     });
//   }

//   /// Formats distance for display
//   String _formatDistance(double distanceInMeters) {
//     if (distanceInMeters < 1000) {
//       return '${distanceInMeters.toInt()} m';
//     } else {
//       return '${(distanceInMeters / 1000).toStringAsFixed(1)} km';
//     }
//   }

//   /// Moves map to current location
//   void _moveToCurrentLocation() {
//     if (_currentLocation != null) {
//       _mapController.move(
//         LatLng(_currentLocation!.latitude!, _currentLocation!.longitude!),
//         _currentLocationZoom,
//       );
//     }
//   }

//   /// Shows error message to user
//   void _showError(String message) {
//     if (mounted) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text(message)),
//       );
//     }
//   }

//   /// Builds the status floating action button
//   Widget _buildStatusFab() {
//     return Container(
//       padding: const EdgeInsets.all(12.0),
//       margin: const EdgeInsets.only(bottom: 10),
//       decoration: BoxDecoration(
//         color: _hasReachedPickup ? Colors.green : Colors.orange,
//         borderRadius: BorderRadius.circular(8),
//         boxShadow: AppShadows.primaryShadow,
//       ),
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Text(
//             _hasReachedPickup ? 'Going to destination' : 'Picking up',
//             style: const TextStyle(
//               color: Colors.white,
//               fontSize: 12,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           if (_currentLocation != null) ...[
//             const SizedBox(height: 4),
//             Row(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 const Icon(Icons.location_on, color: Colors.white, size: 14),
//                 const SizedBox(width: 4),
//                 Text(
//                   'Remaining ${_formatDistance(_remainingDistance)}',
//                   style: const TextStyle(color: Colors.white, fontSize: 11),
//                 ),
//               ],
//             ),
//           ],
//           const SizedBox(height: 8),
//           if (_currentLocation != null)
//             FloatingActionButton(
//               onPressed: _moveToCurrentLocation,
//               backgroundColor: Colors.white,
//               child: Icon(
//                 Icons.my_location,
//                 color: _isLocationTrackingActive ? AppColor.primaryColor : Colors.grey,
//               ),
//             ),
//         ],
//       ),
//     );
//   }

//   /// Builds the polyline layer for routes
//   PolylineLayer _buildPolylineLayer() {
//     return PolylineLayer(
//       polylines: [
//         // Pickup to destination route (shown when not reached pickup)
//         if (_pickupToDestinationRoute.isNotEmpty && !_hasReachedPickup)
//           Polyline(
//             points: _pickupToDestinationRoute,
//             strokeWidth: 4.0,
//             color: AppColor.blue,
//           ),
//         // Current to pickup route
//         if (_currentToPickupRoute.isNotEmpty && !_hasReachedPickup)
//           Polyline(
//             points: _currentToPickupRoute,
//             strokeWidth: 4.0,
//             color: Colors.red,
//           ),
//         // Current to destination route
//         if (_currentToDestinationRoute.isNotEmpty && _hasReachedPickup)
//           Polyline(
//             points: _currentToDestinationRoute,
//             strokeWidth: 4.0,
//             color: Colors.blue,
//           ),
//       ],
//     );
//   }

//   /// Builds the marker layer for locations
//   MarkerLayer _buildMarkerLayer() {
//     return MarkerLayer(
//       markers: [
//         // Pickup location marker
//         if (_pickupLocation != null)
//           Marker(
//             width: 80.0,
//             height: 80.0,
//             point: _pickupLocation!,
//             child: Icon(
//               Icons.location_on,
//               color: _hasReachedPickup ? Colors.grey : Colors.red,
//               size: 40,
//             ),
//           ),
//         // Destination marker
//         if (_destinationLocation != null)
//           Marker(
//             width: 80.0,
//             height: 80.0,
//             point: _destinationLocation!,
//             child: const Icon(Icons.flag, color: Colors.blue, size: 40),
//           ),
//         // Current location marker
//         if (_currentLocation != null)
//           Marker(
//             width: 80.0,
//             height: 80.0,
//             point: LatLng(_currentLocation!.latitude!, _currentLocation!.longitude!),
//             child: Icon(
//               Icons.my_location,
//               color: _isLocationTrackingActive ? Colors.green : Colors.orange,
//               size: 40,
//             ),
//           ),
//       ],
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     // Show loading screen while fetching locations
//     if (!_locationsLoaded || _pickupLocation == null || _destinationLocation == null) {
//       return const Scaffold(
//         body: Center(
//           child: CircularProgressIndicator(),
//         ),
//       );
//     }

//     return Scaffold(
//       floatingActionButton: _buildStatusFab(),
//       body: FlutterMap(
//         mapController: _mapController,
//         options: MapOptions(
//           initialCenter: _pickupLocation!,
//           initialZoom: _mapZoom,
//         ),
//         children: [
//           TileLayer(
//             urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
//             subdomains: const ['a', 'b', 'c'],
//           ),
//           _buildPolylineLayer(),
//           _buildMarkerLayer(),
//         ],
//       ),
//     );
//   }
// }


// map_screen.dart
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart';

import '../../constants/app_constants.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_shadows.dart';
import '../logger_service.dart';
import 'location_tracker.dart';
import 'maps_services.dart';

/// Main map screen widget for displaying trip routes and navigation
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
  // Map and location controllers
  final MapController _mapController = MapController();
  final LocationTracker _locationTracker = LocationTracker();

  // Location data
  LatLng? _pickupLocation;
  LatLng? _destinationLocation;
  LocationData? _currentLocation;

  // Route data
  List<LatLng> _currentToPickupRoute = [];
  List<LatLng> _pickupToDestinationRoute = [];
  List<LatLng> _currentToDestinationRoute = [];

  // State flags
  bool _locationsLoaded = false;
  bool _hasReachedPickup = false;
  bool _isLocationTrackingActive = false;

  // Configuration
  static const double _pickupReachThreshold = 50.0;
  static const double _mapZoom = 13.0;
  static const double _currentLocationZoom = 18.0;

  // Distance tracking
  double _remainingDistance = 0.0;

  @override
  void initState() {
    super.initState();
    _initializeMap();
  }

  @override
  void dispose() {
    _locationTracker.dispose();
    super.dispose();
  }

  /// Initializes the map by fetching locations and starting tracking
  Future<void> _initializeMap() async {
    await _fetchLocations();
    await _startLocationTracking();
  }

  /// Fetches pickup and destination locations from Nominatim links
  Future<void> _fetchLocations() async {
    try {
      final results = await Future.wait([
        MapsServices.getLatLngFromNominatimLink(widget.pickupLocationNominatimLink),
        MapsServices.getLatLngFromNominatimLink(widget.destinationLocationNominatimLink),
      ]);

      if (mounted) {
        setState(() {
          _pickupLocation = results[0];
          _destinationLocation = results[1];
          _locationsLoaded = true;
        });
        await _getInitialRoutes();
      }
    } catch (e) {
      _showError('Error fetching locations: $e');
    }
  }

  /// Gets initial route from pickup to destination
  Future<void> _getInitialRoutes() async {
    if (_pickupLocation == null || _destinationLocation == null) return;

    try {
      _pickupToDestinationRoute = await MapsServices.getRoute(
        fromLat: _pickupLocation!.latitude,
        fromLng: _pickupLocation!.longitude,
        toLat: _destinationLocation!.latitude,
        toLng: _destinationLocation!.longitude,
        apiKey: AppConstants.mapToken,
      );

      if (mounted) {
        setState(() {});
      }
    } catch (e) {
      _showError('Error fetching route: $e');
    }
  }

  /// Starts location tracking
  Future<void> _startLocationTracking() async {
    final success = await _locationTracker.startTracking(
      driverId: widget.driverId,
      tripId: widget.tripId,
      pickupLocation: _pickupLocation,
      destinationLocation: _destinationLocation,
      onLocationUpdate: _handleLocationUpdate,
      onError: _handleLocationError,
    );

    if (mounted) {
      setState(() {
        _isLocationTrackingActive = success;
      });
    }
  }

  /// Handles location updates from the location tracker
  void _handleLocationUpdate(LatLng location) {
    if (!mounted) return;

    setState(() {
      _currentLocation = LocationData.fromMap({
        'latitude': location.latitude,
        'longitude': location.longitude,
      });
    });

    _updateRoutesBasedOnCurrentLocation(location);
  }

  /// Handles location tracking errors
  void _handleLocationError(String error) {
    if (mounted) {
      _showError('Location tracking error: $error');
    }
  }

  /// Updates routes based on current location and pickup status
  Future<void> _updateRoutesBasedOnCurrentLocation(LatLng currentLocation) async {
    if (_pickupLocation == null || _destinationLocation == null) return;

    _calculateRemainingDistance(currentLocation);

    try {
      if (!_hasReachedPickup) {
        await _handlePrePickupRouting(currentLocation);
      }

      if (_hasReachedPickup) {
        await _handlePostPickupRouting(currentLocation);
      }

      if (mounted) {
        setState(() {});
      }
    } catch (e) {
      AppLogger.e('Error updating routes: $e');
    }
  }

  /// Handles routing before reaching pickup location
  Future<void> _handlePrePickupRouting(LatLng currentLocation) async {
    final distanceToPickup = MapsServices.calculateDistance(
      currentLocation,
      _pickupLocation!,
    );

    if (distanceToPickup <= _pickupReachThreshold) {
      setState(() {
        _hasReachedPickup = true;
        _currentToPickupRoute = [];
      });
      
      // Update location tracker about pickup status
      _locationTracker.setPickupReached(true);
      
      AppLogger.d('Reached pickup location!');
    } else {
      _currentToPickupRoute = await MapsServices.getRoute(
        fromLat: currentLocation.latitude,
        fromLng: currentLocation.longitude,
        toLat: _pickupLocation!.latitude,
        toLng: _pickupLocation!.longitude,
        apiKey: AppConstants.mapToken,
      );
    }
  }

  /// Handles routing after reaching pickup location
  Future<void> _handlePostPickupRouting(LatLng currentLocation) async {
    _currentToDestinationRoute = await MapsServices.getRoute(
      fromLat: currentLocation.latitude,
      fromLng: currentLocation.longitude,
      toLat: _destinationLocation!.latitude,
      toLng: _destinationLocation!.longitude,
      apiKey: AppConstants.mapToken,
    );
  }

  /// Calculates remaining distance to target location
  void _calculateRemainingDistance(LatLng currentLocation) {
    if (_pickupLocation == null || _destinationLocation == null) return;

    final targetLocation = _hasReachedPickup ? _destinationLocation! : _pickupLocation!;
    final distance = MapsServices.calculateDistance(currentLocation, targetLocation);

    setState(() {
      _remainingDistance = distance;
    });
  }

  /// Formats distance for display
  String _formatDistance(double distanceInMeters) {
    if (distanceInMeters < 1000) {
      return '${distanceInMeters.toInt()} m';
    } else {
      return '${(distanceInMeters / 1000).toStringAsFixed(1)} km';
    }
  }

  /// Moves map to current location
  void _moveToCurrentLocation() {
    if (_currentLocation != null) {
      _mapController.move(
        LatLng(_currentLocation!.latitude!, _currentLocation!.longitude!),
        _currentLocationZoom,
      );
    }
  }

  /// Shows error message to user
  void _showError(String message) {
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(message)),
      );
    }
  }

  /// Builds the status floating action button
  Widget _buildStatusFab() {
    return Container(
      padding: const EdgeInsets.all(12.0),
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: _hasReachedPickup ? Colors.green : Colors.orange,
        borderRadius: BorderRadius.circular(8),
        boxShadow: AppShadows.primaryShadow,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            _hasReachedPickup ? 'Going to destination' : 'Picking up',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
          if (_currentLocation != null) ...[
            const SizedBox(height: 4),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.location_on, color: Colors.white, size: 14),
                const SizedBox(width: 4),
                Text(
                  'Remaining ${_formatDistance(_remainingDistance)}',
                  style: const TextStyle(color: Colors.white, fontSize: 11),
                ),
              ],
            ),
          ],
          const SizedBox(height: 8),
          if (_currentLocation != null)
            FloatingActionButton(
              onPressed: _moveToCurrentLocation,
              backgroundColor: Colors.white,
              child: Icon(
                Icons.my_location,
                color: _isLocationTrackingActive ? AppColor.primaryColor : Colors.grey,
              ),
            ),
        ],
      ),
    );
  }

  /// Builds the polyline layer for routes
  PolylineLayer _buildPolylineLayer() {
    return PolylineLayer(
      polylines: [
        // Pickup to destination route (shown when not reached pickup)
        if (_pickupToDestinationRoute.isNotEmpty && !_hasReachedPickup)
          Polyline(
            points: _pickupToDestinationRoute,
            strokeWidth: 4.0,
            color: AppColor.blue,
          ),
        // Current to pickup route
        if (_currentToPickupRoute.isNotEmpty && !_hasReachedPickup)
          Polyline(
            points: _currentToPickupRoute,
            strokeWidth: 4.0,
            color: Colors.red,
          ),
        // Current to destination route
        if (_currentToDestinationRoute.isNotEmpty && _hasReachedPickup)
          Polyline(
            points: _currentToDestinationRoute,
            strokeWidth: 4.0,
            color: Colors.blue,
          ),
      ],
    );
  }

  /// Builds the marker layer for locations
  MarkerLayer _buildMarkerLayer() {
    return MarkerLayer(
      markers: [
        // Pickup location marker
        if (_pickupLocation != null)
          Marker(
            width: 80.0,
            height: 80.0,
            point: _pickupLocation!,
            child: Icon(
              Icons.location_on,
              color: _hasReachedPickup ? Colors.grey : Colors.red,
              size: 40,
            ),
          ),
        // Destination marker
        if (_destinationLocation != null)
          Marker(
            width: 80.0,
            height: 80.0,
            point: _destinationLocation!,
            child: const Icon(Icons.flag, color: Colors.blue, size: 40),
          ),
        // Current location marker
        if (_currentLocation != null)
          Marker(
            width: 80.0,
            height: 80.0,
            point: LatLng(_currentLocation!.latitude!, _currentLocation!.longitude!),
            child: Icon(
              Icons.my_location,
              color: _isLocationTrackingActive ? Colors.green : Colors.orange,
              size: 40,
            ),
          ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    // Show loading screen while fetching locations
    if (!_locationsLoaded || _pickupLocation == null || _destinationLocation == null) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return Scaffold(
      floatingActionButton: _buildStatusFab(),
      body: FlutterMap(
        mapController: _mapController,
        options: MapOptions(
          initialCenter: _pickupLocation!,
          initialZoom: _mapZoom,
        ),
        children: [
          TileLayer(
            urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
            subdomains: const ['a', 'b', 'c'],
          ),
          _buildPolylineLayer(),
          _buildMarkerLayer(),
        ],
      ),
    );
  }
}