import 'package:flutter/material.dart';
import 'package:material_text_fields/material_text_fields.dart';
import 'package:material_text_fields/utils/form_validation.dart';

class EmailField extends StatelessWidget {
  final TextEditingController controller; // Add this line
  bool valid;
  bool showError;
  bool icon = true;
  String errorMessage;
  EmailField({
    Key? key,
    required this.controller,
    required this.valid,
    required this.showError,
    required this.icon,
    required this.errorMessage,
  }) : super(key: key); // Modify this line
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: valid ? Color.fromARGB(255, 71, 70, 70) : Colors.red,
                width: 0.9,
              ),
            ),
          ),
          child: MaterialTextField(
            keyboardType: TextInputType.emailAddress,
            hint: 'Email',
            textInputAction: TextInputAction.next,
            prefixIcon: const Icon(Icons.email_outlined),
            controller: controller,
            validator: FormValidation.emailTextField,
          ),
        ),
        !valid
            ? const Padding(
                padding: const EdgeInsets.only(top: 4.0),
                child: Text(
                  "Empty Email ,please entre an email ",
                  style: TextStyle(
                      fontSize: 12,
                      color: Colors.red,
                      fontWeight:
                          FontWeight.w300), // You can customize the style
                ),
              )
            : showError
                ? Text(
                    errorMessage,
                    style: TextStyle(
                        fontSize: 12,
                        color: Colors.red), // You can customize the style
                  )
                : SizedBox(
                    height: 8,
                  ),
      ],
    );
  }
}
