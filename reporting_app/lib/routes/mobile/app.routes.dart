// ignore_for_file: prefer_interpolation_to_compose_strings, constant_identifier_names, non_constant_identifier_names

class MobileAppRoutes {
  static MainRoutes main = MainRoutes(); 
  static ErrorRoutes error = ErrorRoutes(); 
  static ProfileRoutes profile = ProfileRoutes();
  static AuthRoutes auth = AuthRoutes();
}

class ProfileRoutes {
  final prefix = 'mobile/profile/';
  get FORM => prefix + 'form';
}

class AuthRoutes {
  final prefix = 'mobile/auth/';
  get LOGIN => prefix + 'login';
  get SIGNUP => prefix + 'signup';
}

class ErrorRoutes {
  final prefix = 'mobile/error/'; 
}

class MainRoutes {
  final prefix = 'mobile/main/';
  get WELCOME => prefix + 'welcome'; 
  get HOME => prefix + 'home'; 
}
