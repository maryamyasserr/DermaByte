import 'package:dermabyte/Core/utils/assets.dart';
import 'package:dermabyte/Core/utils/colors.dart';
import 'package:dermabyte/Core/utils/font_styels.dart';
import 'package:dermabyte/Core/utils/routes.dart';
import 'package:dermabyte/Features/Authentication/View/Widgets/continue_with_button.dart';
import 'package:dermabyte/Features/Authentication/View/Widgets/sign_button.dart';
import 'package:dermabyte/Features/Authentication/View/Widgets/text_form.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SignInBody extends StatefulWidget {
  const SignInBody({super.key});
  static TextEditingController emailController = TextEditingController();
  static TextEditingController passwordController = TextEditingController();

  @override
  State<SignInBody> createState() => _SignInBodyState();
}

class _SignInBodyState extends State<SignInBody> {
  bool passwordVisible = false;
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(14.0),
      child: SingleChildScrollView(
        child:
            Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          SizedBox(height: mediaQuery.height * 0.11),
          Text(
            'Sign In',
            style: Styels.textStyle40,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: mediaQuery.height * 0.07),
          TextForm(
            label: 'Email',
            controller: SignInBody.emailController,
          ),
          SizedBox(height: mediaQuery.height * 0.014),
          TextForm(
            label: 'Password',
            controller: SignInBody.passwordController,
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
          SizedBox(height: mediaQuery.height * 0.04),
          const SignButton(buttonName: 'Sign in'),
          SizedBox(height: mediaQuery.height * 0.05),
          InkWell(
            onTap: (){},
            child: Text(
              'forgot password?',
              style: Styels.textStyle15_400
                  .copyWith(color: const Color.fromRGBO(0, 0, 0, 0.6)),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: mediaQuery.height * 0.03),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Don’t have an account?',
                style: Styels.textStyle18_300
                    .copyWith(color: const Color.fromRGBO(0, 0, 0, 0.4)),
              ),
              SizedBox(width: mediaQuery.width *  0.0002),
              TextButton(
                onPressed: () {
                  GoRouter.of(context).push(AppRoutes.kSignUpPatient);
                  }, child: Text('sign up',
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
