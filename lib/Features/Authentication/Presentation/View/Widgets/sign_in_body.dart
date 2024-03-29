import 'package:dermabyte/Core/Widgets/snack_bar.dart';
import 'package:dermabyte/Core/utils/colors.dart';
import 'package:dermabyte/Core/utils/font_styels.dart';
import 'package:dermabyte/Core/utils/routes.dart';
import 'package:dermabyte/Features/Authentication/Presentation/View%20Model/Auth%20Cubit/auth_cubit.dart';
import 'package:dermabyte/Features/Authentication/Presentation/View/Widgets/email_check.dart';
import 'package:dermabyte/Features/Authentication/Presentation/View/Widgets/sign_button.dart';
import 'package:dermabyte/Features/Authentication/Presentation/View/Widgets/text_form.dart';
import 'package:dermabyte/Features/Authentication/Presentation/View/Widgets/title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthFailure) {
          showSnackBar(context, state.errMessage);
        } else if (state is AuthSuccess) {
          showSnackBar(context, "Success");
        }
      },
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(14.0),
          child: SingleChildScrollView(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: mediaQuery.height * 0.11),
                  const CustomTitle(
                    title: 'Sign In',
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
                  SignButton(
                    isLoading: BlocProvider.of<AuthCubit>(context).isLoding,
                    buttonName: 'Sign in',
                    onClicked: () async {
                      await BlocProvider.of<AuthCubit>(context).signIn(body: {
                        "email": SignInBody.emailController.text,
                        "password": SignInBody.passwordController.text
                      }, context: context);
                    },
                  ),
                  SizedBox(height: mediaQuery.height * 0.05),
                  InkWell(
                    onTap: () {},
                    child: Text(
                      'forgot password?',
                      style: Styels.textStyle15_400(context)
                          .copyWith(color: const Color.fromRGBO(0, 0, 0, 0.6)),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: mediaQuery.height * 0.03),
                  EmailCheck(
                    mediaQuery: mediaQuery,
                    text: 'Don’t have an account?',
                    textButton: 'sign up',
                    onPressed: () {
                      GoRouter.of(context).push(AppRoutes.kSignUpAs);
                    },
                  )
                ]),
          ),
        );
      },
    );
  }
}
