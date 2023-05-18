import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:reporting_app/providers/profile.provider.dart';
import 'package:reporting_app/services/profile/main/profile.main.service.dart';
import 'package:reporting_app/services/profile/profile.service.dart';

import '../repositories/auth.repository.dart';
import '../repositories/location.repository.dart';
import '../repositories/main/auth.main.repository.dart';
import '../repositories/main/location.main.repository.dart';
import '../repositories/main/profile.main.repository.dart';
import '../repositories/profile.repository.dart';
import '../requester/dio/requester.dio.dart';
import '../requester/requester.dart';
import '../services/auth/auth.service.dart';
import '../services/auth/main/auth.main.service.dart';
import 'auth.provider.dart';
import 'location.provider.dart';

class Provider {
  static List<SingleChildWidget> items() {
    return [
        //requester
       InheritedProvider<RequestDispatcher>(
          create: (_) => DioRequester(),
        ), 

        //auth
        InheritedProvider<AuthRepository>(
          create: (_) => MainAuthRepository(),
        ),




        
        ChangeNotifierProvider<AuthProvider>(
          create: (_) => AuthProvider(),
        ),
        InheritedProvider<AuthService>(
          create: (_) => MainAuthService(),
        ), 

        //profile
        InheritedProvider<ProfileRepository>(
          create: (_) => MainProfileRepository(),
        ),
        InheritedProvider<ProfileService>(
          create: (_) => MainProfileService(),
        ), 
        ChangeNotifierProvider<ProfileProvider>(
          create: (_) => ProfileProvider(),
        ),
        

        //location
        InheritedProvider<LocationRepository>(
          create: (_) => MainLocationRepository(),
        ),
        ChangeNotifierProvider<LocationProvider>(
          create: (_) => LocationProvider(),
        ),
        
    ]; 
  }
}