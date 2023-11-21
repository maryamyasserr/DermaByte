import 'package:dermabyte/Core/utils/colors.dart';
import 'package:dermabyte/Core/utils/font_styels.dart';
import 'package:dermabyte/Core/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SignButton extends StatelessWidget {
  final String buttonName ;
  const SignButton({super.key,
  required this.buttonName
  });

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(
                            horizontal: mediaQuery.width * 0.36,
                            vertical: mediaQuery.height * 0.015),
                        backgroundColor: AppColors.kPrimaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        )),
                    onPressed: () {
                      GoRouter.of(context).pushReplacement(AppRoutes.kSignIn);
                    },
                    child: Text(buttonName,
                        style: Styels.textStyle20_700
                            .copyWith(color: AppColors.kWhiteColor))
      );
  }
}