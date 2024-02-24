import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:isimm_app5/presentation/signup/cubit/signupcubit.dart';
import 'package:material_text_fields/material_text_fields.dart';

class NameField extends StatelessWidget {
  NameField({super.key, required this.s,required this.showerror});
  SignupCubit s;
  bool showerror=false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MaterialTextField(
          keyboardType: TextInputType.name,
          hint: 'Name',
          textInputAction: TextInputAction.next,
          prefixIcon: const Icon(Icons.person),
          //suffixIcon: showerror?const Icon(Icons.check):const Icon(Icons.warning),
          controller: s.nameController,
          validator: (String? value) {
            return (value == null || value.isEmpty) ? 'Please enter a name' : null;
          },
        ),
      showerror?const Text(
                  "Empty Name ,please entre your name ",
                  style: TextStyle(
                      fontSize: 12,
                      color: Colors.red,
                      fontWeight:
                          FontWeight.w300), // You can customize the style
                ):SizedBox(
                    height: 8,
                  ),
      ],
    );
  }
}
