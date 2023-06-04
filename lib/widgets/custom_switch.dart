import 'package:flutter/material.dart';

const int _kDuration = 300;
const double _kWidth = 80;
const double _kheight = 40;

class CustomSwitch extends StatefulWidget {
  const CustomSwitch({
    super.key,
    required this.value,
    required this.onChanged,
    this.activeColor = Colors.black,
    this.inactiveColor = Colors.grey,
    this.thumbIcon,
    this.activeIcon,
    this.inactiveIcon,
    this.activeText,
    this.inactiveText,
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
  /// CustomSwitch(
  ///   value: _giveVerse,
  ///   onChanged: (bool newValue) {
  ///     setState(() {
  ///       _giveVerse = newValue;
  ///     });
  ///   },
  /// )
  /// ```
  final ValueChanged<bool>? onChanged;

  /// The color to use when this switch is on.
  ///
  /// Defaults to [Colors.black].
  final Color? activeColor;

  /// The color to use when this switch is off.
  ///
  /// Defaults to [Colors.grey].
  final Color? inactiveColor;

  /// The icon to use on the thumb of this switch
  ///
  /// If null, then the value of [Icon(Icons.circle)] is used. If this is also null,
  /// then the [Switch] does not have any icons on the thumb.
  final Icon? thumbIcon;

  /// The icon to use when this switch is on.
  ///
  /// If null, then the value of [Icon(Icons.wb_sunny_rounded)] is used. If this is also null,
  final Icon? activeIcon;

  /// The icon to use when this switch is off.
  ///
  /// If null, then the value of [SwitchThemeData.nightlight] is used. If this is also null,
  final Icon? inactiveIcon;

  /// The text to use when this switch is on.
  ///
  /// If null, then the value of [""] is used. If this is also null,
  final String? activeText;

  /// The text to use when this switch is off.
  ///
  /// If null, then the value of [""] is used. If this is also null,
  final String? inactiveText;

  @override
  State<CustomSwitch> createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch> {
  @override
  Widget build(BuildContext context) {
    bool toggleState = widget.value;

    final thumbIcon = widget.thumbIcon ??
        Icon(
          Icons.circle,
          size: 30,
          color: toggleState ? Colors.white : Colors.black,
        );
    final inactiveIcon = widget.inactiveIcon ??
        const Icon(
          Icons.nightlight,
          color: Colors.white,
        );
    final activeIcon = widget.activeIcon ??
        const Icon(
          Icons.wb_sunny_rounded,
          color: Colors.yellow,
        );

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          widget.inactiveText ?? "",
          style: TextStyle(
            color: toggleState ? widget.inactiveColor : widget.activeColor,
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
              color: toggleState ? widget.activeColor : widget.inactiveColor,
              shape: const StadiumBorder(),
            ),
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  //On icon
                  AnimatedOpacity(
                    opacity: toggleState ? 1 : 0,
                    duration: const Duration(milliseconds: _kDuration),
                    child: AnimatedAlign(
                      alignment: toggleState
                          ? Alignment.centerLeft
                          : Alignment.centerRight,
                      duration: const Duration(milliseconds: _kDuration),
                      child: activeIcon,
                    ),
                  ),

                  //Off icon
                  AnimatedOpacity(
                    opacity: toggleState ? 0 : 1,
                    duration: const Duration(milliseconds: _kDuration),
                    child: AnimatedAlign(
                      alignment: toggleState
                          ? Alignment.centerLeft
                          : Alignment.centerRight,
                      duration: const Duration(milliseconds: _kDuration),
                      child: inactiveIcon,
                    ),
                  ),

                  //thumb icon
                  AnimatedAlign(
                      alignment: toggleState
                          ? Alignment.centerRight
                          : Alignment.centerLeft,
                      duration: const Duration(milliseconds: _kDuration),
                      child: thumbIcon)
                ],
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 8.0,
        ),
        Text(
          widget.activeText ?? "",
          style: TextStyle(
            color: toggleState ? widget.activeColor : widget.inactiveColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
