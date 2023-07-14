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
      builder: (context, child) {
        // Define a scale factor for the text
        var textScaleFactor = 1.0;

        // Wrap the child with a MediaQuery widget to apply the scale factor
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaleFactor: textScaleFactor),
          child: child!,
        );
      },
    );
  }
}

