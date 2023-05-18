// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:reporting_app/models/auth.model.dart';

class AuthProvider extends ChangeNotifier {
  AuthModel? _auth; 

  get auth => _auth;

  set(AuthModel set_auth) {
    _auth = set_auth; 
    notifyListeners(); 
  }
}