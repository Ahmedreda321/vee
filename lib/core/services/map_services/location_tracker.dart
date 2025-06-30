// import 'dart:async';

// import 'package:latlong2/latlong.dart';
// import 'package:location/location.dart';

// import '../logger_service.dart';
// import 'maps_services.dart';

// /// Handles real-time location tracking and updates
// class LocationTracker {
//   // Configuration constants
//   static const double _minimumDistanceThreshold = 10.0;
//   static const Duration _locationTimeout = Duration(seconds: 30);
//   static const int _locationInterval = 5000; // milliseconds
//   static const double _distanceFilter = 5.0; // meters

//   // Private fields
//   LatLng? _lastSentLocation;
//   Timer? _periodicTimer;
//   StreamSubscription<LocationData>? _locationSubscription;
//   final Location _location = Location();
//   bool _isTracking = false;

//   // Callbacks
//   Function(LatLng)? _onLocationUpdate;
//   Function(String)? _onError;

//   // Getters
//   bool get isTracking => _isTracking;
//   LatLng? get lastSentLocation => _lastSentLocation;

//   /// Starts location tracking with proper permissions and configuration
//   Future<bool> startTracking({
//     Function(LatLng)? onLocationUpdate,
//     Function(String)? onError,
//     String? driverId,
//     String? tripId,
//   }) async {
//     if (_isTracking) {
//       AppLogger.w('Location tracking is already active');
//       return true;
//     }

//     _onLocationUpdate = onLocationUpdate;
//     _onError = onError;

//     try {
//       // Check and request permissions
//       final permissionsGranted = await _ensurePermissions();
//       if (!permissionsGranted) {
//         return false;
//       }

//       // Configure location settings
//       await _configureLocationSettings();

//       // Start listening to location changes
//       _startLocationListener(driverId, tripId);

//       _isTracking = true;
//       AppLogger.d('Location tracking started successfully');
//       return true;
//     } catch (e) {
//       AppLogger.e('Failed to start location tracking: $e');
//       _onError?.call(e.toString());
//       return false;
//     }
//   }

//   /// Ensures location service is enabled and permissions are granted
//   Future<bool> _ensurePermissions() async {
//     // Check if location service is enabled
//     bool serviceEnabled = await _location.serviceEnabled();
//     if (!serviceEnabled) {
//       serviceEnabled = await _location.requestService();
//       if (!serviceEnabled) {
//         _onError?.call('Location service not enabled');
//         return false;
//       }
//     }

//     // Check and request permissions
//     PermissionStatus permissionGranted = await _location.hasPermission();
//     if (permissionGranted == PermissionStatus.denied) {
//       permissionGranted = await _location.requestPermission();
//       if (permissionGranted != PermissionStatus.granted) {
//         _onError?.call('Location permission not granted');
//         return false;
//       }
//     }

//     return true;
//   }

//   /// Configures location tracking settings for optimal performance
//   Future<void> _configureLocationSettings() async {
//     await _location.changeSettings(
//       accuracy: LocationAccuracy.high,
//       interval: _locationInterval,
//       distanceFilter: _distanceFilter,
//     );
//   }

//   /// Starts listening to location changes
//   void _startLocationListener(String? driverId, String? tripId) {
//     _locationSubscription = _location.onLocationChanged
//         .timeout(_locationTimeout)
//         .listen(
//           (LocationData locationData) {
//             _handleLocationUpdate(locationData, driverId, tripId);
//           },
//           onError: (error) {
//             AppLogger.e('Location tracking error: $error');
//             _onError?.call(error.toString());
//           },
//         );
//   }

//   /// Handles incoming location updates
//   void _handleLocationUpdate(
//     LocationData locationData,
//     String? driverId,
//     String? tripId,
//   ) {
//     if (!_isValidLocationData(locationData)) {
//       AppLogger.w('Invalid location data received');
//       return;
//     }

//     final currentLocation = LatLng(
//       locationData.latitude!,
//       locationData.longitude!,
//     );

//     // Notify listeners
//     _onLocationUpdate?.call(currentLocation);

//     // Send to server if threshold is met
//     if (_shouldSendLocationUpdate(currentLocation)) {
//       _sendLocationToServer(currentLocation, driverId, tripId,);
//     }
//   }

//   /// Validates location data
//   bool _isValidLocationData(LocationData locationData) {
//     return locationData.latitude != null && locationData.longitude != null;
//   }

//   /// Determines if location update should be sent to server
//   bool _shouldSendLocationUpdate(LatLng currentLocation) {
//     if (_lastSentLocation == null) {
//       return true;
//     }

//     final distance = MapsServices.calculateDistance(
//       _lastSentLocation!,
//       currentLocation,
//     );
    
//     return distance >= _minimumDistanceThreshold;
//   }

//   /// Sends location update to server
//   void _sendLocationToServer(
//     LatLng location,
//     String? driverId,
//     String? tripId,
//     double distance,
//   ) async {
//     try {
//       final success = await MapsServices.sendLocationUpdate(
//         distance: distance,
//         latitude: location.latitude,
//         longitude: location.longitude,
//         tripId: tripId,
//       );

//       if (success) {
//         _lastSentLocation = location;
//         AppLogger.d('Location sent: ${location.latitude}, ${location.longitude}');
//       } else {
//         AppLogger.w('Failed to send location update');
//         _onError?.call('Failed to send location update to server');
//       }
//     } catch (e) {
//       AppLogger.e('Error sending location: $e');
//       _onError?.call('Failed to send location update: $e');
//     }
//   }

//   /// Stops location tracking and cleans up resources
//   void stopTracking() {
//     if (!_isTracking) {
//       AppLogger.w('Location tracking is not active');
//       return;
//     }

//     _isTracking = false;
//     _locationSubscription?.cancel();
//     _locationSubscription = null;
//     _periodicTimer?.cancel();
//     _periodicTimer = null;
//     _lastSentLocation = null;
    
//     AppLogger.d('Location tracking stopped');
//   }

//   /// Disposes all resources
//   void dispose() {
//     stopTracking();
//     _onLocationUpdate = null;
//     _onError = null;
//   }
// }
import 'dart:async';

import 'package:latlong2/latlong.dart';
import 'package:location/location.dart';

import '../logger_service.dart';
import 'maps_services.dart';

/// Handles real-time location tracking and updates
class LocationTracker {
  // Configuration constants
  static const double _minimumDistanceThreshold = 10.0;
  static const Duration _locationTimeout = Duration(seconds: 30);
  static const int _locationInterval = 5000; // milliseconds
  static const double _distanceFilter = 5.0; // meters

  // Private fields
  LatLng? _lastSentLocation;
  Timer? _periodicTimer;
  StreamSubscription<LocationData>? _locationSubscription;
  final Location _location = Location();
  bool _isTracking = false;

  // Trip-specific fields
  LatLng? _pickupLocation;
  LatLng? _destinationLocation;
  bool _hasReachedPickup = false;
  double _pickupToDestinationDistance = 0.0;

  // Callbacks
  Function(LatLng)? _onLocationUpdate;
  Function(String)? _onError;

  // Getters
  bool get isTracking => _isTracking;
  LatLng? get lastSentLocation => _lastSentLocation;

  /// Starts location tracking with proper permissions and configuration
  Future<bool> startTracking({
    Function(LatLng)? onLocationUpdate,
    Function(String)? onError,
    String? driverId,
    String? tripId,
    LatLng? pickupLocation,
    LatLng? destinationLocation,
  }) async {
    if (_isTracking) {
      AppLogger.w('Location tracking is already active');
      return true;
    }

    _onLocationUpdate = onLocationUpdate;
    _onError = onError;
    _pickupLocation = pickupLocation;
    _destinationLocation = destinationLocation;

    // Calculate pickup to destination distance once
    if (_pickupLocation != null && _destinationLocation != null) {
      _pickupToDestinationDistance = MapsServices.calculateDistance(
        _pickupLocation!,
        _destinationLocation!,
      );
    }

    try {
      // Check and request permissions
      final permissionsGranted = await _ensurePermissions();
      if (!permissionsGranted) {
        return false;
      }

      // Configure location settings
      await _configureLocationSettings();

      // Start listening to location changes
      _startLocationListener(driverId, tripId);

      _isTracking = true;
      AppLogger.d('Location tracking started successfully');
      return true;
    } catch (e) {
      AppLogger.e('Failed to start location tracking: $e');
      _onError?.call(e.toString());
      return false;
    }
  }

  /// Sets pickup reached status
  void setPickupReached(bool reached) {
    _hasReachedPickup = reached;
  }

  /// Ensures location service is enabled and permissions are granted
  Future<bool> _ensurePermissions() async {
    // Check if location service is enabled
    bool serviceEnabled = await _location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await _location.requestService();
      if (!serviceEnabled) {
        _onError?.call('Location service not enabled');
        return false;
      }
    }

    // Check and request permissions
    PermissionStatus permissionGranted = await _location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await _location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        _onError?.call('Location permission not granted');
        return false;
      }
    }

    return true;
  }

  /// Configures location tracking settings for optimal performance
  Future<void> _configureLocationSettings() async {
    await _location.changeSettings(
      accuracy: LocationAccuracy.high,
      interval: _locationInterval,
      distanceFilter: _distanceFilter,
    );
  }

  /// Starts listening to location changes
  void _startLocationListener(String? driverId, String? tripId) {
    _locationSubscription = _location.onLocationChanged
        .timeout(_locationTimeout)
        .listen(
          (LocationData locationData) {
            _handleLocationUpdate(locationData, driverId, tripId);
          },
          onError: (error) {
            AppLogger.e('Location tracking error: $error');
            _onError?.call(error.toString());
          },
        );
  }

  /// Handles incoming location updates
  void _handleLocationUpdate(
    LocationData locationData,
    String? driverId,
    String? tripId,
  ) {
    if (!_isValidLocationData(locationData)) {
      AppLogger.w('Invalid location data received');
      return;
    }

    final currentLocation = LatLng(
      locationData.latitude!,
      locationData.longitude!,
    );

    // Notify listeners
    _onLocationUpdate?.call(currentLocation);

    // Send to server if threshold is met
    if (_shouldSendLocationUpdate(currentLocation)) {
      _sendLocationToServer(currentLocation, driverId, tripId);
    }
  }

  /// Validates location data
  bool _isValidLocationData(LocationData locationData) {
    return locationData.latitude != null && locationData.longitude != null;
  }

  /// Determines if location update should be sent to server
  bool _shouldSendLocationUpdate(LatLng currentLocation) {
    if (_lastSentLocation == null) {
      return true;
    }

    final distance = MapsServices.calculateDistance(
      _lastSentLocation!,
      currentLocation,
    );
    
    return distance >= _minimumDistanceThreshold;
  }

  /// Calculates the trip distance based on current status
  double _calculateTripDistance(LatLng currentLocation) {
    if (_pickupLocation == null || _destinationLocation == null) {
      return 0.0;
    }

    if (!_hasReachedPickup) {
      // Before pickup: distance from current location to pickup
      return MapsServices.calculateDistance(currentLocation, _pickupLocation!);
    } else {
      // After pickup: distance from pickup to destination
      return _pickupToDestinationDistance;
    }
  }

  /// Sends location update to server
  void _sendLocationToServer(
    LatLng location,
    String? driverId,
    String? tripId,
  ) async {
    try {
      final tripDistance = _calculateTripDistance(location);
      
      final success = await MapsServices.sendLocationUpdate(
        distance: tripDistance,
        latitude: location.latitude,
        longitude: location.longitude,
        tripId: tripId,
      );

      if (success) {
        _lastSentLocation = location;
        AppLogger.d('Location sent: ${location.latitude}, ${location.longitude}, Trip distance: $tripDistance');
      } else {
        AppLogger.w('Failed to send location update');
        _onError?.call('Failed to send location update to server');
      }
    } catch (e) {
      AppLogger.e('Error sending location: $e');
      _onError?.call('Failed to send location update: $e');
    }
  }

  /// Stops location tracking and cleans up resources
  void stopTracking() {
    if (!_isTracking) {
      AppLogger.w('Location tracking is not active');
      return;
    }

    _isTracking = false;
    _locationSubscription?.cancel();
    _locationSubscription = null;
    _periodicTimer?.cancel();
    _periodicTimer = null;
    _lastSentLocation = null;
    
    AppLogger.d('Location tracking stopped');
  }

  /// Disposes all resources
  void dispose() {
    stopTracking();
    _onLocationUpdate = null;
    _onError = null;
    _pickupLocation = null;
    _destinationLocation = null;
    _hasReachedPickup = false;
    _pickupToDestinationDistance = 0.0;
  }
}