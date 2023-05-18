import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reporting_app/models/profile.model.dart';
import 'package:reporting_app/repositories/profile.repository.dart';
import 'package:reporting_app/services/profile/profile.service.dart';

class MainProfileService extends ProfileService {
  @override
  submitProfileForm(
      {required BuildContext context,
      required ProfileModel profile,
      required GlobalKey<FormState> formKey}) {
    if (formKey.currentState!.validate()) {
      context.read<ProfileRepository>().set(profile, context); 
    }
  }
}
