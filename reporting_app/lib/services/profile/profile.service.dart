import 'package:flutter/material.dart';
import 'package:reporting_app/models/profile.model.dart';

abstract class ProfileService {
  submitProfileForm({required BuildContext context, required ProfileModel profile, required GlobalKey<FormState> formKey});  
}