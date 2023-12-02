import 'dart:io';
import 'package:dermabyte/Core/utils/assets.dart';
import 'package:dermabyte/Core/utils/colors.dart';
import 'package:dermabyte/Core/utils/font_styels.dart';
import 'package:dermabyte/Core/utils/routes.dart';
import 'package:dermabyte/Features/Authentication/View/Widgets/required_text_form.dart';
import 'package:dermabyte/Features/Authentication/View/Widgets/sign_button.dart';
import 'package:dermabyte/Features/Authentication/View/Widgets/text_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

class SignUpDoctorBody extends StatefulWidget {
  static TextEditingController emailController = TextEditingController();
  static TextEditingController passwordController = TextEditingController();
  static TextEditingController rePasswordController = TextEditingController();
  static TextEditingController firstNameController = TextEditingController();
  static TextEditingController lastNameController = TextEditingController();
  static TextEditingController mobileController = TextEditingController();
  static TextEditingController locationController = TextEditingController();
  static TextEditingController specilazationController =
      TextEditingController();
  const SignUpDoctorBody({super.key});

  @override
  State<SignUpDoctorBody> createState() => _SignUpPatientBodyState();
}

class _SignUpPatientBodyState extends State<SignUpDoctorBody> {
  bool passwordVisible = false;
  bool rePasswordVisible = false;

  Future<void> uploadPicture(BuildContext context) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      // ignore: use_build_context_synchronously
      GoRouter.of(context)
          .go('${AppRoutes.kSignUpDoctor}?imagePath=${pickedFile.path}');
    }
  }

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    final Map<String, dynamic>? args =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;

    String? imagePath = args?['imagePath'];

    return Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
              SizedBox(height: mediaQuery.height * 0.06),
              Text(
                'Sign Up',
                style: Styels.textStyle40,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.012),
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.white),
                        color: AppColors.kWhiteColor,
                        shape: BoxShape.circle),
                    child: CircleAvatar(
                      backgroundColor: const Color(0xffB9EEE8),
                      radius: 50,
                      child: ClipOval(
                        child: SizedBox(
                          width: mediaQuery.width *
                              0.25, // Adjust the size as needed
                          height: mediaQuery.height * 0.12,
                          child: imagePath != null
                              ? Image.file(
                                  File(imagePath),
                                  fit: BoxFit.cover,
                                )
                              : SvgPicture.asset(Assets.kProfileAvatar),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                      bottom: 0,
                      right: mediaQuery.height * 0.17,
                      child: GestureDetector(
                          onTap: () {
                            uploadPicture(context);
                          },
                          child: const ImageIcon(
                            AssetImage('assets/images/upload_icon.png'),
                            size: 30,
                          )))
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'add a picture',
                    style: Styels.textStyle20_200
                        .copyWith(decoration: TextDecoration.underline),
                  ),
                  SizedBox(
                    width: mediaQuery.width * 0.02,
                  ),
                  SvgPicture.asset(Assets.kRequiredIcon,
                      height: mediaQuery.height * 0.01),
                ],
              ),

              SizedBox(height: mediaQuery.height * 0.02),
              // ignore: sized_box_for_whitespace
              Container(
                height: mediaQuery.height * 0.054,
                child: TextForm(
                  label: 'Email',
                  controller: SignUpDoctorBody.emailController,
                ),
              ),
              SizedBox(height: mediaQuery.height * 0.014),
              // ignore: sized_box_for_whitespace
              Container(
                height: mediaQuery.height * 0.054,
                child: TextForm(
                  label: 'Password',
                  controller: SignUpDoctorBody.passwordController,
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
                height: mediaQuery.height * 0.05,
                child: TextForm(
                  label: 'Re-type Password',
                  controller: SignUpDoctorBody.rePasswordController,
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RequiredTextForm(
                      label: 'First name',
                      controller: SignUpDoctorBody.firstNameController),
                  RequiredTextForm(
                      label: 'Last name',
                      controller: SignUpDoctorBody.lastNameController),
                  RequiredTextForm(
                      label: 'Mobile',
                      controller: SignUpDoctorBody.mobileController),
                ],
              ),
              SizedBox(height: mediaQuery.height * 0.014),
              // ignore: sized_box_for_whitespace
              Container(
                height: mediaQuery.height * 0.054,
                child: TextForm(
                  label: 'Location',
                  controller: SignUpDoctorBody.locationController,
                ),
              ),
              SizedBox(height: mediaQuery.height * 0.014),
              // ignore: sized_box_for_whitespace
              Container(
                height: mediaQuery.height * 0.054,
                child: TextForm(
                  label: 'Specialization ',
                  controller: SignUpDoctorBody.specilazationController,
                ),
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
                    style: Styels.textStyle20_200,
                  ),
                  GestureDetector(
                      onTap: () {},
                      child: Image.asset(
                        'assets/images/upload_icon.png',
                      ))
                ],
              ),
              SizedBox(height: mediaQuery.height * 0.03),
              SignButton(buttonName: 'Sign Up',onClicked: (){
                GoRouter.of(context).pushReplacement('');
              }),
              SizedBox(height: mediaQuery.height * 0.006),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already have an account?',
                    style: Styels.textStyle18_300
                        .copyWith(color: const Color.fromRGBO(0, 0, 0, 0.4)),
                  ),
                  SizedBox(width: mediaQuery.width * 0.0002),
                  TextButton(
                    onPressed: () {
                      GoRouter.of(context).push(AppRoutes.kSignIn);
                    },
                    child: Text(
                      'sign in',
                      style: Styels.textStyle15_300.copyWith(
                          color: const Color.fromRGBO(150, 1, 1, 0.5)),
                    ),
                  )
                ],
              ),
            ])));
  }
}
