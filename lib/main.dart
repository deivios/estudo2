import 'package:estudo2/routes/router.dart';
import 'package:estudo2/routes/routes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: Routes.initialRoute,
      routes: routes,
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: false,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        textTheme: TextTheme(
          titleSmall: TextStyle(color: Colors.red),
          bodySmall: TextStyle(color: Colors.black),
          bodyMedium: TextStyle(color: Colors.red),
          displayMedium: TextStyle(color: Colors.red),
          bodyLarge: TextStyle(color: Colors.red),
          displaySmall: TextStyle(color: Colors.red),
          titleLarge: TextStyle(color: Colors.red),
          labelSmall: TextStyle(color: Colors.red),
          headlineLarge: TextStyle(color: Colors.red),
          titleMedium: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
