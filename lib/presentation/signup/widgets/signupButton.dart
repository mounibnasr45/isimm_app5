import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:isimm_app5/core/utils/color_manager.dart';
import 'package:isimm_app5/presentation/signup/cubit/signupcubit.dart';

class signupButton extends StatelessWidget {
  const signupButton({
    super.key,
    required this.label,
  });

  final String label;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        BlocProvider.of<SignupCubit>(context).Signup();
        //Navigator.pushReplacementNamed(context, Routes.homeRoute);
      },
      child: Text(
        label,
        style: TextStyle(
            color: const Color.fromARGB(255, 255, 255, 255),
            fontWeight: FontWeight.w500,
            fontSize: 18),
      ),
      style: ButtonStyle(
        fixedSize: MaterialStateProperty.all<Size>(Size(300.0,
            35.0)), // Ajustez la largeur (200.0) et la hauteur (50.0) selon vos besoins
        backgroundColor: MaterialStateProperty.all<Color>(ColorManager.primary),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(10.0), // Adjust the radius as needed
          ),
        ),
      ),
    );
  }
}
