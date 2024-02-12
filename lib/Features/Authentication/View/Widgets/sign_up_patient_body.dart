import 'package:dermabyte/Core/utils/colors.dart';
import 'package:dermabyte/Core/utils/font_styels.dart';
import 'package:dermabyte/Core/utils/routes.dart';
import 'package:dermabyte/Features/Authentication/View/Widgets/email_check.dart';
import 'package:dermabyte/Features/Authentication/View/Widgets/required_text_form.dart';
import 'package:dermabyte/Features/Authentication/View/Widgets/sign_button.dart';
import 'package:dermabyte/Features/Authentication/View/Widgets/text_form.dart';
import 'package:dermabyte/Features/Authentication/View/Widgets/text_form_container.dart';
import 'package:dermabyte/Features/Authentication/View/Widgets/title.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SignUpPatientBody extends StatefulWidget {
  static TextEditingController emailController = TextEditingController();
  static TextEditingController passwordController = TextEditingController();
  static TextEditingController rePasswordController = TextEditingController();
  static TextEditingController firstNameController = TextEditingController();
  static TextEditingController lastNameController = TextEditingController();
  static TextEditingController mobileController = TextEditingController();
  static TextEditingController dayController = TextEditingController();
  static TextEditingController monthController = TextEditingController();
  static TextEditingController yearController = TextEditingController();
  const SignUpPatientBody({super.key});

  @override
  State<SignUpPatientBody> createState() => _SignUpPatientBodyState();
}

class _SignUpPatientBodyState extends State<SignUpPatientBody> {
  bool passwordVisible = false;
  bool rePasswordVisible = false;
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: SingleChildScrollView(
        child:
            Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          SizedBox(height: mediaQuery.height * 0.06),
          const CustomTitle(title: 'Sign Up'),
          SizedBox(height: mediaQuery.height * 0.04),
          TextFormContainer(
            mediaQuery: mediaQuery,
            label: 'Email',
            controller: SignUpPatientBody.emailController,
          ),

          SizedBox(height: mediaQuery.height * 0.014),
         
          SizedBox(
            height: mediaQuery.height * 0.054,
            child: TextForm(
              label: 'Password',
              controller: SignUpPatientBody.passwordController,
              suffixIcon: GestureDetector(
                  onTap: () {
                    passwordVisible = !passwordVisible;
                    setState(() {});
                  },
                  child: passwordVisible == true
                      ? const Icon(
                          Icons.visibility_off_outlined,
                          size: 28,
                          color: AppColors.kPrimaryColor,
                        )
                      : const Icon(
                          Icons.visibility_outlined,
                          size: 28,
                          color: AppColors.kPrimaryColor,
                        )),
              obscureText: !passwordVisible,
            ),
          ),
          SizedBox(height: mediaQuery.height * 0.014),
          // ignore: sized_box_for_whitespace
          Container(
            height: mediaQuery.height * 0.054,
            child: TextForm(
              label: 'Re-type Password',
              controller: SignUpPatientBody.rePasswordController,
              suffixIcon: GestureDetector(
                  onTap: () {
                    rePasswordVisible = !rePasswordVisible;
                    setState(() {});
                  },
                  child: rePasswordVisible == true
                      ? const Icon(
                          Icons.visibility_off_outlined,
                          size: 28,
                          color: AppColors.kPrimaryColor,
                        )
                      : const Icon(
                          Icons.visibility_outlined,
                          size: 28,
                          color: AppColors.kPrimaryColor,
                        )),
              obscureText: !rePasswordVisible,
            ),
          ),
          SizedBox(height: mediaQuery.height * 0.02),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RequiredTextForm(
                  label: 'First name',
                  controller: SignUpPatientBody.firstNameController),
              RequiredTextForm(
                  label: 'Last name',
                  controller: SignUpPatientBody.lastNameController),
              RequiredTextForm(
                  label: 'Mobile',
                  controller: SignUpPatientBody.mobileController),
            ],
          ),
          SizedBox(height: mediaQuery.height * 0.008),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RequiredTextForm(
                  label: 'Day', controller: SignUpPatientBody.dayController),
              RequiredTextForm(
                  label: 'Month',
                  controller: SignUpPatientBody.monthController),
              RequiredTextForm(
                  label: 'Year', controller: SignUpPatientBody.yearController),
            ],
          ),
          SizedBox(height: mediaQuery.height * 0.04),
          SignButton(
            buttonName: 'Sign Up',
            onClicked: () {
              GoRouter.of(context).pushReplacement(AppRoutes.kCustomScreen);
            },
          ),
          SizedBox(height: mediaQuery.height * 0.25),
          EmailCheck(
              mediaQuery: mediaQuery,
              text: 'Already have an account?',
              textButton: 'sign in',
              onPressed: () {
                GoRouter.of(context).push(AppRoutes.kSignIn);
              }),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Already have an account?',
                style: Styels.textStyle18_300
                    .copyWith(color: const Color.fromRGBO(0, 0, 0, 0.4)),
              ),
              SizedBox(width: mediaQuery.width * 0.0002),
              TextButton(
                onPressed: () {
                  GoRouter.of(context).push(AppRoutes.kSignIn);
                },
                child: Text(
                  'sign in',
                  style: Styels.textStyle15_300
                      .copyWith(color: const Color.fromRGBO(150, 1, 1, 0.5)),
                ),
              )
            ],
          )
        ]),
      ),
    );
  }
}
