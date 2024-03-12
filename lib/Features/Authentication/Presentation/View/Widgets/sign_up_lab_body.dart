import 'package:dermabyte/Core/utils/assets.dart';
import 'package:dermabyte/Core/utils/colors.dart';
import 'package:dermabyte/Core/utils/routes.dart';
import 'package:dermabyte/Features/Authentication/Data/Models/lab_model.dart';
import 'package:dermabyte/Features/Authentication/Presentation/View%20Model/Auth%20Cubit/auth_cubit.dart';
import 'package:dermabyte/Features/Authentication/Presentation/View/Widgets/email_check.dart';
import 'package:dermabyte/Features/Authentication/Presentation/View/Widgets/sign_button.dart';
import 'package:dermabyte/Features/Authentication/Presentation/View/Widgets/text_form.dart';
import 'package:dermabyte/Features/Authentication/Presentation/View/Widgets/text_form_container.dart';
import 'package:dermabyte/Features/Authentication/Presentation/View/Widgets/title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: mediaQuery.height * 0.05,
          horizontal: mediaQuery.width * 0.03),
      child: SingleChildScrollView(
        child:
            Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          SizedBox(height: mediaQuery.height * 0.06),
          const CustomTitle(title: 'Sign Up'),
          SizedBox(height: mediaQuery.height * 0.04),
          // ignore: sized_box_for_whitespace
          TextFormContainer(
            mediaQuery: mediaQuery,
            label: 'Email',
            controller: SignUpLabBody.emailController,
          ),
          SizedBox(height: mediaQuery.height * 0.02),
          SizedBox(
            height: mediaQuery.height * 0.054,
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
          SizedBox(height: mediaQuery.height * 0.02),
          SizedBox(
            height: mediaQuery.height * 0.054,
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
            child: SvgPicture.asset(
              Assets.kRequiredIcon,
              alignment: Alignment.centerLeft,
            ),
          ),
          SizedBox(height: mediaQuery.height * 0.009),
          SizedBox(
            height: mediaQuery.height * 0.054,
            child: TextForm(
              label: 'Lab Name',
              controller: SignUpLabBody.labNameController,
            ),
          ),
          SizedBox(height: mediaQuery.height * 0.014),
          Padding(
            padding: const EdgeInsets.all(2.0),
            child: SvgPicture.asset(
              Assets.kRequiredIcon,
              alignment: Alignment.centerLeft,
            ),
          ),
          SizedBox(height: mediaQuery.height * 0.009),
          TextFormContainer(
            mediaQuery: mediaQuery,
            label: 'Location ',
            controller: SignUpLabBody.locationController,
          ),
          SizedBox(height: mediaQuery.height * 0.04),
          SignButton(
              isLoading: isLoading,
              buttonName: 'Sign Up',
              onClicked: () async {
                setState(() {
                  isLoading = true;
                });
                await BlocProvider.of<AuthCubit>(context).signUp(
                    context: context,
                    data: LabModel(
                      name: SignUpLabBody.labNameController.text,
                      mobile: '00000000000',
                      location: SignUpLabBody.locationController.text,
                      city: 'madrid',
                      country: 'spain',
                      license: ['lab', 'lab'],
                      email: SignUpLabBody.emailController.text,
                      password: SignUpLabBody.passwordController.text,
                      passwordConfirm: SignUpLabBody.rePasswordController.text,
                    ),
                    role: 'lap');
                setState(() {
                  isLoading = false;
                });
              }),
          SizedBox(height: mediaQuery.height * 0.01),
          EmailCheck(
            mediaQuery: mediaQuery,
            text: 'Already have an account?',
            textButton: 'sign in',
            onPressed: () {
              // GoRouter.of(context).push(AppRoutes.kSignIn);
              GoRouter.of(context).push(AppRoutes.kServiceSelectionView);
            },
          ),
        ]),
      ),
    );
  }
}
