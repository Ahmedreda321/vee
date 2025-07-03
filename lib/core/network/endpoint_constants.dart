class ApiConstants {
  static const String baseUrl = 'https://veemanage.runasp.net';
  static const String login = '/api/Account/login';
  static const String forgotPassword = '/api/Account/forgotpassword';
  static const String driverTrips = "/me/trips";
  static const String updateTripRequest = '/api/TripRequest/{id}';
  static const String tripLocation =
      'https://veemanage.runasp.net/api/TripLocation';
  static const String tripReport = '/api/TripReport';
  static const String faultReport = "/api/Trip/Report/Fault";
  static const String maintenance = "/api/Maintenance/Request/Me";
}
