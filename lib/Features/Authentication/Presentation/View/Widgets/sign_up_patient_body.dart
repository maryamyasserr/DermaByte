import 'package:dermabyte/Core/utils/routes.dart';
import 'package:dermabyte/Features/Authentication/Presentation/View%20Model/Auth%20Cubit/auth_cubit.dart';
import 'package:dermabyte/Features/Authentication/Presentation/View%20Model/Auth%20Helper/auth_helper.dart';
import 'package:dermabyte/Features/Authentication/Presentation/View/Widgets/email_check.dart';
import 'package:dermabyte/Features/Authentication/Presentation/View/Widgets/password_textField.dart';
import 'package:dermabyte/Features/Authentication/Presentation/View/Widgets/profile_picture.dart';
import 'package:dermabyte/Features/Authentication/Presentation/View/Widgets/required_text_form.dart';
import 'package:dermabyte/Features/Authentication/Presentation/View/Widgets/sign_button.dart';
import 'package:dermabyte/Features/Authentication/Presentation/View/Widgets/text_form_container.dart';
import 'package:dermabyte/Features/Authentication/Presentation/View/Widgets/title.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SignUpPatientBody extends StatelessWidget {
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
                  const ProfilePicture(),
                  SizedBox(height: mediaQuery.height * 0.04),
                  TextFormContainer(
                    mediaQuery: mediaQuery,
                    label: 'Email',
                    controller: emailController,
                  ),
                  SizedBox(height: mediaQuery.height * 0.014),
                  PasswordTextField(
                      onTap: () {
                        BlocProvider.of<AuthHelperCubit>(context)
                            .passwordVisability();
                      },
                      controller: passwordController,
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
                      controller: rePasswordController,
                      text: 'Re-type Password',
                      mediaQuery: mediaQuery,
                      rePasswordVisible:
                          BlocProvider.of<AuthHelperCubit>(context).rePassword),
                  SizedBox(height: mediaQuery.height * 0.02),
                  RequiredTextForm(
                      label: 'First name', controller: firstNameController),
                  RequiredTextForm(
                      label: 'Last name', controller: lastNameController),
                  RequiredTextForm(
                      label: 'Mobile', controller: mobileController),
                  SizedBox(height: mediaQuery.height * 0.008),
                  RequiredTextForm(label: 'age', controller: ageController),
                  SizedBox(height: mediaQuery.height * 0.008),
                  RequiredTextForm(
                      label: 'gender', controller: genderController),
                  SizedBox(height: mediaQuery.height * 0.04),
                  SignButton(
                    isLoading: BlocProvider.of<AuthCubit>(context).isLoding,
                    buttonName: 'Sign Up',
                    onClicked: () async {
                      await BlocProvider.of<AuthCubit>(context).signUp(
                          context: context,
                          data: FormData.fromMap({
                            'firstName': firstNameController.text,
                            'lastName': lastNameController.text,
                            'age': ageController.text,
                            'city': "city",
                            'country': "country",
                            'profilePic':
                                BlocProvider.of<AuthHelperCubit>(context)
                                    .profilePic,
                            'gender': genderController.text,
                            'email': emailController.text,
                            'password': passwordController.text,
                            'passwordConfirm': rePasswordController.text,
                            'role': 'patient',
                          }),
                          role: 'patient');
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
