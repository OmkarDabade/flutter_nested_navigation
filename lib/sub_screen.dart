import 'package:flutter/material.dart';
import 'package:nested_nav/main.dart';
import 'package:nested_nav/screen_c.dart';

class SubScreen extends StatelessWidget {
  final int screenIndex;
  final VoidCallback? onUpdate;

  const SubScreen({
    super.key,
    required this.screenIndex,
    this.onUpdate,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Screen $screenIndex"),
      ),
      body: Center(
        child: TextButton(
          onPressed: () {
            if (screenIndex == 3) {
              Navigator.of(navigatorKeyMain.currentContext!).pop();
              Navigator.of(navigatorKeyMain.currentContext!)
                  .push(MaterialPageRoute(
                builder: (context) => const ScreenC(),
              ));
            }

            onUpdate?.call();

            Navigator.of(context).push(
              PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) => SubScreen(
                  screenIndex: screenIndex + 1,
                  onUpdate: onUpdate,
                ),
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  final tween =
                      Tween(begin: const Offset(1.0, 0.0), end: Offset.zero);
                  final curvedAnimation = CurvedAnimation(
                    parent: animation,
                    curve: Curves.ease,
                  );

                  return SlideTransition(
                    position: tween.animate(curvedAnimation),
                    child: child,
                  );
                },
              ),
            );
          },
          child: const Text('Next'),
        ),
      ),
    );
  }
}
