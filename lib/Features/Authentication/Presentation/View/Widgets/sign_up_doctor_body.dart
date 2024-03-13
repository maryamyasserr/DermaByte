import 'package:dermabyte/Core/utils/assets.dart';
import 'package:dermabyte/Core/utils/font_styels.dart';
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
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class SignUpDoctorBody extends StatelessWidget {
  SignUpDoctorBody({super.key});
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController rePasswordController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController genderController = TextEditingController();
  final TextEditingController aboutController = TextEditingController();

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
                  const CustomTitle(title: "Sign Up"),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.012),
                  const ProfilePicture(),
                  SizedBox(height: mediaQuery.height * 0.02),
                  TextFormContainer(
                    mediaQuery: mediaQuery,
                    controller: emailController,
                    label: 'Email',
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
                  SizedBox(height: mediaQuery.height * 0.009),
                  RequiredTextForm(
                      label: 'First name', controller: firstNameController),
                  RequiredTextForm(
                      label: 'Last name', controller: lastNameController),
                  RequiredTextForm(
                      label: "Gender", controller: genderController),
                  RequiredTextForm(
                      label: 'Mobile', controller: mobileController),
                  SizedBox(height: mediaQuery.height * 0.014),
                  TextFormContainer(
                    mediaQuery: mediaQuery,
                    label: 'Location',
                    controller: locationController,
                  ),
                  SizedBox(height: mediaQuery.height * 0.014),
                  TextFormContainer(
                    mediaQuery: mediaQuery,
                    label: 'about',
                    controller: aboutController,
                  ),
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
                        'Scan your work license ',
                        style: Styels.textStyle20_200(context),
                      ),
                      GestureDetector(
                          onTap: () {},
                          child: Image.asset(
                            'assets/images/upload_icon.png',
                          ))
                    ],
                  ),
                  SizedBox(height: mediaQuery.height * 0.03),
                  SignButton(
                      isLoading: BlocProvider.of<AuthCubit>(context).isLoding,
                      buttonName: 'Sign Up',
                      onClicked: () async {
                        // print(
                        //   File( BlocProvider.of<AuthHelperCubit>(context)
                        //     .profilePic!.path)
                        //  );
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
                                BlocProvider.of<AuthHelperCubit>(context).photo,
                            'sessionCost': 100,
                            'role': 'dermatologist'
                          }),
                          role: 'doctor',
                        );
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
