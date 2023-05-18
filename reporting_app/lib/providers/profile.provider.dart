// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:reporting_app/models/profile.model.dart';

class ProfileProvider extends ChangeNotifier {
  ProfileModel? _profile; 

  get profile => _profile; 

  set(ProfileModel set_profile) {
    _profile = set_profile; 
    notifyListeners(); 
  }
}