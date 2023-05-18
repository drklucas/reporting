// ignore_for_file: non_constant_identifier_names, use_build_context_synchronously


import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reporting_app/models/profile.model.dart';
import 'package:reporting_app/providers/profile.provider.dart';
import 'package:reporting_app/repositories/profile.repository.dart';
import 'package:reporting_app/requester/requester.dart';
import 'package:reporting_app/routes/api/api.routes.dart';

class MainProfileRepository extends ProfileRepository {

  @override
  Future<bool> check_if_exists(BuildContext context) async {
    Map request = await context
        .read<RequestDispatcher>()
        .get(ApiRoutes.profile.HAS_PROFILE, context: context);

    if (request['success']) {
      if (request['statusCode'] == 200) {
        if (request['data']['exists']) {
          context.read<ProfileProvider>().set(
                ProfileModel.fromMap(
                  request['data']['profile'],
                ),
              );
          return true;
        }
      }
    }

    return false;
  }

  @override
  delete(ProfileModel profile, BuildContext context) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  get(BuildContext context) {
    // TODO: implement get
    throw UnimplementedError();
  }

  @override
  set(ProfileModel profile, BuildContext context) async {
    Map request = await context.read<RequestDispatcher>().post(
          ApiRoutes.profile.PROFILE,
          context: context,
          data: profile.toMap(),
        );

    if (request['success']) {
      if (request['statusCode'] == 201 || request['statusCode'] == 200) {
        context.read<ProfileProvider>().set(
              ProfileModel.fromMap(request['data']['profile']),
            );
      }
    }
  }

  @override
  show(ProfileModel profile, BuildContext context) {
    throw UnimplementedError();
  }

  @override
  update(ProfileModel profile, BuildContext context) {
    // TODO: implement update
    throw UnimplementedError();
  }
}
