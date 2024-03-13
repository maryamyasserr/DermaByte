import 'package:dermabyte/Core/utils/assets.dart';
import 'package:dermabyte/Core/utils/colors.dart';
import 'package:dermabyte/Core/utils/font_styels.dart';
import 'package:dermabyte/Features/Lab/Presentation/View/Widget/Lab%20Services/sheet_body.dart';
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
                          backgroundColor: AppColors.kPrimaryColor,
                          padding: EdgeInsets.symmetric(
                              horizontal: mediaQuery.width * 0.19,
                              vertical: mediaQuery.height * 0.015),
                        ),
                        onPressed: () {
                          showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return SheetBody(
                                  testName: testName,
                                  cost: cost,
                                  onPressed: () {
                                    GoRouter.of(context).pop();
                                  },
                                );
                              });
                        },
                        child: Text(
                          "Add Your Services",
                          style: Styels.textStyle20_700(context).copyWith(color: Colors.white),
                        )),
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
