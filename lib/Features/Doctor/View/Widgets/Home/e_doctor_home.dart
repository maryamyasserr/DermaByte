import 'package:dermabyte/Core/utils/assets.dart';
import 'package:dermabyte/Core/utils/font_styels.dart';
import 'package:dermabyte/Core/utils/routes.dart';
import 'package:dermabyte/Features/Doctor/View/Widgets/patient_card.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class EdoctorHome extends StatelessWidget {
  const EdoctorHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.03),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 32),
          Text(
            "Today's Schedule",
            style: Styels.textStyle24_600(context),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
          Expanded(
              child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 7),
                      child: PatientCard(
                        iconCard: Assets.kAvatar,
                        cardTitle: "Jude Bellengham",
                        cardSubTitle:
                            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lorem ipsum dolor sit amet, consectetur adipiscing elit.Lorem ipsum dolor sit amet, consectetur adipiscing elit. ",
                         diagnose: () {
                          GoRouter.of(context).push(AppRoutes.kPatientView);
                        },
                        start: () {},
                      ),
                    );
                  }))
        ],
      ),
    );
  }
}
