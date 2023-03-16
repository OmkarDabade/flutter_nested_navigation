import 'package:flutter/material.dart';
import 'package:nested_nav/screen_a.dart';

final GlobalKey<NavigatorState> navigatorKeyMain = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> nestedNavigatorKey =
    GlobalKey<NavigatorState>();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKeyMain,
      home: const ScreenA(),
    );
  }
}
