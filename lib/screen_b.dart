import 'package:flutter/material.dart';

import 'main.dart';
import 'sub_screen.dart';

class ScreenB extends StatefulWidget {
  const ScreenB({super.key});

  @override
  State<ScreenB> createState() => _ScreenBState();
}

class _ScreenBState extends State<ScreenB> {
  int noOfScreens = 1;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      // To track android back button callbacks
      onWillPop: () async {
        // If nested navigation can be popped, pop it and dont touch primary navigation
        if (Navigator.of(nestedNavigatorKey.currentContext!).canPop()) {
          setState(() {
            noOfScreens -= 1;
          });

          Navigator.of(nestedNavigatorKey.currentContext!).pop();

          return false;
        }

        // If there are no pages in nested navigation, pop top navigation
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Screen B'),
        ),
        body: Column(
          children: [
            Container(
              height: 100,
              alignment: Alignment.center,
              child: Text('Screen $noOfScreens of 3'),
            ),
            Expanded(
              child: Navigator(
                key: nestedNavigatorKey,
                onGenerateRoute: (settings) => MaterialPageRoute(
                  builder: (context) => SubScreen(
                    screenIndex: 1,
                    onUpdate: () {
                      setState(() {
                        noOfScreens += 1;
                      });
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
