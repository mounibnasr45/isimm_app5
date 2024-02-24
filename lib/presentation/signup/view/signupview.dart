import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:isimm_app5/injector.dart';
import 'package:isimm_app5/presentation/login/view/loginview.dart';
import 'package:isimm_app5/presentation/shared/shared_functions.dart';
import 'package:isimm_app5/presentation/signup/widgets/TwoButtons.dart';
import 'package:isimm_app5/presentation/signup/widgets/nameField.dart';
import 'package:material_text_fields/material_text_fields.dart';
import 'package:material_text_fields/utils/form_validation.dart';
import '../../../core/utils/color_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utils/routes_manager.dart';
import '../../login/widgets/emailField.dart';
import '../../login/widgets/passwordField.dart';
import '../../shared/alert.dart';
import '../cubit/signupcubit.dart';
import '../cubit/signupstate.dart';
import '../widgets/dropDownButton.dart';
import '../widgets/signupButton.dart';

class SignupView extends StatelessWidget {
  SignupView({super.key});

  final SignupCubit _SignupCubit = instance<SignupCubit>();
  double setwidth(double w) {
    return ScreenUtil().setWidth(w);
  }

  double setheight(double h) {
    return ScreenUtil().setHeight(h);
  }

  List<bool> validCheck = [true, true, true, true];
  bool showError = false;
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return BlocProvider(
      create: (context) => _SignupCubit,
      child: Scaffold(
        backgroundColor: ColorManager.primary,
        body: SafeArea(
          child: Column(
            children: [
              logo_login(setwidth, setheight),
              Container(
                padding: EdgeInsets.symmetric(horizontal: setwidth(10)),
                height: Dimension.ScreenHeight(context) - 220,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50.0),
                    topRight: Radius.circular(50.0),
                  ),
                  // Add your desired background color here
                  color: ColorManager.white,
                ),
                child: Column(
                  children: [
                    BlocConsumer<SignupCubit, SignupState>(
                        listener: (context, state) {
                      if (state is SignupLoaded) {
                        LoginAlert.show(context, "Success",
                            "Registration successful", "OK");
                      } else if (state is Is_Login) {
                       // LoginAlert.show(context, "Success",
                         //   "Registration successful", "OK");

                        login_func(context);
                        _SignupCubit.loginClicked();
                      } else if (state is Is_Signup) {}
                    }, builder: (context, state) {
                      return state is SignupLoading
                          ? const Center(
                              child: CircularProgressIndicator(),
                            )
                          : Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: setwidth(20)),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      height: setheight(60),
                                    ),
                                    TwoButtons2(islogin: _SignupCubit.isLogin),
                                    SizedBox(
                                      height: setheight(40),
                                    ),
                                    NameField(
                                        showerror:
                                            state is NameIsEmpty ? true : false,
                                        s: _SignupCubit),
                                    SizedBox(
                                      height: setheight(10),
                                    ),
                                    EmailField(
                                        icon: false,
                                        showError: state is SignupError,
                                        valid: !(state is EmailIsEmpty),
                                        controller:
                                            _SignupCubit.emailController,
                                        errorMessage: "invalid email"),
                                    SizedBox(
                                      height: setheight(10),
                                    ),
                                    PasswordField(
                                        showError: state is ShortPassword,
                                        valid: !(state is PasswordIsEmpty),
                                        controller:
                                            _SignupCubit.passwordController),
                                    SizedBox(
                                      height: setheight(10),
                                    ),
                                    Row(
                                      children: [
                                        const Text(
                                          "   Speciality",
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                            color:
                                                Color.fromARGB(255, 97, 93, 93),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 20,
                                        ),
                                        Container(
                                            color: Colors.black,
                                            height: 50,
                                            width: 130,
                                            child: DropDownButton()),
                                      ],
                                    ),
                                    SizedBox(
                                      height: setheight(0),
                                    ),
                                    SizedBox(
                                      height: setheight(35),
                                    ),
                                    const signupButton(
                                      label: "SignUp",
                                    ),
                                  ]),
                            );
                    }),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Row two_buttons(double setwidth(double w), bool islogin, BuildContext context,
    SignupCubit l) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      ElevatedButton(
        onPressed: () {
          login_func(context);
          l.loginClicked();
        },
        child: Text(
          "Login",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: l.isLogin ? Colors.white : Colors.black,
          ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: l.isLogin
              ? ColorManager.primary
              : null, // Changer la couleur de fond ici
        ),
      ),
      SizedBox(
        width: setwidth(8),
      ),
      ElevatedButton(
        onPressed: () {
          // signup_func(context);
          // l.SignupClicked();
        },
        child: Text(
          "SignUp",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: !l.isLogin
                ? Color.fromARGB(255, 255, 255, 255)
                : Color.fromARGB(255, 0, 0, 0),
          ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: !islogin
              ? ColorManager.primary
              : null, // Changer la couleur de fond ici
        ),
      ),
    ],
  );
}

Padding logo_login(double setwidth(double w), double setheight(double h)) {
  return Padding(
    padding:
        EdgeInsets.symmetric(horizontal: setwidth(20), vertical: setheight(30)),
    child: Image.asset("assets/images/login_logo - Copy.png"),
  );
}

void login_func(BuildContext context) {
  Navigator.pushReplacementNamed(context, Routes.loginRoute);
}

void signup_func(BuildContext context) {
  Navigator.pushReplacementNamed(context, Routes.loginRoute);
}

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.label,
  });

  final String label;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // Your button click logic here
        Navigator.pushReplacementNamed(context, Routes.homeRoute);
      },
      child: Text(label),
      style: ButtonStyle(
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
