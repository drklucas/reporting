import 'package:flutter/material.dart';
import 'package:reporting_app/views/mobile/profile/screens/profile.form.screen.dart';

import '../views/mobile/auth/screens/auth.screen.dart';
import '../views/mobile/home/screens/home.screen.dart';
import '../views/mobile/welcome/screens/welcome.screen.dart';
import 'mobile/app.routes.dart';

class AppRouter {

  static Map<String, Widget Function(BuildContext)> mobileRoutes() {
    return {
      MobileAppRoutes.auth.LOGIN: (context) => const AuthScreen(isLogin: true),
      MobileAppRoutes.auth.SIGNUP: (context) => const AuthScreen(isLogin: false), 

      MobileAppRoutes.main.WELCOME: (context) => const WelcomeScreen(),
      MobileAppRoutes.main.HOME: (context) => const HomeScreen(), 
      
      MobileAppRoutes.profile.FORM: (context) => const ProfileFormScreen(), 
      
    };
  }

  static Map<String, Widget Function(BuildContext)> webRoutes() {
    return {

    };
  }
}
