import 'package:flutter/material.dart';

abstract class AuthService {
  login({required BuildContext context, required String email, required String password});  
}