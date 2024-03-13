import 'package:dermabyte/Core/utils/assets.dart';
import 'package:dermabyte/Core/utils/colors.dart';
import 'package:dermabyte/Core/utils/font_styels.dart';
import 'package:dermabyte/Features/E-lab/Presentation/View/Widgets/show_dialog_body.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ServiceSelectionViewBody extends StatelessWidget {
  const ServiceSelectionViewBody({super.key});
  static TextEditingController testName = TextEditingController();
  static TextEditingController cost = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(Assets.kBackground),
          fit: BoxFit.fill,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            const SizedBox(height: 50),
            Text(
              'Add Your Tests Service.',
              style: Styels.textStyle18_600(context).copyWith(fontSize: 24),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Expanded(child: SizedBox()),
                  Center(
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(
                              horizontal: mediaQuery.width * 0.19,
                              vertical: mediaQuery.height * 0.015),
                        ),
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return ShowDialogBody(
                                  testName: testName,
                                  cost: cost,
                                  onPressed: () {
                                    GoRouter.of(context).pop();
                                  },
                                );
                              });
                        },
                        child: const Text(
                          "Add Your Services",
                          style: TextStyle(fontSize: 20),
                        )),
                  ),
                  const SizedBox(height: 16),
                  Center(
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(
                                horizontal: mediaQuery.width * 0.30,
                                vertical: mediaQuery.height * 0.016),
                            backgroundColor: AppColors.kPrimaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25.0),
                            )),
                        onPressed: () {
                          // GoRouter.of(context).pushReplacement(AppRoutes.kSignUpLab);
                        },
                        child: Text('Confirm',
                            style: Styels.textStyle20_700(context)
                                .copyWith(color: AppColors.kWhiteColor))),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
