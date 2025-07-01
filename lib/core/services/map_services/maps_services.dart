import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:http/http.dart' as http;
import 'package:latlong2/latlong.dart';

import '../../network/endpoint_constants.dart';
import '../../utils/app_shared_pref_consts.dart';
import '../../utils/app_shared_preferences.dart';
import '../logger_service.dart';



/// Service class for handling map-related operations
class MapsServices {
  static const int _defaultTimeoutSeconds = 30;
  static const int _locationUpdateTimeoutSeconds = 15;
  static const double _earthRadiusMeters = 6371000;

  /// Fetches route coordinates between two points using OpenRouteService
  static Future<List<LatLng>> getRoute({
    required double fromLat,
    required double fromLng,
    required double toLat,
    required double toLng,
    required String apiKey,
  }) async {
    final url = 'https://api.openrouteservice.org/v2/directions/driving-car'
        '?api_key=$apiKey&start=$fromLng,$fromLat&end=$toLng,$toLat';

    try {
      final response = await http
          .get(
            Uri.parse(url),
            headers: {'timeout': '$_defaultTimeoutSeconds'},
          )
          .timeout(
            const Duration(seconds: _defaultTimeoutSeconds),
            onTimeout: () => throw TimeoutException('Route request timeout'),
          );

      if (response.statusCode == 200) {
        return _parseRouteResponse(response.body);
      } else {
        throw RouteException('Failed to load route: ${response.statusCode}');
      }
    } catch (e) {
      if (e is RouteException) rethrow;
      throw RouteException('Route request failed: $e');
    }
  }

  /// Parses route response and extracts coordinates
  static List<LatLng> _parseRouteResponse(String responseBody) {
    final data = json.decode(responseBody);
    final List<dynamic> coordinates = data['features'][0]['geometry']['coordinates'];
    return coordinates.map((coord) => LatLng(coord[1], coord[0])).toList();
  }

  /// Fetches coordinates from Nominatim API link
  static Future<LatLng> getLatLngFromNominatimLink(String link) async {
    try {
      final response = await http
          .get(Uri.parse(link))
          .timeout(
            const Duration(seconds: _defaultTimeoutSeconds),
            onTimeout: () => throw TimeoutException('Nominatim request timeout'),
          );

      if (response.statusCode == 200) {
        return _parseNominatimResponse(response.body);
      } else {
        throw NominatimException('Failed to get Nominatim data: ${response.statusCode}');
      }
    } catch (e) {
      if (e is NominatimException) rethrow;
      throw NominatimException('Nominatim request failed: $e');
    }
  }

  /// Parses Nominatim response and extracts coordinates
  static LatLng _parseNominatimResponse(String responseBody) {
    final List<dynamic> data = json.decode(responseBody);
    if (data.isEmpty) {
      throw NominatimException('No results found');
    }

    final firstResult = data[0];
    return LatLng(
      double.parse(firstResult['lat']),
      double.parse(firstResult['lon']),
    );
  }

  /// Calculates distance between two points using Haversine formula
  static double calculateDistance(LatLng point1, LatLng point2) {
    final lat1Rad = _degreesToRadians(point1.latitude);
    final lat2Rad = _degreesToRadians(point2.latitude);
    final deltaLat = _degreesToRadians(point2.latitude - point1.latitude);
    final deltaLng = _degreesToRadians(point2.longitude - point1.longitude);

    final a = sin(deltaLat / 2) * sin(deltaLat / 2) +
        cos(lat1Rad) * cos(lat2Rad) * sin(deltaLng / 2) * sin(deltaLng / 2);
    final c = 2 * atan2(sqrt(a), sqrt(1 - a));

    return _earthRadiusMeters * c;
  }

  /// Converts degrees to radians
  static double _degreesToRadians(double degrees) => degrees * (pi / 180);

  /// Sends location update to server with retry mechanism
  static Future<bool> sendLocationUpdate({
    required double latitude,
    required double longitude,
    String? tripId,
    required double distance,
    int retryCount = 3,
  }) async {
    final token = await _getAuthToken();
    if (token == null) {
      AppLogger.e('No authentication token found');
      return false;
    }

    for (int attempt = 0; attempt < retryCount; attempt++) {
      try {
        final success = await _performLocationUpdate(
          latitude: latitude,
          longitude: longitude,
          tripId: tripId,
          token: token,
          distance: distance
        );

        if (success) return true;

        // Add delay before retry
        if (attempt < retryCount - 1) {
          await Future.delayed(Duration(seconds: (attempt + 1) * 2));
        }
      } catch (e) {
        AppLogger.e('Location update attempt ${attempt + 1} failed: $e');
        if (attempt == retryCount - 1) return false;
      }
    }
    return false;
  }

  /// Gets authentication token from secure storage
  static Future<String?> _getAuthToken() async {
    return await AppPreferences.getSecureData(AppSharedPrefConsts.userToken);
  }

  /// Performs the actual location update HTTP request
  static Future<bool> _performLocationUpdate({
    required double latitude,
    required double longitude,
    required String token,
    String? tripId,
   required double distance
  }) async {
    final response = await http
        .post(
          Uri.parse(ApiConstants.tripLocation),
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token',
          },
          body: json.encode({
            'statusCode': 200,
            'lat': latitude,
            'lng': longitude,
            'timestamp': DateTime.now().toUtc().toIso8601String(),
            'tripId': tripId,
            "distance" : distance
          }),
        )
        .timeout(
          const Duration(seconds: _locationUpdateTimeoutSeconds),
          onTimeout: () => throw TimeoutException('Location update timeout'),
        );

    if (response.statusCode == 200 || response.statusCode == 201) {
      AppLogger.d('Location updated successfully: ${response.statusCode}');
      return true;
    } else {
      AppLogger.w('Location update failed: ${response.statusCode} - ${response.body}');
      // Don't retry client errors (4xx)
      return response.statusCode < 400 || response.statusCode >= 500;
    }
  }
}

/// Custom exception for route-related errors
class RouteException implements Exception {
  final String message;
  RouteException(this.message);
  
  @override
  String toString() => 'RouteException: $message';
}

/// Custom exception for Nominatim-related errors
class NominatimException implements Exception {
  final String message;
  NominatimException(this.message);
  
  @override
  String toString() => 'NominatimException: $message';
}