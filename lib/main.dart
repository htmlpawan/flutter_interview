import 'package:flutter/material.dart';
import 'package:flutter_interview/router/app_router.dart';

void main() {
  runApp(const MyApp()); 
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      routerConfig: appRouterConfig,
      theme: ThemeData(
      fontFamily: 'Roboto',
      colorScheme: const ColorScheme.light(
        primary: Colors.blue,
      ),
      ),
    );
  }
}

