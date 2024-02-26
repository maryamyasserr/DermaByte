import 'package:dermabyte/Core/utils/assets.dart';
import 'package:dermabyte/Core/utils/colors.dart';
import 'package:dermabyte/Core/utils/font_styels.dart';
import 'package:dermabyte/Core/utils/routes.dart';
import 'package:dermabyte/Features/E-lab/View/Widgets/service_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ServiceSelectionViewBody extends StatelessWidget {
  const ServiceSelectionViewBody({super.key});

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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: mediaQuery.height * 0.1),
            Text(
              'Pick at least 3 services.',
              style: Styels.textStyle18_600(context).copyWith(fontSize: 24),
            ),
            SizedBox(height: mediaQuery.height * 0.05),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ServiceWidget(serviceName: 'Patch Testing'),
                ServiceWidget(serviceName: 'Biopsy'),
              ],
            ),
            SizedBox(height: mediaQuery.height * 0.02),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ServiceWidget(serviceName: 'Wood light'),
                ServiceWidget(serviceName: 'Scrapings'),
              ],
            ),
            SizedBox(height: mediaQuery.height * 0.02),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ServiceWidget(serviceName: 'Tzanck testing'),
                ServiceWidget(serviceName: 'Diascopy'),
              ],
            ),
            SizedBox(height: mediaQuery.height * 0.02),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ServiceWidget(serviceName: 'Prick tests'),
                ServiceWidget(serviceName: 'Blood test'),
              ],
            ),
            SizedBox(height: mediaQuery.height * 0.02),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ServiceWidget(serviceName: 'Intradermal'),
              ],
            ),
            SizedBox(height: mediaQuery.height * 0.2),
            Center(
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                          horizontal: mediaQuery.width * 0.30,
                          vertical: mediaQuery.height * 0.015),
                      backgroundColor: AppColors.kPrimaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.0),
                      )),
                  onPressed: () {
                    GoRouter.of(context).pushReplacement(AppRoutes.kSignUpLab);
                  },
                  child: Text('confirm',
                      style: Styels.textStyle20_700(context)
                          .copyWith(color: AppColors.kWhiteColor))),
            )
          ],
        ),
      ),
    );
  }
}
