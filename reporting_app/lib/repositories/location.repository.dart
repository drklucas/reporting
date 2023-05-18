// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

abstract class LocationRepository {
  get_cities(BuildContext context, {int? codigo_uf, String? search});

  get_states(BuildContext context, {String? search, String? uf}); 
}