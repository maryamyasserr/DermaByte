import 'package:dermabyte/Core/utils/assets.dart';
import 'package:dermabyte/Core/utils/colors.dart';
import 'package:dermabyte/Core/utils/font_styels.dart';
import 'package:dermabyte/Core/utils/routes.dart';
import 'package:dermabyte/Features/Authentication/View/Widgets/continue_with_button.dart';
import 'package:dermabyte/Features/Authentication/View/Widgets/required_text_form.dart';
import 'package:dermabyte/Features/Authentication/View/Widgets/sign_button.dart';
import 'package:dermabyte/Features/Authentication/View/Widgets/text_form.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SignUpPatientBody extends StatefulWidget {
  static TextEditingController emailController = TextEditingController();
  static TextEditingController passwordController = TextEditingController();
  static TextEditingController rePasswordController = TextEditingController();
  static TextEditingController firstNameController = TextEditingController();
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
          Text(
            'Sign Up',
            style: Styels.textStyle40,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: mediaQuery.height * 0.04),
          // ignore: sized_box_for_whitespace
          Container(
            height: mediaQuery.height *0.054,
            child: TextForm(
              label: 'Email',
              controller: SignUpPatientBody.emailController,
            ),
          ),
          SizedBox(height: mediaQuery.height * 0.014),
          // ignore: sized_box_for_whitespace
          Container(
            height: mediaQuery.height *0.054,
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
            height: mediaQuery.height *0.054,
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
              RequiredTextForm(label: 'First name', controller: SignUpPatientBody.firstNameController),
              RequiredTextForm(label: 'Last name', controller: SignUpPatientBody.firstNameController),
              RequiredTextForm(label: 'Mobile', controller: SignUpPatientBody.firstNameController),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RequiredTextForm(label: 'Day', controller: SignUpPatientBody.firstNameController),
              RequiredTextForm(label: 'Month', controller: SignUpPatientBody.firstNameController),
              RequiredTextForm(label: 'Year', controller: SignUpPatientBody.firstNameController),
            ],
          ),
          SizedBox(height: mediaQuery.height * 0.05),
          const SignButton(buttonName: 'Sign Up'),
          SizedBox(height: mediaQuery.height * 0.03),
          IntrinsicHeight(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 2.0,
                  width: mediaQuery.width * 0.23,
                  color: const Color.fromRGBO(0, 0, 0, 0.4),
                  margin: const EdgeInsets.only(left: 10.0, right: 10.0),
                ),
                Text(
                  'Or continue with',
                  style: Styels.textStyle15_400
                      .copyWith(color: const Color.fromRGBO(0, 0, 0, 0.4)),
                  textAlign: TextAlign.center,
                ),
                Container(
                  height: 2.0,
                  width: mediaQuery.width * 0.23,
                  color: const Color.fromRGBO(0, 0, 0, 0.4),
                  margin: const EdgeInsets.only(left: 10.0, right: 10.0),
                ),
              ],
            ),
          ),
          SizedBox(height: mediaQuery.height * 0.035),
          ContinueWithButton(
              borderSideColor: AppColors.kfacebookButton,
              textStyle: Styels.textStyle12_700
                  .copyWith(fontSize: 18, color: AppColors.kWhiteColor),
              image: Assets.kFacebookIcon,
              buttonName: 'Continue with Facebook',
              backgroundColor: AppColors.kfacebookButton),
          SizedBox(height: mediaQuery.height * 0.02),
          ContinueWithButton(
              borderSideColor: Colors.black,
              textStyle: Styels.textStyle12_700
                  .copyWith(fontSize: 18, color: Colors.black),
              image: Assets.kGoogleIcon,
              buttonName: 'Continue with Google',
              backgroundColor: AppColors.kWhiteColor),
          SizedBox(height: mediaQuery.height * 0.015),
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
                  }, child: Text('sign in',
                style: Styels.textStyle15_300
                    .copyWith(color: const Color.fromRGBO(150, 1, 1, 0.5)),
              ),
          )],
          )
        ]),
      ),
    );
  }
}
