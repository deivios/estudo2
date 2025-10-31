import 'package:estudo2/dependencies/injector.dart';
import 'package:estudo2/my_app.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await injector();
  runApp(MyApp());
}


