class ApiRoutes {
  static const BASE_URL = 'http://192.168.15.5:8000/'; 
  static const ROUTE_GROUP = 'api/'; 
  //routes
  static Auth auth = Auth();
  static Profile profile = Profile(); 
  static Location location = Location(); 
}

class Auth {
  final LOGIN = 'login'; 
  final SIGNUP = 'signup'; 
  final LOGOU = 'logout';
  final REFRESH = 'refresh'; 
}

class Profile {
  final PROFILE = 'user_profile'; 
  final HAS_PROFILE = 'has_profile'; 
}

class Location {
  final CITIES = 'cities'; 
  final STATES = 'states'; 
}