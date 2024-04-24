import 'package:dermabyte/Core/utils/assets.dart';
import 'package:dermabyte/Core/utils/font_styels.dart';
import 'package:dermabyte/Core/utils/routes.dart';
import 'package:dermabyte/Features/Authentication/Presentation/View%20Model/Auth%20Cubit/auth_cubit.dart';
import 'package:dermabyte/Features/Authentication/Presentation/View%20Model/Auth%20Helper/auth_helper.dart';
import 'package:dermabyte/Features/Authentication/Presentation/View/Widgets/doc_pic.dart';
import 'package:dermabyte/Features/Authentication/Presentation/View/Widgets/email_check.dart';
import 'package:dermabyte/Features/Authentication/Presentation/View/Widgets/password_textField.dart';
import 'package:dermabyte/Features/Authentication/Presentation/View/Widgets/sign_button.dart';
import 'package:dermabyte/Features/Authentication/Presentation/View/Widgets/text_form.dart';
import 'package:dermabyte/Features/Authentication/Presentation/View/Widgets/title.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class SignUpDoctorBody extends StatefulWidget {
  const SignUpDoctorBody({super.key});

  @override
  State<SignUpDoctorBody> createState() => _SignUpDoctorBodyState();
}

class _SignUpDoctorBodyState extends State<SignUpDoctorBody> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final TextEditingController rePasswordController = TextEditingController();

  final TextEditingController firstNameController = TextEditingController();

  final TextEditingController lastNameController = TextEditingController();

  final TextEditingController mobileController = TextEditingController();

  final TextEditingController locationController = TextEditingController();

  final TextEditingController genderController = TextEditingController();

  final TextEditingController aboutController = TextEditingController();

  bool isLoading = false;
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
                  const CustomTitle(title: "Sign Up"),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.012),
                  const ProfilePictureDoctor(),
                  SizedBox(height: mediaQuery.height * 0.02),
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
                              controller: emailController),
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
                              controller: passwordController,
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
                                if (passwordController.text !=
                                    rePasswordController.text) {
                                  return "Password Doesn't Match";
                                } else {
                                  return null;
                                }
                              },
                              onTap: () {
                                BlocProvider.of<AuthHelperCubit>(context)
                                    .rePasswordVisability();
                              },
                              controller: rePasswordController,
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
                              controller: firstNameController),
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
                            controller: lastNameController,
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
                            controller: genderController,
                          ),
                          SizedBox(height: mediaQuery.height * 0.016),
                          TextForm(
                            validator: (phone) {
                              if (phone == null || phone.isEmpty) {
                                return "Phone Number is Required";
                              } else {
                                return null;
                              }
                            },
                            label: 'Phone Number',
                            controller: mobileController,
                          ),
                          SizedBox(height: mediaQuery.height * 0.016),
                          TextForm(
                            validator: (location) {
                              if (location == null || location.isEmpty) {
                                return "Location is Required";
                              } else {
                                return null;
                              }
                            },
                            label: 'Location',
                            controller: locationController,
                          ),
                          SizedBox(height: mediaQuery.height * 0.016),
                          TextForm(
                            validator: (about) {
                              if (about == null || about.isEmpty) {
                                return "About is Required";
                              } else {
                                return null;
                              }
                            },
                            label: 'about',
                            controller: aboutController,
                          ),
                        ],
                      )),
                  SizedBox(height: mediaQuery.height * 0.015),
                  SvgPicture.asset(
                    Assets.kRequiredIcon,
                    alignment: Alignment.centerLeft,
                  ),
                  SizedBox(height: mediaQuery.height * 0.005),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        BlocProvider.of<AuthHelperCubit>(context).labLicense ==
                                null
                            ? 'Scan your work license'
                            : BlocProvider.of<AuthHelperCubit>(context)
                                .docotrLicense!
                                .name,
                        style: Styels.textStyle20_200(context),
                      ),
                      GestureDetector(
                          onTap: () async {
                            await BlocProvider.of<AuthHelperCubit>(context)
                                .uploadLicense(role: 'd');
                          },
                          child: BlocProvider.of<AuthHelperCubit>(context)
                                      .docotrLicense ==
                                  null
                              ? Image.asset(
                                  'assets/images/upload_icon.png',
                                )
                              : const Icon(Icons.done))
                    ],
                  ),
                  SizedBox(height: mediaQuery.height * 0.03),
                  SignButton(
                      isLoading: isLoading,
                      buttonName: 'Sign Up',
                      onClicked: () async {
                        if (formKey.currentState!.validate()) {
                          setState(() {
                            isLoading = true;
                          });
                          await BlocProvider.of<AuthCubit>(context).signUp(
                            context: context,
                            data: FormData.fromMap({
                              'firstName': firstNameController.text,
                              'lastName': lastNameController.text,
                              'gender': genderController.text,
                              'mobile': mobileController.text,
                              'location': locationController.text,
                              'city': "Madirid",
                              'country': "Spain",
                              'specialization': aboutController,
                              'license': ['Doctor'],
                              'email': emailController.text,
                              'password': passwordController.text,
                              'passwordConfirm': rePasswordController.text,
                              'profilePic':
                                  BlocProvider.of<AuthHelperCubit>(context)
                                      .profileDoctor,
                              'sessionCost': 100,
                              'role': 'dermatologist'
                            }),
                            role: 'doctor',
                          );

                          setState(() {
                            isLoading = false;
                          });
                        }
                      }),
                  SizedBox(height: mediaQuery.height * 0.006),
                  EmailCheck(
                      mediaQuery: mediaQuery,
                      text: 'Already have an account?',
                      textButton: 'sign in',
                      onPressed: () {
                        GoRouter.of(context).push(AppRoutes.kSignIn);
                      })
                ])));
      },
    );
  }
}
