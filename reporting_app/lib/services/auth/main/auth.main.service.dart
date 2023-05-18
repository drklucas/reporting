import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:reporting_app/services/auth/auth.service.dart';

import '../../../repositories/auth.repository.dart';
import '../../../repositories/profile.repository.dart';
import '../../../routes/mobile/app.routes.dart';

class MainAuthService extends AuthService {
  @override
  login({required BuildContext context, required String email, required String password}) async {
      var token = await context.read<AuthRepository>().login(email, password, context);
      var profile; 

    if(token['status'] == 'ok') {
      if(context.mounted) {
        profile = await context.read<ProfileRepository>().check_if_exists(context); 
      }
      

      if(!profile) {
        if(context.mounted) {
          Navigator.pushNamedAndRemoveUntil(context, MobileAppRoutes.profile.FORM, (route) => false);
        }
        return; 
      }

      if(context.mounted) {
        Navigator.pushNamedAndRemoveUntil(context, MobileAppRoutes.main.HOME, (route) => false); 
      }
      
    } 
    else if(token['status'] == 'not_match') {
      //email e senha nao conferem
    }
  }

}