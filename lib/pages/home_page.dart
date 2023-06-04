import 'package:flutter/material.dart';
import 'package:toggle_buttons/widgets/widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late bool dayNightToggle;
  late bool lightDarkToggle;
  late bool dayNightToggle2;
  late bool minimalToggle;

  @override
  void initState() {
    dayNightToggle = true;
    lightDarkToggle = true;
    dayNightToggle2 = true;
    minimalToggle = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Switch Buttons"),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                color: dayNightToggle ? Colors.white : Colors.blueGrey,
                child: Center(
                  child: CustomSwitch(
                    value: dayNightToggle,
                    activeText: "Day",
                    inactiveText: "Night",
                    onChanged: (value) {
                      setState(() {
                        dayNightToggle = value;
                      });
                    },
                  ),
                )),
          ),
          Expanded(
            child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                color: lightDarkToggle ? Colors.blue[50] : Colors.blueGrey[800],
                child: Center(
                  child: LightDarkSwitch(
                    value: lightDarkToggle,
                    onChanged: (value) {
                      setState(() {
                        lightDarkToggle = value;
                      });
                    },
                  ),
                )),
          ),
          Expanded(
            child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                color: dayNightToggle2 ? Colors.white : Colors.black,
                child: Center(
                  child: DayNightSwitch(
                    value: dayNightToggle2,
                    onChanged: (value) {
                      setState(() {
                        dayNightToggle2 = value;
                      });
                    },
                  ),
                )),
          ),
          Expanded(
            child: Container(
                color: const Color(0xFFf3e5d3),
                child: Center(
                  child: MinimalSwitch(
                    value: minimalToggle,
                    onChanged: (value) {
                      setState(() {
                        minimalToggle = value;
                      });
                    },
                  ),
                )),
          ),
        ],
      ),
    );
  }
}
