
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:isimm_app5/core/utils/color_manager.dart';
import 'package:isimm_app5/presentation/login/cubit/login_cubit.dart';

import '../../../core/utils/valurs_manager.dart';
import '../view/loginview.dart';

class TwoButtons1 extends StatelessWidget {
   TwoButtons1({
    super.key,required this.islogin
  });
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
          onPressed: () {},
          child: Text(
            "Login",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: BlocProvider.of<LoginCubit>(context).isLogin ? Colors.white : Colors.black,
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
            BlocProvider.of<LoginCubit>(context).SignupClicked();
          },
          child: Text(
            "SignUp",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: !BlocProvider.of<LoginCubit>(context).isLogin ? Colors.white : Colors.black,
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