import 'package:dermabyte/Core/utils/colors.dart';

import 'package:dermabyte/Core/utils/routes.dart';
import 'package:dermabyte/Features/Authentication/Data/Models/patient.dart';
import 'package:dermabyte/Features/Authentication/Presentation/View%20Model/Auth%20Cubit/auth_cubit.dart';
import 'package:dermabyte/Features/Authentication/Presentation/View/Widgets/email_check.dart';
import 'package:dermabyte/Features/Authentication/Presentation/View/Widgets/required_text_form.dart';
import 'package:dermabyte/Features/Authentication/Presentation/View/Widgets/sign_button.dart';
import 'package:dermabyte/Features/Authentication/Presentation/View/Widgets/text_form.dart';
import 'package:dermabyte/Features/Authentication/Presentation/View/Widgets/text_form_container.dart';
import 'package:dermabyte/Features/Authentication/Presentation/View/Widgets/title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SignUpPatientBody extends StatefulWidget {
  static TextEditingController emailController = TextEditingController();
  static TextEditingController passwordController = TextEditingController();
  static TextEditingController rePasswordController = TextEditingController();
  static TextEditingController firstNameController = TextEditingController();
  static TextEditingController lastNameController = TextEditingController();
  static TextEditingController mobileController = TextEditingController();
  static TextEditingController ageController = TextEditingController();
  static TextEditingController genderController = TextEditingController();
  const SignUpPatientBody({super.key});

  @override
  State<SignUpPatientBody> createState() => _SignUpPatientBodyState();
}

class _SignUpPatientBodyState extends State<SignUpPatientBody> {
  bool passwordVisible = false;
  bool rePasswordVisible = false;
  bool isLoading = false;
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
          RequiredTextForm(
              label: 'First name',
              controller: SignUpPatientBody.firstNameController),
          RequiredTextForm(
              label: 'Last name',
              controller: SignUpPatientBody.lastNameController),
          RequiredTextForm(
              label: 'Mobile', controller: SignUpPatientBody.mobileController),

          SizedBox(height: mediaQuery.height * 0.008),
          RequiredTextForm(
              label: 'age', controller: SignUpPatientBody.ageController),
          SizedBox(height: mediaQuery.height * 0.008),
          RequiredTextForm(
              label: 'gender', controller: SignUpPatientBody.genderController),
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
                  data: PatientModel(
                    firstName: SignUpPatientBody.firstNameController.text,
                    lastName: SignUpPatientBody.lastNameController.text,
                    age: 21,
                    gender: SignUpPatientBody.genderController.text,
                    // mobile: SignUpPatientBody.mobileController.text,
                    city: 'madrid',
                    country: 'spain',
                    email: SignUpPatientBody.emailController.text,
                    password: SignUpPatientBody.passwordController.text,
                    // passwordConfirm:
                    //     SignUpPatientBody.rePasswordController.text
                  ),
                  role: 'patient');
              setState(() {
                isLoading = false;
              });
            },
          ),
          const SizedBox(height: 6),
          EmailCheck(
              mediaQuery: mediaQuery,
              text: 'Already have an account?',
              textButton: 'sign in',
              onPressed: () {
                GoRouter.of(context).push(AppRoutes.kSignIn);
              }),
        ]),
      ),
    );
  }
}
