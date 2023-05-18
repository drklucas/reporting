// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reporting_app/providers/location.provider.dart';
import 'package:reporting_app/repositories/location.repository.dart';
import 'package:reporting_app/requester/dio/requester.dio.dart';
import 'package:reporting_app/requester/requester.dart';
import 'package:reporting_app/routes/api/api.routes.dart';


class MainLocationRepository extends LocationRepository {

  @override
  get_cities(BuildContext context, {int? codigo_uf, String? search}) async {
    Map<String, dynamic> queryParameters = {};

    if (codigo_uf != null) {
      queryParameters['codigo_uf'] = codigo_uf;
    }

    if (search != null) {
      queryParameters['search'] = search;
    }

    Map request = await context.read<RequestDispatcher>().get(
          ApiRoutes.location.CITIES,
          context: context,
          queryParameters: queryParameters,
        );

    if (request['success']) {
      if (context.mounted) {
        context.read<LocationProvider>().set_cities(
              request['data']['cities'],
            );
      }
    } else {
      
    }
  }

  @override
  get_states(BuildContext context, {String? search, String? uf}) async {
    Map<String, dynamic> queryParameters = {};

    if (search != null) {
      queryParameters['search'] = search;
    }

    Map request = await context.read<RequestDispatcher>().get(
          ApiRoutes.location.STATES,
          context: context,
          queryParameters: queryParameters,
        );

    if (request['success']) {
      if (context.mounted) {
        context.read<LocationProvider>().set_states(
              request['data']['states'],
            );
      }
    }
  }
}
