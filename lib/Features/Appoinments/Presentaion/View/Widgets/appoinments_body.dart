import 'package:dermabyte/Core/Widgets/custom_appBar.dart';
import 'package:dermabyte/Core/Widgets/err_widget.dart';
import 'package:dermabyte/Core/Widgets/loading_indicator.dart';
import 'package:dermabyte/Core/utils/assets.dart';
import 'package:dermabyte/Core/utils/colors.dart';
import 'package:dermabyte/Core/utils/routes.dart';
import 'package:dermabyte/Features/Appoinments/Presentaion/View/Widgets/custom_card.dart';
import 'package:dermabyte/Features/Appoinments/Presentaion/View/Widgets/header_text.dart';
import 'package:dermabyte/Features/Appoinments/Presentaion/View_Model/Cubits/Preservation_Cubit/preservation_info_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AppoinmentsBody extends StatelessWidget {
  const AppoinmentsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(Assets.kBackground), fit: BoxFit.cover)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 8),
        child: Column(
          children: [
            const CustomAppBar(title: 'Appoinments'),
            const HeaderText(
                text: "Follow up with your ongoing and future appointments."),
            const SizedBox(height: 32),
            BlocBuilder<PreservationInfoCubit, PreservationInfoState>(
              builder: (context, state) {
                if (state is PreservationInfoFailure) {
                  return ErrWidget(errMessage: state.errMessage);
                } else if (state is PreservationInfoSuccess) {
                  if (state.pReservationInfo.isEmpty) {
                    return const Center(
                      child: Text("There are no Reservations yet"),
                    );
                  } else {
                    return Expanded(
                        child: ListView.builder(
                            itemCount: state.pReservationInfo.length,
                            physics: const BouncingScrollPhysics(),
                            itemBuilder: (context, index) {
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 12),
                                child: CustomCard(
                                  iconCard: Assets.kFollowUpIcon,
                                  cardTitle: "Follow Up",
                                  cardSubTitle:
                                      " Dr. ${state.pReservationInfo[index].dermatologist.firstName} ${state.pReservationInfo[index].dermatologist.lastName} has reviewed your scans",
                                  onPressed: () {
                                    BlocProvider.of<PreservationInfoCubit>(
                                                context)
                                            .setId =
                                        state.pReservationInfo[index].id ?? "";
                                    GoRouter.of(context).push(
                                        AppRoutes.kFollowUp,
                                        extra:
                                            state.pReservationInfo[index].id);
                                  },
                                  textButton: "View",
                                ),
                              );
                            }));
                  }
                } else {
                  return const LoadingIndicator(
                    color: AppColors.kPrimaryColor,
                  );
                }
              },
            )
            // CustomCard(
            //   iconCard: Assets.kFollowUpIcon,
            //   cardTitle: "Follow Up!",
            //   cardSubTitle:
            //       "Follow up with your last appointments, doctor has requested.",
            //   textButton: "View",
            //   onPressed: () {
            //     GoRouter.of(context).push(AppRoutes.kFollowUp);
            //   },
            // ),
            // const SizedBox(height: 24),
            // CustomCard(
            //   iconCard: Assets.kWallBlock,
            //   cardTitle: "Upcoming appoinment!",
            //   cardSubTitle: "Doctor Mohamed has scheduled an appointment on..",
            //   textButton: "View",
            //   onPressed: () {
            //     GoRouter.of(context).push(AppRoutes.kUpcoming);
            //   },
            // )
          ],
        ),
      ),
    );
  }
}