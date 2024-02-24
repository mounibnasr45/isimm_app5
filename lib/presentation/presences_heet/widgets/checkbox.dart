import 'package:flutter/material.dart';

class CheckBox extends StatefulWidget {
  CheckBox({super.key, required this.ischecked});
  bool ischecked = false;

  @override
  State<CheckBox> createState() => _CheckBoxState();
}

class _CheckBoxState extends State<CheckBox> {
  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: widget.ischecked,
      onChanged: (val) {
        widget.ischecked = val!;
      },
    );
  }
}
