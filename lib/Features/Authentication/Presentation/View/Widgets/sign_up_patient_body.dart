import 'package:dermabyte/Core/utils/routes.dart';
import 'package:dermabyte/Features/Authentication/Presentation/View%20Model/Auth%20Cubit/auth_cubit.dart';
import 'package:dermabyte/Features/Authentication/Presentation/View%20Model/Auth%20Helper/auth_helper.dart';
import 'package:dermabyte/Features/Authentication/Presentation/View/Widgets/email_check.dart';
import 'package:dermabyte/Features/Authentication/Presentation/View/Widgets/password_textField.dart';
import 'package:dermabyte/Features/Authentication/Presentation/View/Widgets/profile_picture_patient.dart';
import 'package:dermabyte/Features/Authentication/Presentation/View/Widgets/required_text_form.dart';
import 'package:dermabyte/Features/Authentication/Presentation/View/Widgets/sign_button.dart';
import 'package:dermabyte/Features/Authentication/Presentation/View/Widgets/text_form_container.dart';
import 'package:dermabyte/Features/Authentication/Presentation/View/Widgets/title.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SignUpPatientBody extends StatefulWidget {
  const SignUpPatientBody({super.key});
  static TextEditingController emailController = TextEditingController();
  static TextEditingController passwordController = TextEditingController();
  static TextEditingController rePasswordController = TextEditingController();
  static TextEditingController firstNameController = TextEditingController();
  static TextEditingController lastNameController = TextEditingController();
  static TextEditingController mobileController = TextEditingController();
  static TextEditingController ageController = TextEditingController();
  static TextEditingController genderController = TextEditingController();

  @override
  State<SignUpPatientBody> createState() => _SignUpPatientBodyState();
}

class _SignUpPatientBodyState extends State<SignUpPatientBody> {
  bool isLoding = false;

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return BlocConsumer<AuthHelperCubit, AuthHeplerState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(15.0),
          child: SingleChildScrollView(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: mediaQuery.height * 0.06),
                  const CustomTitle(title: 'Sign Up'),
                  SizedBox(height: mediaQuery.height * 0.04),
                  const ProfilePicturePatinet(),
                  SizedBox(height: mediaQuery.height * 0.04),
                  TextFormContainer(
                    mediaQuery: mediaQuery,
                    label: 'Email',
                    controller: SignUpPatientBody.emailController,
                  ),
                  SizedBox(height: mediaQuery.height * 0.014),
                  PasswordTextField(
                      onTap: () {
                        BlocProvider.of<AuthHelperCubit>(context)
                            .passwordVisability();
                      },
                      controller: SignUpPatientBody.passwordController,
                      text: 'Password',
                      mediaQuery: mediaQuery,
                      rePasswordVisible:
                          BlocProvider.of<AuthHelperCubit>(context).password),
                  SizedBox(height: mediaQuery.height * 0.014),
                  PasswordTextField(
                      onTap: () {
                        BlocProvider.of<AuthHelperCubit>(context)
                            .rePasswordVisability();
                      },
                      controller: SignUpPatientBody.rePasswordController,
                      text: 'Re-type Password',
                      mediaQuery: mediaQuery,
                      rePasswordVisible:
                          BlocProvider.of<AuthHelperCubit>(context).rePassword),
                  SizedBox(height: mediaQuery.height * 0.02),
                  RequiredTextForm(
                      label: 'First name',
                      controller: SignUpPatientBody.firstNameController),
                  RequiredTextForm(
                      label: 'Last name',
                      controller: SignUpPatientBody.lastNameController),
                  RequiredTextForm(
                      label: 'Mobile',
                      controller: SignUpPatientBody.mobileController),
                  SizedBox(height: mediaQuery.height * 0.008),
                  RequiredTextForm(
                      label: 'age',
                      controller: SignUpPatientBody.ageController),
                  SizedBox(height: mediaQuery.height * 0.008),
                  RequiredTextForm(
                      label: 'gender',
                      controller: SignUpPatientBody.genderController),
                  SizedBox(height: mediaQuery.height * 0.04),
                  SignButton(
                    isLoading: isLoding,
                    buttonName: 'Sign Up',
                    onClicked: () async {
                      setState(() {
                        isLoding = true;
                      });
                      await BlocProvider.of<AuthCubit>(context).signUp(
                          context: context,
                          data: FormData.fromMap({
                            'firstName':
                                SignUpPatientBody.firstNameController.text,
                            'lastName':
                                SignUpPatientBody.lastNameController.text,
                            'age': SignUpPatientBody.ageController.text,
                            'city': "city",
                            'country': "country",
                            'profilePic':
                                BlocProvider.of<AuthHelperCubit>(context)
                                    .profilePatient,
                            'gender': SignUpPatientBody.genderController.text,
                            'email': SignUpPatientBody.emailController.text,
                            'password':
                                SignUpPatientBody.passwordController.text,
                            'passwordConfirm':
                                SignUpPatientBody.rePasswordController.text,
                            'role': 'patient',
                          }),
                          role: 'patient');
                           setState(() {
                        isLoding = false;
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
      },
    );
  }
}
