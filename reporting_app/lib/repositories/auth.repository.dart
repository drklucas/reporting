// ignore_for_file: use_build_context_synchronously


import 'package:flutter/material.dart';

abstract class AuthRepository {
  login(String email, String password, BuildContext context);

  register(String email, String password, BuildContext context);

  logout(token, BuildContext context);

  refresh(String token, BuildContext context);
}


