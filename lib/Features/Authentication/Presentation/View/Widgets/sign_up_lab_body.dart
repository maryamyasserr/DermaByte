import 'package:dermabyte/Core/utils/assets.dart';
import 'package:dermabyte/Core/utils/font_styels.dart';
import 'package:dermabyte/Core/utils/routes.dart';
import 'package:dermabyte/Features/Authentication/Presentation/View%20Model/Auth%20Cubit/auth_cubit.dart';
import 'package:dermabyte/Features/Authentication/Presentation/View%20Model/Auth%20Helper/auth_helper.dart';
import 'package:dermabyte/Features/Authentication/Presentation/View/Widgets/email_check.dart';
import 'package:dermabyte/Features/Authentication/Presentation/View/Widgets/password_textField.dart';
import 'package:dermabyte/Features/Authentication/Presentation/View/Widgets/profile_picture_patient.dart';
import 'package:dermabyte/Features/Authentication/Presentation/View/Widgets/sign_button.dart';
import 'package:dermabyte/Features/Authentication/Presentation/View/Widgets/text_form.dart';
import 'package:dermabyte/Features/Authentication/Presentation/View/Widgets/text_form_container.dart';
import 'package:dermabyte/Features/Authentication/Presentation/View/Widgets/title.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

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
                  const ProfilePicturePatinet(),
                  SizedBox(height: mediaQuery.height * 0.04),
                  TextFormContainer(
                    mediaQuery: mediaQuery,
                    label: 'Email',
                    controller: SignUpLabBody.emailController,
                  ),
                  SizedBox(height: mediaQuery.height * 0.02),
                  PasswordTextField(
                      onTap: () {
                        BlocProvider.of<AuthHelperCubit>(context)
                            .passwordVisability();
                      },
                      controller: SignUpLabBody.passwordController,
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
                      controller: SignUpLabBody.rePasswordController,
                      text: 'Re-type Password',
                      mediaQuery: mediaQuery,
                      rePasswordVisible:
                          BlocProvider.of<AuthHelperCubit>(context).rePassword),
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
                  SizedBox(
                    height: mediaQuery.height * 0.054,
                    child: TextForm(
                      label: 'Mobile',
                      controller: SignUpLabBody.mobileController,
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
                  SizedBox(height: mediaQuery.height * 0.005),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        BlocProvider.of<AuthHelperCubit>(context).labLicense ==
                                null
                            ? 'Scan your work license'
                            : BlocProvider.of<AuthHelperCubit>(context)
                                .labLicense!
                                .name,
                        style: Styels.textStyle20_200(context),
                      ),
                      GestureDetector(
                          onTap: () async {
                            await BlocProvider.of<AuthHelperCubit>(context)
                                .uploadLicense(role: 'l');
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
                        setState(() {
                          isLoading = true;
                        });
                        await BlocProvider.of<AuthCubit>(context).signUp(
                            context: context,
                            data: FormData.fromMap({
                              'firstName': SignUpLabBody.labNameController.text,
                              'mobile': SignUpLabBody.mobileController.text,
                              'location': SignUpLabBody.locationController.text,
                              'city': "city",
                              'country': "country",
                              'license':
                                  BlocProvider.of<AuthHelperCubit>(context)
                                      .labLicense,
                              'email': SignUpLabBody.emailController.text,
                              'password': SignUpLabBody.passwordController.text,
                              'passwordConfirm':
                                  SignUpLabBody.rePasswordController.text,
                              'role': 'lab',
                            }),
                            role: 'lab');
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
