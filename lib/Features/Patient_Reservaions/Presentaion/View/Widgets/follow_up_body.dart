import 'package:dermabyte/Core/Widgets/custom_appbar.dart';
import 'package:dermabyte/Core/utils/assets.dart';
import 'package:dermabyte/Core/utils/routes.dart';
import 'package:dermabyte/Features/Authentication/Presentation/View%20Model/Auth%20Cubit/auth_cubit.dart';
import 'package:dermabyte/Features/E-doctor%20Reservation/Presentaion/View_Model/FreeTimes/free_times_cubit.dart';
import 'package:dermabyte/Features/Patient_Reservaions/Data/Models/preservation_model/preservation_model.dart';
import 'package:dermabyte/Features/Patient_Reservaions/Presentaion/View/Widgets/custom_card.dart';
import 'package:dermabyte/Features/Patient_Reservaions/Presentaion/View/Widgets/header_text.dart';
import 'package:dermabyte/Features/Patient_Reservaions/Presentaion/View_Model/Add_Test_Result_Cubit/add_test_result_cubit.dart';
import 'package:dermabyte/Features/Patient_Reservaions/Presentaion/View_Model/Preservation_Cubit/preservation_info_cubit.dart';
import 'package:dermabyte/Features/Profile/Data/Models/Report/report_model.dart';
import 'package:dermabyte/Features/Profile/Presentaion/View_Model/Cubits/Reports%20Cubit/reports_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class FollowUpBody extends StatelessWidget {
  const FollowUpBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    PreservationModel patientReservation =
        BlocProvider.of<PreservationInfoCubit>(context).currentReservation!;
    ReportModel report = BlocProvider.of<ReportCubit>(context).patientReport!;
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(Assets.kBackground), fit: BoxFit.cover)),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                const CustomAppBar(title: "Follow Up!"),
                const SizedBox(height: 12),
                const HeaderText(
                    text:
                        "Follow up with your ongoing and future appointments."),
                const SizedBox(height: 32),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: CustomCard(
                    iconCard: Assets.kFollowUpIcon,
                    cardTitle:
                        "Dr. ${patientReservation.dermatologist.firstName}'s appointment",
                    cardSubTitle:
                        'When your appointment comes,click here to start the session  ',
                    textButton: 'Start',
                    onPressed: () async{
                           BlocProvider.of<FreeTimesCubit>(context)
                                  .getFreeTimes(
                                      token: BlocProvider.of<AuthCubit>(context)
                                          .patient!
                                          .token,
                                      body: {
                                    "dermatologist": patientReservation.dermatologist.id
                                  });
                      GoRouter.of(context).push(AppRoutes.kUpcoming);
                    },
                  ),
                ),
              ],
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 24)),
          SliverList.builder(
              itemCount: report.tests!.isEmpty ? 0 : 1,
              // itemCount: 1,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 24, right: 8, left: 8),
                  child: CustomCard(
                      iconCard: Assets.kAppoinments,
                      cardTitle:
                          'Dr. ${report.dermatologist?.firstName ?? "The Doctor"} requested tests.',
                      cardSubTitle:
                          "Dr. ${report.dermatologist?.firstName ?? "The Doctor"} reviewed your scans and it seems like he’ll need more tests to conduct her diagnosing process.",
                      textButton: "View",
                      onPressed: () {
                        BlocProvider.of<AddTestResultCubit>(context)
                            .getLengthTets(report.tests!.length);

                        GoRouter.of(context).push(
                          AppRoutes.kRequestedTest,
                        );
                      }),
                );
              }),
        ],
      ),
    );
  }
}
