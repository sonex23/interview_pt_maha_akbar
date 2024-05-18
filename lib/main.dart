import 'package:flutter/material.dart';
import 'package:interview_pt_maha_akbar/core/di/service_locator.dart';
import 'package:interview_pt_maha_akbar/features/app/main_app.dart';

void main() async {
  setupServiceLocator();
  runApp(const MainApp());
}
