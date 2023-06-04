import 'package:flutter/material.dart';

const int _kDuration = 300;
const double _kWidth = 70;
const double _kheight = 40;

class MinimalSwitch extends StatefulWidget {
  const MinimalSwitch({
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
  /// MinimalSwitch(
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
  State<MinimalSwitch> createState() => _MinimalSwitchState();
}

class _MinimalSwitchState extends State<MinimalSwitch> {
  @override
  Widget build(BuildContext context) {
    bool toggleState = widget.value;
    const activeColor = Color(0xFF7e86fa);
    const inactiveColor = Color(0xFFf3e5d3);

    return InkWell(
      onTap: () => setState(() {
        toggleState = !toggleState;
        widget.onChanged?.call(toggleState);
      }),
      customBorder: const StadiumBorder(),
      child: Container(
        width: _kWidth,
        height: _kheight,
        decoration: const ShapeDecoration(
          color: Colors.white,
          shape: StadiumBorder(),
        ),
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Stack(
            alignment: Alignment.center,
            children: [
              //day icon
              AnimatedAlign(
                  alignment: toggleState
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
                  duration: const Duration(milliseconds: _kDuration),
                  child: AnimatedContainer(
                    width: 30,
                    duration: const Duration(milliseconds: _kDuration),
                    decoration: BoxDecoration(
                        color: toggleState ? activeColor : inactiveColor,
                        shape: BoxShape.circle),
                  )),

              //inactive Icon
              AnimatedOpacity(
                duration: const Duration(milliseconds: _kDuration),
                opacity: toggleState ? 0 : 1,
                child: AnimatedAlign(
                  alignment: toggleState
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
                  duration: const Duration(milliseconds: _kDuration),
                  child: AnimatedRotation(
                    turns: toggleState ? 0.0 : 0.5,
                    duration: const Duration(milliseconds: _kDuration),
                    child: const Icon(
                      Icons.close,
                      size: 30,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),

              //active Icon
              AnimatedOpacity(
                duration: const Duration(milliseconds: _kDuration ~/ 2),
                opacity: toggleState ? 1 : 0,
                child: AnimatedAlign(
                  alignment: toggleState
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
                  duration: const Duration(milliseconds: _kDuration),
                  child: AnimatedRotation(
                    turns: toggleState ? 0.0 : 0.5,
                    duration: const Duration(milliseconds: _kDuration),
                    child: const Icon(
                      Icons.check,
                      size: 30,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
