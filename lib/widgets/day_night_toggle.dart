import 'package:flutter/material.dart';

class DayNightToggle extends StatefulWidget {
  const DayNightToggle({super.key});

  @override
  State<DayNightToggle> createState() => _DayNightToggleState();
}

class _DayNightToggleState extends State<DayNightToggle> {
  late bool toogle;

  @override
  void initState() {
    toogle = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          "Night",
          style: TextStyle(
            color: toogle ? Colors.grey : Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          width: 8.0,
        ),
        InkWell(
          onTap: () => setState(() {
            toogle = !toogle;
          }),
          customBorder: const StadiumBorder(),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            width: 80,
            decoration: ShapeDecoration(
              color: toogle ? Colors.black : Colors.grey,
              shape: const StadiumBorder(),
            ),
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  //On animation
                  AnimatedOpacity(
                    opacity: toogle ? 1 : 0,
                    duration: const Duration(milliseconds: 300),
                    child: AnimatedAlign(
                      alignment:
                          toogle ? Alignment.centerLeft : Alignment.centerRight,
                      duration: const Duration(milliseconds: 300),
                      child: const Icon(
                        Icons.wb_sunny_rounded,
                        color: Colors.yellow,
                      ),
                    ),
                  ),

                  //Off animation
                  AnimatedOpacity(
                    opacity: toogle ? 0 : 1,
                    duration: const Duration(milliseconds: 300),
                    child: AnimatedAlign(
                      alignment:
                          toogle ? Alignment.centerLeft : Alignment.centerRight,
                      duration: const Duration(milliseconds: 300),
                      child: const Icon(
                        Icons.nightlight,
                        color: Colors.white,
                      ),
                    ),
                  ),

                  //Visible icon
                  AnimatedAlign(
                    alignment:
                        toogle ? Alignment.centerRight : Alignment.centerLeft,
                    duration: const Duration(milliseconds: 300),
                    child: Icon(
                      Icons.circle,
                      size: 30,
                      color: toogle ? Colors.white : Colors.black,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 8.0,
        ),
        Text(
          "Day",
          style: TextStyle(
            color: toogle ? Colors.black : Colors.grey,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
