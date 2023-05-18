// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

import '../models/profile.model.dart';

abstract class ProfileRepository {
  Future<bool> get(BuildContext context);

  check_if_exists(BuildContext context); 

  show(ProfileModel profile, BuildContext context);

  set(ProfileModel profile, BuildContext context); 

  update(ProfileModel profile, BuildContext context); 

  delete(ProfileModel profile, BuildContext context); 
}

