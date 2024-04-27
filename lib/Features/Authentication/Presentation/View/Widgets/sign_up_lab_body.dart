import 'package:dermabyte/Core/Widgets/failed_alert.dart';
import 'package:dermabyte/Core/utils/font_styels.dart';
import 'package:dermabyte/Core/utils/routes.dart';
import 'package:dermabyte/Features/Authentication/Presentation/View%20Model/Auth%20Cubit/auth_cubit.dart';
import 'package:dermabyte/Features/Authentication/Presentation/View%20Model/Auth%20Helper/auth_helper.dart';
import 'package:dermabyte/Features/Authentication/Presentation/View/Widgets/email_check.dart';
import 'package:dermabyte/Features/Authentication/Presentation/View/Widgets/lab_pic.dart';
import 'package:dermabyte/Features/Authentication/Presentation/View/Widgets/password_textField.dart';
import 'package:dermabyte/Features/Authentication/Presentation/View/Widgets/sign_button.dart';
import 'package:dermabyte/Features/Authentication/Presentation/View/Widgets/text_form.dart';
import 'package:dermabyte/Features/Authentication/Presentation/View/Widgets/title.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:http_parser/http_parser.dart';

class SignUpLabBody extends StatefulWidget {
  const SignUpLabBody({super.key});
  static TextEditingController emailController = TextEditingController();
  static TextEditingController passwordController = TextEditingController();
  static TextEditingController rePasswordController = TextEditingController();
  static TextEditingController locationController = TextEditingController();
  static TextEditingController labNameController = TextEditingController();
  static TextEditingController mobileController = TextEditingController();

  @override
  State<SignUpLabBody> createState() => _SignUpLabBodyState();
}

class _SignUpLabBodyState extends State<SignUpLabBody> {
  bool isLoading = false;
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return BlocConsumer<AuthHelperCubit, AuthHeplerState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: mediaQuery.width * 0.03),
          child: SingleChildScrollView(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: mediaQuery.height * 0.06),
                  const CustomTitle(title: 'Sign Up'),
                  SizedBox(height: mediaQuery.height * 0.04),
                  const LabPic(),
                  SizedBox(height: mediaQuery.height * 0.04),
                  Form(
                      key: formKey,
                      child: Column(
                        children: [
                          TextForm(
                              enable: true,
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
                              controller: SignUpLabBody.emailController),
                          SizedBox(height: mediaQuery.height * 0.018),
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
                              controller: SignUpLabBody.passwordController,
                              text: 'Password',
                              mediaQuery: mediaQuery,
                              rePasswordVisible:
                                  BlocProvider.of<AuthHelperCubit>(context)
                                      .password),
                          SizedBox(height: mediaQuery.height * 0.015),
                          PasswordTextField(
                              validator: (repassword) {
                                if (repassword == null || repassword.isEmpty) {
                                  return "Re-Password is Required";
                                }
                                if (SignUpLabBody.passwordController.text !=
                                    SignUpLabBody.rePasswordController.text) {
                                  return "Password Doesn't Match";
                                } else {
                                  return null;
                                }
                              },
                              onTap: () {
                                BlocProvider.of<AuthHelperCubit>(context)
                                    .rePasswordVisability();
                              },
                              controller: SignUpLabBody.rePasswordController,
                              text: 'Re-type Password',
                              mediaQuery: mediaQuery,
                              rePasswordVisible:
                                  BlocProvider.of<AuthHelperCubit>(context)
                                      .rePassword),
                          SizedBox(height: mediaQuery.height * 0.018),
                          TextForm(
                              enable: true,
                              validator: (labName) {
                                if (labName == null || labName.isEmpty) {
                                  return "Lab Name is Required";
                                }
                                if (labName.length < 2) {
                                  return 'at least 2 characters';
                                } else {
                                  return null;
                                }
                              },
                              label: 'Lab Name',
                              controller: SignUpLabBody.labNameController),
                          SizedBox(height: mediaQuery.height * 0.018),
                          TextForm(
                            enable: true,
                            validator: (phone) {
                              if (phone == null || phone.isEmpty) {
                                return "Phone Number is Required";
                              }
                              if (phone.length < 11) {
                                return 'Invalid Phone Number';
                              } else {
                                return null;
                              }
                            },
                            label: 'Phone Number',
                            controller: SignUpLabBody.mobileController,
                          ),
                          SizedBox(height: mediaQuery.height * 0.018),
                          TextForm(
                            enable: true,
                            validator: (location) {
                              if (location == null || location.isEmpty) {
                                return "Location is Required";
                              } else {
                                return null;
                              }
                            },
                            label: 'Location',
                            controller: SignUpLabBody.locationController,
                          )
                        ],
                      )),
                  SizedBox(height: mediaQuery.height * 0.019),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        BlocProvider.of<AuthHelperCubit>(context).labLicense ==
                                null
                            ? 'Scan your work license'
                            : BlocProvider.of<AuthHelperCubit>(context)
                                .labLicense![0]
                                .name,
                        style: Styels.textStyle20_200(context),
                      ),
                      GestureDetector(
                          onTap: () async {
                            await BlocProvider.of<AuthHelperCubit>(context)
                                .uploadLicense(role: 'l');
                            print(BlocProvider.of<AuthHelperCubit>(context)
                                .labLicense);
                          },
                          child: BlocProvider.of<AuthHelperCubit>(context)
                                      .labLicense ==
                                  null
                              ? Image.asset(
                                  'assets/images/upload_icon.png',
                                )
                              : const Icon(Icons.done))
                    ],
                  ),
                  SizedBox(height: mediaQuery.height * 0.04),
                  SignButton(
                      isLoading: isLoading,
                      buttonName: 'Sign Up',
                      onClicked: () async {
                        if (formKey.currentState!.validate()) {
                          setState(() {
                            isLoading = true;
                          });
                          if (BlocProvider.of<AuthHelperCubit>(context)
                                  .profileLab ==
                              null) {
                            failedAlert(
                                context, "The Profile Photo is Required");
                          } else if (BlocProvider.of<AuthHelperCubit>(context)
                                  .labLicense ==
                              null) {
                            failedAlert(context, "Must Provied Your licenses");
                          } else {
                            FormData formData = FormData();
                            formData.files.add(
                              MapEntry(
                                  'profilePic',
                                  await MultipartFile.fromFile(
                                      BlocProvider.of<AuthHelperCubit>(context)
                                          .profileLab!
                                          .path,
                                      filename: 'profilePic.jpg',
                                      contentType: MediaType('image', 'jpeg'))),
                            );
                       
                          
                            for (int i = 0;
                                i <
                                    BlocProvider.of<AuthHelperCubit>(context)
                                        .labLicense!
                                        .length;
                                i++) {
                              formData.files.add(
                                MapEntry(
                                  'lablicense$i',
                                  await MultipartFile.fromFile(
                                    BlocProvider.of<AuthHelperCubit>(context)
                                        .labLicense![i]
                                        .path,
                                    filename: 'lablicense$i.jpg',
                                    contentType: MediaType('image', 'jpeg'),
                                  ),
                                ),
                              );
                            }
                            formData.fields.addAll([
                              MapEntry('firstName',
                                  SignUpLabBody.labNameController.text),
                              MapEntry('mobile',
                                  SignUpLabBody.mobileController.text),
                              MapEntry('location',
                                  SignUpLabBody.locationController.text),
                              const MapEntry('city', 'city'),
                              // const MapEntry('license', ['license']),
                              // const MapEntry<String, int>('sessionCost', 100),
                              const MapEntry('country', 'country'),
                              MapEntry(
                                  'email', SignUpLabBody.emailController.text),
                              MapEntry('password',
                                  SignUpLabBody.passwordController.text),
                              MapEntry('passwordConfirm',
                                  SignUpLabBody.rePasswordController.text),

                            
                              const MapEntry('role', 'lab'),
                            ]);
                            await BlocProvider.of<AuthCubit>(context).signUp(
                                context: context, data: formData, role: 'lab');
                          }

                          setState(() {
                            isLoading = false;
                          });
                        }
                      }),
                  SizedBox(height: mediaQuery.height * 0.01),
                  EmailCheck(
                    mediaQuery: mediaQuery,
                    text: 'Already have an account?',
                    textButton: 'sign in',
                    onPressed: () {
                      // GoRouter.of(context).push(AppRoutes.kSignIn);
                      GoRouter.of(context)
                          .push(AppRoutes.kServiceSelectionView);
                    },
                  ),
                ]),
          ),
        );
      },
    );
  }
}
