import 'package:flutter/material.dart';

const int _kDuration = 300;
const double _kWidth = 60;
const double _kheight = 40;

class LightDarkSwitch extends StatefulWidget {
  const LightDarkSwitch({
    super.key,
    required this.value,
    this.onChanged,
  });

  /// Whether this switch is on or off.
  ///
  /// This property must not be null.
  final bool value;

  /// Called when the user toggles the switch on or off.
  ///
  /// The switch passes the new value to the callback but does not actually
  /// change state until the parent widget rebuilds the switch with the new
  /// value.
  ///
  /// If null, the switch will be displayed as disabled.
  ///
  /// The callback provided to [onChanged] should update the state of the parent
  /// [StatefulWidget] using the [State.setState] method, so that the parent
  /// gets rebuilt; for example:
  ///
  /// ```dart
  /// LightDarkSwitch(
  ///   value: _giveVerse,
  ///   onChanged: (bool newValue) {
  ///     setState(() {
  ///       _giveVerse = newValue;
  ///     });
  ///   },
  /// )
  /// ```
  final ValueChanged<bool>? onChanged;

  @override
  State<LightDarkSwitch> createState() => _LightDarkSwitchState();
}

class _LightDarkSwitchState extends State<LightDarkSwitch> {
  @override
  Widget build(BuildContext context) {
    bool toggleState = widget.value;
    const activeColor = Colors.blue;
    const inactiveColor = Colors.black;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          "Light",
          style: TextStyle(
            color: toggleState ? inactiveColor : Colors.grey,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          width: 8.0,
        ),
        InkWell(
          onTap: () => setState(() {
            toggleState = !toggleState;
            widget.onChanged?.call(toggleState);
          }),
          customBorder: const StadiumBorder(),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: _kDuration),
            width: _kWidth,
            height: _kheight,
            decoration: ShapeDecoration(
              color: toggleState ? activeColor : inactiveColor,
              shape: const StadiumBorder(),
            ),
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  //Light icon
                  AnimatedOpacity(
                    opacity: toggleState ? 1 : 0,
                    duration: const Duration(milliseconds: _kDuration),
                    child: AnimatedAlign(
                      alignment: toggleState
                          ? Alignment.centerLeft
                          : Alignment.centerRight,
                      duration: const Duration(milliseconds: _kDuration),
                      child: const Icon(
                        Icons.circle,
                        size: 30,
                        color: Colors.white,
                      ),
                    ),
                  ),

                  AnimatedPositioned(
                    top: 2,
                    right: toggleState ? 6 : 40,
                    duration: const Duration(milliseconds: _kDuration),
                    child: AnimatedOpacity(
                      opacity: toggleState ? 1 : 0,
                      duration: const Duration(milliseconds: _kDuration),
                      child: const Icon(
                        Icons.circle,
                        size: 8,
                        color: Colors.white,
                      ),
                    ),
                  ),

                  AnimatedPositioned(
                    top: 16,
                    right: toggleState ? 14 : 40,
                    duration: const Duration(milliseconds: _kDuration),
                    child: const Icon(
                      Icons.circle,
                      size: 3,
                      color: Colors.white,
                    ),
                  ),

                  //Dark Icon
                  AnimatedOpacity(
                    opacity: toggleState ? 0 : 1,
                    duration: const Duration(milliseconds: _kDuration),
                    child: AnimatedAlign(
                      alignment: toggleState
                          ? Alignment.centerLeft
                          : Alignment.centerRight,
                      duration: const Duration(milliseconds: _kDuration),
                      child: const Icon(
                        Icons.nightlight,
                        size: 30,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  AnimatedPositioned(
                    bottom: 3,
                    left: toggleState ? 40 : 14,
                    duration: const Duration(milliseconds: _kDuration),
                    child: AnimatedOpacity(
                      opacity: toggleState ? 0 : 1,
                      duration: const Duration(milliseconds: _kDuration),
                      child: const Icon(
                        Icons.star,
                        size: 8,
                        color: Colors.white,
                      ),
                    ),
                  ),

                  AnimatedPositioned(
                    top: 2,
                    left: toggleState ? 40 : 4,
                    duration: const Duration(milliseconds: _kDuration),
                    child: AnimatedOpacity(
                      opacity: toggleState ? 0 : 1,
                      duration: const Duration(milliseconds: _kDuration),
                      child: const Icon(
                        Icons.star,
                        size: 10,
                        color: Colors.white,
                      ),
                    ),
                  ),

                  AnimatedPositioned(
                    top: 10,
                    left: toggleState ? 40 : 16,
                    duration: const Duration(milliseconds: _kDuration),
                    child: AnimatedOpacity(
                      opacity: toggleState ? 0 : 1,
                      duration: const Duration(milliseconds: _kDuration),
                      child: const Icon(
                        Icons.circle,
                        size: 3,
                        color: Colors.white,
                      ),
                    ),
                  ),

                  AnimatedPositioned(
                    top: 4,
                    left: toggleState ? 40 : 22,
                    duration: const Duration(milliseconds: _kDuration),
                    child: AnimatedOpacity(
                      opacity: toggleState ? 0 : 1,
                      duration: const Duration(milliseconds: _kDuration),
                      child: const Icon(
                        Icons.circle,
                        size: 3,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 8.0,
        ),
        Text(
          "Dark",
          style: TextStyle(
            color: toggleState ? Colors.grey : inactiveColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
