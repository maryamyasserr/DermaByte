import 'package:dermabyte/Core/utils/assets.dart';
import 'package:dermabyte/Core/utils/font_styels.dart';
import 'package:dermabyte/Core/utils/routes.dart';
import 'package:dermabyte/Features/Doctor/Presentaion/View/Widgets/patient_card.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class EdoctorRequests extends StatelessWidget {
  const EdoctorRequests({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 64),
          Text(
            "Patients Requests",
            style: Styels.textStyle24_600(context).copyWith(fontSize: 32),
          ),
          const SizedBox(height: 32),
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
                            "Lorem ipsum dolor sit amet, consectetur adipiscing elit",
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
