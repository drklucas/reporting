// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reporting_app/requester/requester.dart';

import '../../models/auth.model.dart';
import '../../providers/auth.provider.dart';
import '../../routes/api/api.routes.dart';
import '../auth.repository.dart';

class MainAuthRepository extends AuthRepository {
  @override
  login(String email, String password, BuildContext context) async {
    Map request = await context.read<RequestDispatcher>().post(ApiRoutes.auth.LOGIN,
        context: context, data: {"email": email, "password": password});

    // if(request['success']) {
    if (request['statusCode'] == 200) {
      context.read<AuthProvider>().set(
            AuthModel.fromMap(request['data']),
          );
      return {
        'status': 'ok',
      };
    }
    else if (request['statusCode'] == 401) {
      return {'status': 'not_match'};
    }

    else {
      return {'status': 'not_match'}; 
    }
    // } else {

    // }
  }

  @override
  logout(token, BuildContext context) async {
    // TODO: implement logout
    throw UnimplementedError();
  }

  @override
  refresh(String token, BuildContext context) async {
    // TODO: implement refresh
    throw UnimplementedError();
  }

  @override
  register(String email, String password, BuildContext context) async {
    // TODO: implement register
    throw UnimplementedError();
  }
}
