import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:isimm_app5/domain/use_cases/login_use_case.dart';
import 'package:isimm_app5/injector.dart';
import 'package:isimm_app5/presentation/login/cubit/login_cubit.dart';
import 'package:isimm_app5/presentation/login/cubit/login_state.dart';
import 'package:isimm_app5/presentation/shared/shared_functions.dart';
import '../../../core/utils/app_prefs.dart';
import '../../../core/utils/color_manager.dart';
import '../../../core/utils/image_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';

import '../../../core/utils/routes_manager.dart';
import '../../../core/utils/valurs_manager.dart';
import '../../shared/alert.dart';
import '../widgets/LogoLogin.dart';
import '../widgets/TwoButtons.dart';
import '../widgets/emailField.dart';
import '../widgets/forgotpassword.dart';
import '../widgets/login_button.dart';
import '../widgets/passwordField.dart';
import 'package:injector/injector.dart';

import '../widgets/remeber_checkBox.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});


  var prefs = AppPreferences.getPrefs();
  bool ischecked = false;
  bool showError = false;
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return FutureBuilder<bool>(
        future: AppPreferences.loadRememberCheckBoxState(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // La valeur n'a pas encore été récupérée, vous pouvez afficher un indicateur de chargement ici si nécessaire.
            return CircularProgressIndicator();
          } else if (snapshot.hasError) {
            // Gérer les erreurs ici si nécessaire.
            return Text('Error: ${snapshot.error}');
          } else {
            // La valeur a été récupérée avec succès, effectuer la vérification et la navigation.
            bool rememberCheckBoxValue = snapshot.data ?? false;
            //  bool rememberCheckBoxValue = false;

            if (rememberCheckBoxValue) {
              // Navigation différée au prochain cycle de construction
              WidgetsBinding.instance.addPostFrameCallback((_) {
                Navigator.pushReplacementNamed(context, Routes.homeRoute);
              });
            }
            return BlocBuilder<LoginCubit, LoginState>(
              builder: (context, state) {
                return Scaffold(
                  backgroundColor: ColorManager.primary,
                  body: SafeArea(
                    child: Column(
                      children: [
                        const logoLogin(),
                        getContent(context, state),
                      ],
                    ),
                  ),
                );
              },
            );
          }
        });
  }

  Container getContent(BuildContext context, LoginState state) {
    // Use context.read to obtain the LoginCubit
    final _loginCubit = context.read<LoginCubit>();

    return Container(
      padding: EdgeInsets.symmetric(horizontal: (10)),
      height: Dimension.ScreenHeight(context) - 220,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(50.0),
          topRight: Radius.circular(50.0),
        ),
        color: ColorManager.white,
      ),
      child: Column(
        children: [
          BlocConsumer<LoginCubit, LoginState>(
            listener: (context, state) {
              if (state is LoginLoaded) {
                tohome(context);
              } else if (state is Is_Login) {
                login_func(context);
                _loginCubit.loginClicked();
              } else if (state is Is_Signup) {}
            },
            builder: (context, state) {
              return state is LoginLoading
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : Container(
                      padding: EdgeInsets.symmetric(horizontal: (20)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(height: (60)),
                          TwoButtons1(islogin: _loginCubit.isLogin),
                          SizedBox(height: (40)),
                          EmailField(
                            icon: true,
                            showError: state is LoginError ? true : false,
                            valid: state is EmailIsEmpty ? false : true,
                            controller: _loginCubit.emailController,
                            errorMessage: "invalid email",
                          ),
                          SizedBox(height: (6)),
                          PasswordField(
                            showError: state is LoginError ? true : false,
                            valid: state is PasswordIsEmpty ? false : true,
                            controller: _loginCubit.passwordController,
                          ),
                          SizedBox(height: (10)),
                          Row(
                            children: [
                              RememberCheckBox(selected: ischecked),
                              const Text(
                                "Remember me",
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 14),
                              ),
                              Spacer(),
                              ForgotPassword(),
                            ],
                          ),
                          SizedBox(height: (40)),
                          const LoginButton(label: "Login"),
                        ],
                      ),
                    );
            },
          ),
        ],
      ),
    );
  }
}
