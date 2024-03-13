import 'package:dermabyte/Core/utils/assets.dart';
import 'package:dermabyte/Core/utils/font_styels.dart';
import 'package:dermabyte/Core/utils/routes.dart';
import 'package:dermabyte/Features/Doctor/Presentaion/View/Widgets/Schedule/calender.dart';
import 'package:dermabyte/Features/Doctor/Presentaion/View/Widgets/Schedule/schedule_field.dart';
import 'package:dermabyte/Features/Doctor/Presentaion/View/Widgets/patient_card.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

class DoctorHome extends StatelessWidget {
  const DoctorHome({super.key});

  static TextEditingController startTime=TextEditingController();
  static TextEditingController endTime=TextEditingController();
  static TextEditingController sessionTime=TextEditingController();

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
            "Schedule",
            style: Styels.textStyle24_600(context),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
          WeekCalender(
            onChangedSelectedDate: (date) {
              debugPrint("date: $date");
            },
          ),
          const SizedBox(height: 16),
          ShceduleForm(
            controller: startTime,
            label: "Start-Time",
            mediaQuery: MediaQuery.sizeOf(context),
          ),
            const SizedBox(height: 16),
          ShceduleForm(
            controller: endTime,
            label: "End-Time",
            mediaQuery: MediaQuery.sizeOf(context),
          ),
            const SizedBox(height: 16),
          ShceduleForm(
            controller: sessionTime,
            label: "Session-Time",
            mediaQuery: MediaQuery.sizeOf(context),
          )
          // Expanded(
          //     child: ListView.builder(
          //         physics: const BouncingScrollPhysics(),
          //         itemCount: 10,
          //         itemBuilder: (context, index) {
          //           return Padding(
          //             padding: const EdgeInsets.symmetric(vertical: 7),
          //             child: PatientCard(
          //               iconCard: Assets.kAvatar,
          //               cardTitle: "Jude Bellengham",
          //               cardSubTitle:
          //                   "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
          //               diagnose: () {
          //                 GoRouter.of(context).push(AppRoutes.kPatientView);
          //               },
          //               start: () {},
          //               onTap: () {},
          //             ),
          //           );
          //         }))
        ],
      ),
    );
  }
}
