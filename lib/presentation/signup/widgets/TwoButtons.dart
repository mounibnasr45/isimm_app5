import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:isimm_app5/core/utils/color_manager.dart';
import 'package:isimm_app5/presentation/login/view/loginview.dart';
import 'package:isimm_app5/presentation/signup/cubit/signupcubit.dart';

import '../../../core/utils/valurs_manager.dart';
import '../../login/cubit/login_cubit.dart';

class TwoButtons2 extends StatelessWidget {
  TwoButtons2({super.key, required this.islogin});
  double setwidth(double w) {
    return ScreenUtil().setWidth(w);
  }

  bool islogin;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: () {
            login_func(context);
            BlocProvider.of<SignupCubit>(context).loginClicked();
            BlocProvider.of<LoginCubit>(context).loginClicked();
            BlocProvider.of<LoginCubit>(context).initializeControllers();
          },
          child: Text(
            "Login",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: BlocProvider.of<SignupCubit>(context).isLogin
                  ? Colors.white
                  : Colors.black,
            ),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: islogin
                ? ColorManager.primary
                : null, // Changer la couleur de fond ici
          ),
        ),
        SizedBox(
          width: setwidth(8),
        ),
        ElevatedButton(
          onPressed: () {
            signup_func(context);
            BlocProvider.of<SignupCubit>(context).SignupClicked();
          },
          child: Text(
            "SignUp",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: !BlocProvider.of<SignupCubit>(context).isLogin
                  ? Colors.white
                  : Colors.black,
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
}
