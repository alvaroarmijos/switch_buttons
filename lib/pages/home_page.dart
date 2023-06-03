import 'package:flutter/material.dart';
import 'package:toggle_buttons/widgets/widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Toggle Buttons"),
      ),
      body: const Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          DayNightToggle(),
        ],
      ),
    );
  }
}
