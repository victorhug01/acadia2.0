import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:navigations/src/app/myapp_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(const MyApp());
}
