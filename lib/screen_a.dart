import 'package:flutter/material.dart';

import 'screen_b.dart';

class ScreenA extends StatelessWidget {
  const ScreenA({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Screen A'),
      ),
      body: Center(
        child: TextButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const ScreenB(),
              ),
            );
          },
          child: const Text('Go to Screen B'),
        ),
      ),
    );
  }
}
