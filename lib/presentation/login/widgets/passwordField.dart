import 'package:flutter/material.dart';

class PasswordField extends StatefulWidget {
  final TextEditingController controller;
  final bool valid; // Move valid property here
  bool showError;

  PasswordField({
    Key? key,
    required this.controller,
    required this.valid,
    required this.showError,
  }) : super(key: key);

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _isHidden = true;

    void _toggleVisibility() {
      setState(() {
        _isHidden = !_isHidden;
      });
    }
  @override
  Widget build(BuildContext context) {

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
      
      Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: widget.valid ? Color.fromARGB(255, 71, 70, 70) : Colors.red,
              width: 1.2,
            ),
          ),
        ),
        child: TextField(
          obscureText: _isHidden,
          textInputAction: TextInputAction.next,
          controller: widget.controller,
          style: TextStyle(color: Color.fromRGBO(0, 0, 0, 1)),
          decoration: InputDecoration(
            suffixIcon: IconButton(
              icon: Icon(_isHidden ? Icons.visibility_off : Icons.visibility),
              onPressed: _toggleVisibility,
            ),
            prefixIcon: const Icon(Icons.lock_open_outlined),
            border: InputBorder.none,
            hintText: "Password",
          ),
        ),
      ),
      widget.showError
          ? Text(
              "password is short, please correct it",
              style: TextStyle(
                fontSize: 12,
                color: Colors.red,
                fontWeight: FontWeight.w300,
              ),
              // You can customize the style
            )
          : !widget.valid
              ? Text(
                  "Empty Password, please enter a password",
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.red,
                    fontWeight: FontWeight.w300,
                  ),
                  // You can customize the style
                )
              : SizedBox(
                  height: 8,
                ),
    ]);
  }
}
