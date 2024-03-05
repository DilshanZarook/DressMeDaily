import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../core/app_export.dart';

class CustomSwitch extends StatefulWidget {
  final Function(bool) onChange;
  final bool value;

  const CustomSwitch({
    Key? key,
    required this.onChange,
    required this.value,
  }) : super(key: key);

  @override
  _CustomSwitchState createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch> {
  late bool _value;

  @override
  void initState() {
    super.initState();
    _value = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoSwitch(
      value: _value,
      trackColor: _value ? appTheme.lime400 : appTheme.gray40001,
      thumbColor: _value ? appTheme.blueGray100 : theme.colorScheme.primary,
      onChanged: (newValue) {
        setState(() {
          _value = newValue;
        });
        widget.onChange(newValue);
      },
    );
  }
}
