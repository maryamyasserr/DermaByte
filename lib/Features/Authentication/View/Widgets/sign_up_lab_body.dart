import 'package:dermabyte/Core/utils/assets.dart';
import 'package:dermabyte/Core/utils/colors.dart';
import 'package:dermabyte/Core/utils/font_styels.dart';
import 'package:dermabyte/Core/utils/routes.dart';
import 'package:dermabyte/Features/Authentication/View/Widgets/continue_with_button.dart';
import 'package:dermabyte/Features/Authentication/View/Widgets/sign_button.dart';
import 'package:dermabyte/Features/Authentication/View/Widgets/text_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class SignUpLabBody extends StatefulWidget {
  static TextEditingController emailController = TextEditingController();
  static TextEditingController passwordController = TextEditingController();
  static TextEditingController rePasswordController = TextEditingController();
  static TextEditingController locationController = TextEditingController();
  static TextEditingController labNameController = TextEditingController();
  const SignUpLabBody({super.key});

  @override
  State<SignUpLabBody> createState() => _SignUpPatientBodyState();
}

class _SignUpPatientBodyState extends State<SignUpLabBody> {
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
              controller: SignUpLabBody.emailController,
            ),
          ),
          SizedBox(height: mediaQuery.height * 0.014),
          // ignore: sized_box_for_whitespace
          Container(
            height: mediaQuery.height *0.054,
            child: TextForm(
              label: 'Password',
              controller: SignUpLabBody.passwordController,
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
              controller: SignUpLabBody.rePasswordController,
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
          SizedBox(height: mediaQuery.height * 0.009),
          Padding(
            padding: const EdgeInsets.all(2.0),
            child: SvgPicture.asset(Assets.kRequiredIcon,
            alignment: Alignment.centerLeft,
            ),
          ),
          SizedBox(height: mediaQuery.height * 0.009),
           // ignore: sized_box_for_whitespace
           Container(
            height: mediaQuery.height *0.054,
            child: TextForm(
              label: 'Lab Name',
              controller:SignUpLabBody.labNameController,
            ),
          ),
          SizedBox(height: mediaQuery.height * 0.014),
          Padding(
            padding: const EdgeInsets.all(2.0),
            child: SvgPicture.asset(Assets.kRequiredIcon,
            alignment: Alignment.centerLeft,
            ),
          ),
          SizedBox(height: mediaQuery.height * 0.009),
           // ignore: sized_box_for_whitespace
           Container(
            height: mediaQuery.height *0.054,
            child: TextForm(
              label: 'Location ',
              controller: SignUpLabBody.locationController,
            ),
          ),
          SizedBox(height: mediaQuery.height * 0.025),
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