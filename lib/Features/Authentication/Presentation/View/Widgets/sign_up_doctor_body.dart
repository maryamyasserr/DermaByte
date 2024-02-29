import 'package:dermabyte/Core/utils/assets.dart';
import 'package:dermabyte/Core/utils/colors.dart';
import 'package:dermabyte/Core/utils/font_styels.dart';
import 'package:dermabyte/Core/utils/routes.dart';
import 'package:dermabyte/Features/Authentication/Data/Models/doctor_model.dart';
import 'package:dermabyte/Features/Authentication/Presentation/View%20Model/Auth%20Cubit/auth_cubit.dart';
import 'package:dermabyte/Features/Authentication/Presentation/View/Widgets/email_check.dart';
import 'package:dermabyte/Features/Authentication/Presentation/View/Widgets/profile_picture.dart';
import 'package:dermabyte/Features/Authentication/Presentation/View/Widgets/required_text_form.dart';
import 'package:dermabyte/Features/Authentication/Presentation/View/Widgets/sign_button.dart';
import 'package:dermabyte/Features/Authentication/Presentation/View/Widgets/text_form.dart';
import 'package:dermabyte/Features/Authentication/Presentation/View/Widgets/text_form_container.dart';
import 'package:dermabyte/Features/Authentication/Presentation/View/Widgets/title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

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
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
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
                controller: SignUpDoctorBody.emailController,
                label: 'Email',
              ),
              SizedBox(height: mediaQuery.height * 0.014),
              SizedBox(
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
              RequiredTextForm(
                  label: 'First name',
                  controller: SignUpDoctorBody.firstNameController),
              RequiredTextForm(
                  label: 'Last name',
                  controller: SignUpDoctorBody.lastNameController),
              RequiredTextForm(
                  label: 'Mobile',
                  controller: SignUpDoctorBody.mobileController),
              SizedBox(height: mediaQuery.height * 0.014),
              TextFormContainer(
                mediaQuery: mediaQuery,
                label: 'Location',
                controller: SignUpDoctorBody.locationController,
              ),
              SizedBox(height: mediaQuery.height * 0.014),
              TextFormContainer(
                mediaQuery: mediaQuery,
                label: 'Specialization ',
                controller: SignUpDoctorBody.specilazationController,
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
                  isLoading: isLoading,
                  buttonName: 'Sign Up',
                  onClicked: () async {
                    setState(() {
                      isLoading = true;
                    });
                    await BlocProvider.of<AuthCubit>(context).signUp(
                        context: context,
                        data: DoctorModel(
                          firstName: SignUpDoctorBody.firstNameController.text,
                          lastName: SignUpDoctorBody.lastNameController.text,
                          mobile: SignUpDoctorBody.mobileController.text,
                          location: SignUpDoctorBody.locationController.text,
                          city: "Madrid",
                          country: "Spain",
                          specialization:
                              SignUpDoctorBody.specilazationController.text,
                          license: "doctor",
                          email: SignUpDoctorBody.emailController.text,
                          password: SignUpDoctorBody.passwordController.text,
                          passwordConfirm:
                              SignUpDoctorBody.rePasswordController.text,
                          profilePic: "RRRRRRkk",
                          sessionCost: 100,
                        ),
                        role: 'doctor',
                        token: '');

                    setState(() {
                      isLoading = false;
                    });
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
  }
}
