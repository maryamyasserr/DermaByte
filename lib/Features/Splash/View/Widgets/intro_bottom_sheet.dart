import 'package:dermabyte/Core/utils/colors.dart';
import 'package:dermabyte/Core/utils/font_styels.dart';
import 'package:dermabyte/Core/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class IntroBottomSheet extends StatelessWidget {
  const IntroBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return Container(
      // height: mediaQuery.height * 0.46,
      width: mediaQuery.width,
      decoration: const BoxDecoration(
        color: AppColors.kWhiteColor,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20)),
      ),
      child: Column(children: [
        const SizedBox(height: 20),
        Text(
          'Detect skin cancer \n with 95% accuracy',
          textAlign: TextAlign.center,
          style: Styels.textStyle18_600(context).copyWith(fontSize: 28),
        ),
        const SizedBox(height: 8),
        Text(
          'tested with the largest \n datasets from cases \n all around the world.',
          textAlign: TextAlign.center,
          style: Styels.textStyle20_300(context)
              .copyWith(fontSize: 24, color: const Color(0xff5B52C8)),
        ),
        const Expanded(child: SizedBox()),
        Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.kPrimaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        )),
                    onPressed: () {
                      GoRouter.of(context).pushReplacement(AppRoutes.kSignIn);
                    },
                    child: Text('Continue',
                        style: Styels.textStyle20_700(context)
                            .copyWith(color: AppColors.kWhiteColor))),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 12,
        )
      ]),
    );
  }
}
