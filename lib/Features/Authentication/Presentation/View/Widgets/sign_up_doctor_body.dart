import 'package:dermabyte/Core/Widgets/failed_alert.dart';
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
import 'package:http_parser/http_parser.dart';

class SignUpDoctorBody extends StatefulWidget {
  const SignUpDoctorBody({super.key});
  static TextEditingController emailController = TextEditingController();
  static TextEditingController passwordController = TextEditingController();
  static TextEditingController rePasswordController = TextEditingController();
  static TextEditingController firstNameController = TextEditingController();
  static TextEditingController lastNameController = TextEditingController();
  static TextEditingController mobileController = TextEditingController();
  static TextEditingController locationController = TextEditingController();
  static TextEditingController genderController = TextEditingController();
  static TextEditingController aboutController = TextEditingController();

  @override
  State<SignUpDoctorBody> createState() => _SignUpDoctorBodyState();
}

class _SignUpDoctorBodyState extends State<SignUpDoctorBody> {
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
                              controller: SignUpDoctorBody.emailController),
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
                              controller: SignUpDoctorBody.passwordController,
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
                                if (SignUpDoctorBody.passwordController.text !=
                                    SignUpDoctorBody
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
                              controller: SignUpDoctorBody.rePasswordController,
                              text: 'Re-type Password',
                              mediaQuery: mediaQuery,
                              rePasswordVisible:
                                  BlocProvider.of<AuthHelperCubit>(context)
                                      .rePassword),
                          SizedBox(height: mediaQuery.height * 0.016),
                          TextForm(
                              enable: true,
                              validator: (fname) {
                                if (fname == null || fname.isEmpty) {
                                  return "First Name is Required";
                                }
                                if (fname.length < 2) {
                                  return "At Least 2 Characters";
                                }
                                if (fname.length > 32) {
                                  return "Maximum Characters is 32";
                                } else {
                                  return null;
                                }
                              },
                              label: 'First Name',
                              controller: SignUpDoctorBody.firstNameController),
                          SizedBox(height: mediaQuery.height * 0.016),
                          TextForm(
                            enable: true,
                            validator: (lname) {
                              if (lname == null || lname.isEmpty) {
                                return "Last Name is Required";
                              }
                              if (lname.length < 2) {
                                return "At Least 2 Characters";
                              }
                              if (lname.length > 32) {
                                return "Maximum Characters is 32";
                              } else {
                                return null;
                              }
                            },
                            label: 'Last Name',
                            controller: SignUpDoctorBody.lastNameController,
                          ),
                          SizedBox(height: mediaQuery.height * 0.016),
                          Stack(
                            children: [
                              TextForm(
                                enable: false,
                                validator: (gender) {
                                  if (gender == null || gender.isEmpty) {
                                    return "Gender is Required";
                                  } else {
                                    return null;
                                  }
                                },
                                label: "Gender",
                                controller: SignUpDoctorBody.genderController,
                              ),
                              Positioned(
                                right: 10,
                                top: 9,
                                child: DropdownButton<String>(
                                  elevation: 0,
                                  underline: const SizedBox(),
                                  items: <String>['male', 'female']
                                      .map((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(
                                        value,
                                        style: Styels.textStyle20_300(context),
                                      ),
                                    );
                                  }).toList(),
                                  onChanged: (value) {
                                    setState(() {
                                      SignUpDoctorBody.genderController.text =
                                          value!;
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: mediaQuery.height * 0.016),
                          TextForm(
                            enable: true,
                            validator: (phone) {
                              if (phone == null || phone.isEmpty) {
                                return "Phone Number is Required";
                              }

                              if (phone.length < 11) {
                                return "invalid Phone Number";
                              } else {
                                return null;
                              }
                            },
                            label: 'Phone Number',
                            controller: SignUpDoctorBody.mobileController,
                          ),
                          SizedBox(height: mediaQuery.height * 0.016),
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
                            controller: SignUpDoctorBody.locationController,
                          ),
                          SizedBox(height: mediaQuery.height * 0.016),
                          TextForm(
                            enable: true,
                            validator: (about) {
                              if (about == null || about.isEmpty) {
                                return "About is Required";
                              } else {
                                return null;
                              }
                            },
                            label: 'about',
                            controller: SignUpDoctorBody.aboutController,
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
                                .docotrLicense![0]
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
                          if (BlocProvider.of<AuthHelperCubit>(context)
                                  .profileDoctor ==
                              null) {
                            failedAlert(
                                context, "The Profile Photo is Required");
                          } else if (BlocProvider.of<AuthHelperCubit>(context)
                                  .docotrLicense ==
                              null) {
                            failedAlert(context, "Must Provied Your licenses");
                          } else {
                            FormData formData = FormData();
                            formData.files.add(
                              MapEntry(
                                  'profilePic',
                                  await MultipartFile.fromFile(
                                      BlocProvider.of<AuthHelperCubit>(context)
                                          .profileDoctor!
                                          .path,
                                      filename: 'profilePic.jpg',
                                      contentType: MediaType('image', 'jpeg'))),
                            );
                            for (int i = 0;
                                i <
                                    BlocProvider.of<AuthHelperCubit>(context)
                                        .docotrLicense!
                                        .length;
                                i++) {
                              formData.files.add(
                                MapEntry(
                                  'license',
                                  await MultipartFile.fromFile(
                                    BlocProvider.of<AuthHelperCubit>(context)
                                        .docotrLicense![i]
                                        .path,
                                    filename: 'docotrLicense$i.jpg',
                                    contentType: MediaType('image', 'jpeg'),
                                  ),
                                ),
                              );
                            }
                            formData.fields.addAll([
                              MapEntry('firstName',
                                  SignUpDoctorBody.firstNameController.text),
                              MapEntry('lastName',
                                  SignUpDoctorBody.lastNameController.text),
                              const MapEntry('age', "Age"),
                              const MapEntry('city', 'city'),
                              // const MapEntry<String, int>('sessionCost', 100),
                              const MapEntry('country', 'country'),
                              MapEntry('gender',
                                  SignUpDoctorBody.genderController.text),
                              MapEntry('phone',
                                  SignUpDoctorBody.mobileController.text),
                              MapEntry('email',
                                  SignUpDoctorBody.emailController.text),
                              MapEntry('password',
                                  SignUpDoctorBody.passwordController.text),
                              MapEntry('passwordConfirm',
                                  SignUpDoctorBody.rePasswordController.text),
                              MapEntry("specialization",
                                  SignUpDoctorBody.aboutController.text),
                              const MapEntry('role', 'dermatologist'),
                            ]);
                            await BlocProvider.of<AuthCubit>(context).signUp(
                              context: context,
                              data: formData,
                              role: 'doctor',
                            );
                          }
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
