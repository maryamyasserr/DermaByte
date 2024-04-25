import 'dart:io';

import 'package:dermabyte/Core/utils/routes.dart';
import 'package:dermabyte/Features/Authentication/Presentation/View%20Model/Auth%20Cubit/auth_cubit.dart';
import 'package:dermabyte/Features/Authentication/Presentation/View%20Model/Auth%20Helper/auth_helper.dart';
import 'package:dermabyte/Features/Authentication/Presentation/View/Widgets/email_check.dart';
import 'package:dermabyte/Features/Authentication/Presentation/View/Widgets/password_textField.dart';
import 'package:dermabyte/Features/Authentication/Presentation/View/Widgets/profile_picture_patient.dart';
import 'package:dermabyte/Features/Authentication/Presentation/View/Widgets/sign_button.dart';
import 'package:dermabyte/Features/Authentication/Presentation/View/Widgets/text_form.dart';
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
    final formKey = GlobalKey<FormState>();
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
                  Form(
                      key: formKey,
                      child: Column(
                        children: [
                          TextForm(
                              validator: (email) {
                                if (email == null || email.isEmpty) {
                                  return "Email is Required";
                                }
                                var regex = RegExp(
                                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
                                if (!regex.hasMatch(email)) {
                                  return "Invaild Email";
                                } else {
                                  return null;
                                }
                              },
                              label: 'Email',
                              controller: SignUpPatientBody.emailController),
                          SizedBox(height: mediaQuery.height * 0.016),
                          PasswordTextField(
                              onTap: () {
                                BlocProvider.of<AuthHelperCubit>(context)
                                    .passwordVisability();
                              },
                              validator: (password) {
                                if (password == null || password.isEmpty) {
                                  return "Password is Required";
                                }
                                if (password.length < 6) {
                                  return "At least 6 characters";
                                } else {
                                  return null;
                                }
                              },
                              controller: SignUpPatientBody.passwordController,
                              text: 'Password',
                              mediaQuery: mediaQuery,
                              rePasswordVisible:
                                  BlocProvider.of<AuthHelperCubit>(context)
                                      .password),
                          SizedBox(height: mediaQuery.height * 0.015),
                          PasswordTextField(
                              validator: (repassword) {
                                if (repassword == null || repassword.isEmpty) {
                                  return "Re-aPassword is Required";
                                }
                                if (SignUpPatientBody.passwordController.text !=
                                    SignUpPatientBody
                                        .rePasswordController.text) {
                                  return "Password Doesn't Match";
                                } else {
                                  return null;
                                }
                              },
                              onTap: () {
                                BlocProvider.of<AuthHelperCubit>(context)
                                    .rePasswordVisability();
                              },
                              controller:
                                  SignUpPatientBody.rePasswordController,
                              text: 'Re-type Password',
                              mediaQuery: mediaQuery,
                              rePasswordVisible:
                                  BlocProvider.of<AuthHelperCubit>(context)
                                      .rePassword),
                          SizedBox(height: mediaQuery.height * 0.016),
                          TextForm(
                              validator: (fname) {
                                if (fname == null || fname.isEmpty) {
                                  return "First Name is Required";
                                } else {
                                  return null;
                                }
                              },
                              label: 'First Name',
                              controller:
                                  SignUpPatientBody.firstNameController),
                          SizedBox(height: mediaQuery.height * 0.016),
                          TextForm(
                            validator: (lname) {
                              if (lname == null || lname.isEmpty) {
                                return "Last Name is Required";
                              } else {
                                return null;
                              }
                            },
                            label: 'Last Name',
                            controller: SignUpPatientBody.lastNameController,
                          ),
                          SizedBox(height: mediaQuery.height * 0.016),
                          TextForm(
                            validator: (gender) {
                              if (gender == null || gender.isEmpty) {
                                return "Gender is Required";
                              } else {
                                return null;
                              }
                            },
                            label: 'Gender',
                            controller: SignUpPatientBody.genderController,
                          ),
                          SizedBox(height: mediaQuery.height * 0.016),
                          TextForm(
                            validator: (phone) {
                              if (phone == null || phone.isEmpty) {
                                return "Phone Number is Required";
                              }
                              if (phone.length < 11) {
                                return "Invalid Phone Number";
                              } else {
                                return null;
                              }
                            },
                            label: 'Phone Number',
                            controller: SignUpPatientBody.mobileController,
                          ),
                          SizedBox(height: mediaQuery.height * 0.016),
                          TextForm(
                            validator: (age) {
                              if (age == null || age.isEmpty) {
                                return "Age is Required";
                              } else {
                                return null;
                              }
                            },
                            label: 'Age',
                            controller: SignUpPatientBody.ageController,
                          ),
                        ],
                      )),
                  SizedBox(height: mediaQuery.height * 0.04),
                  SignButton(
                    isLoading: isLoding,
                    buttonName: 'Sign Up',
                    onClicked: () async {
                      if (formKey.currentState!.validate()) {
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
                                      .profilePatient!
                                      .readAsBytes(),
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
                      }
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
