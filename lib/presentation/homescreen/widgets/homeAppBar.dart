import 'package:flutter/material.dart';
import 'package:isimm_app5/core/utils/color_manager.dart';
import 'package:isimm_app5/core/utils/routes_manager.dart';
import 'package:isimm_app5/presentation/login/cubit/login_state.dart';

class HomeAppBar extends StatelessWidget {
  HomeAppBar({
    super.key,
    this.withprofile = true,
    required this.mystate,
  });

  final LoginState mystate;
  final bool withprofile;

  @override
  Widget build(BuildContext context) {
    return AppBar(
        automaticallyImplyLeading: false,

      title: Container(
        child: ListTile(
          title: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 5),
                child: Text(
                  "Hello",
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: const Color.fromARGB(170, 85, 83, 83),
                      fontWeight: FontWeight.w600),
                ),
              ),
              Image.asset(
                "assets/images/clapping.png",
                height: 15,
                color: const Color.fromARGB(255, 207, 192, 53),
              )
            ],
          ),
          subtitle: _buildSubtitle(context),
          leading: GestureDetector(
            onTap: () {
              Navigator.of(context).pushReplacementNamed(Routes.profile);
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Image.asset(
                "assets/images/professor_img.jpeg",
                height: 45,
                width: 45,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Padding(
            padding: EdgeInsets.only(right: 8.0),
            child: Icon(
              Icons.notifications_active_outlined,
              size: 28,
            ),
          ),
        )
      ],
    );
  }

  Widget _buildSubtitle(BuildContext context) {
    if (mystate is LoginLoaded) {
      final loginLoadedState = mystate as LoginLoaded;
      return Text(
        loginLoadedState.s.nom,
        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: const Color.fromARGB(170, 0, 0, 0),
              fontWeight: FontWeight.w600,
            ),
      );
    } else {
      return const SizedBox.shrink();
    }
  }
}
