import 'package:dermabyte/Core/utils/font_styels.dart';
import 'package:dermabyte/Core/utils/routes.dart';
import 'package:dermabyte/Features/Authentication/View/Widgets/sign_up_as_button.dart';
import 'package:dermabyte/Features/Authentication/View/Widgets/title.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SignUpAsViewBody extends StatelessWidget {
  const SignUpAsViewBody({super.key});
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: mediaQuery.height * 0.1),
          const CustomTitle(title: 'Sign Up As'),
          SizedBox(height: mediaQuery.height * 0.15),
          SignUpAsButton(
              buttonName: 'A Doctor',
              onClicked: () {
                GoRouter.of(context).push(AppRoutes.kSignUpDoctor);
              }),
          SizedBox(height: mediaQuery.height * 0.06),
          SignUpAsButton(
              buttonName: 'A Laboratory ',
              onClicked: () {
                GoRouter.of(context).push(AppRoutes.kSignUpLab);
              }),
          SizedBox(height: mediaQuery.height * 0.06),
          SignUpAsButton(
              buttonName: 'A Patient',
              onClicked: () {
                GoRouter.of(context).push(AppRoutes.kSignUpPatient);
              }),
        ],
      ),
    );
  }
}
