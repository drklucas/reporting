// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:reporting_app/models/state.model.dart';
import 'package:reporting_app/models/city.model.dart';


class LocationProvider extends ChangeNotifier {
  final List<CityModel> _cities = [];
  final List<StateModel> _states = [];

  get cities => _cities; 
  get states => _states; 

  set_cities(List data) {
    _cities.clear(); 
    for (var dt in data) {
      _cities.add(CityModel.fromMap(dt)); 
    }
    notifyListeners(); 
  }

  set_states(List data) {
     _states.clear(); 
    for (var dt in data) {
      _states.add(StateModel.fromMap(dt)); 
    }
    notifyListeners(); 
  }
}