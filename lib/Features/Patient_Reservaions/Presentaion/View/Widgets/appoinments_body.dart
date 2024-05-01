import 'package:dermabyte/Core/Widgets/custom_appBar.dart';
import 'package:dermabyte/Core/Widgets/empty.dart';
import 'package:dermabyte/Core/Widgets/err_widget.dart';
import 'package:dermabyte/Core/Widgets/failed_alert.dart';
import 'package:dermabyte/Core/Widgets/loading_indicator.dart';
import 'package:dermabyte/Core/utils/assets.dart';
import 'package:dermabyte/Core/utils/colors.dart';
import 'package:dermabyte/Core/utils/routes.dart';
import 'package:dermabyte/Features/Authentication/Presentation/View%20Model/Auth%20Cubit/auth_cubit.dart';
import 'package:dermabyte/Features/Patient_Reservaions/Presentaion/View/Widgets/custom_card.dart';
import 'package:dermabyte/Features/Patient_Reservaions/Presentaion/View/Widgets/header_text.dart';
import 'package:dermabyte/Features/Patient_Reservaions/Presentaion/View_Model/Delete_Reservation_Cubit/delete_reservation_cubit.dart';
import 'package:dermabyte/Features/Patient_Reservaions/Presentaion/View_Model/Preservation_Cubit/preservation_info_cubit.dart';
import 'package:dermabyte/Features/Profile/Presentaion/View_Model/Cubits/Reports%20Cubit/reports_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AppoinmentsBody extends StatefulWidget {
  const AppoinmentsBody({super.key});

  @override
  State<AppoinmentsBody> createState() => _AppoinmentsBodyState();
}

class _AppoinmentsBodyState extends State<AppoinmentsBody> {
  @override
  void initState() {
    BlocProvider.of<PreservationInfoCubit>(context).getPatientReservationInfo(
        token: BlocProvider.of<AuthCubit>(context).patient!.token);
    BlocProvider.of<ReportCubit>(context).getPatientConults(
        token: BlocProvider.of<AuthCubit>(context).patient!.token);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(Assets.kBackground), fit: BoxFit.cover)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
        child: Column(
          children: [
            const CustomAppBar(title: 'Reservations'),
            const SizedBox(height: 12),
            const HeaderText(
                text: "Follow up with your ongoing and future appointments."),
            const SizedBox(height: 16),
            BlocBuilder<PreservationInfoCubit, PreservationInfoState>(
              builder: (context, state) {
                if (state is PreservationInfoFailure) {
                  return Expanded(
                      child: ErrWidget(
                          onTap: () async {
                            await BlocProvider.of<PreservationInfoCubit>(
                                    context)
                                .getPatientReservationInfo(
                                    token: BlocProvider.of<AuthCubit>(context)
                                        .patient!
                                        .token);
                            await BlocProvider.of<ReportCubit>(context)
                                .getPatientConults(
                                    token: BlocProvider.of<AuthCubit>(context)
                                        .patient!
                                        .token);
                          },
                          errMessage: state.errMessage));
                } else if (state is PreservationInfoSuccess) {
                  if (state.pReservationInfo.isEmpty) {
                    return const Expanded(
                      child: Center(
                          child: EmptyWidget(
                              text: "There are no Reservations yet")),
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
                                  antoherButton: true,
                                  onDelete: () async {
                                    await BlocProvider.of<
                                            DeleteReservationCubit>(context)
                                        .deleteReservation(
                                            id: state
                                                .pReservationInfo[index].id!,
                                            token: BlocProvider.of<AuthCubit>(
                                                    context)
                                                .patient!
                                                .token);
                                    await BlocProvider.of<
                                            PreservationInfoCubit>(context)
                                        .getPatientReservationInfo(
                                            token: BlocProvider.of<AuthCubit>(
                                                    context)
                                                .patient!
                                                .token);
                                  },
                                  textButton2: 'Delete',
                                  iconCard: Assets.kFollowUpIcon,
                                  cardTitle: "Follow Up",
                                  cardSubTitle:
                                      "You Have Reserved With Dr. ${state.pReservationInfo[index].dermatologist.firstName} ${state.pReservationInfo[index].dermatologist.lastName} on ${state.pReservationInfo[index].date.day}/${state.pReservationInfo[index].date.month}/${state.pReservationInfo[index].date.year} At ${state.pReservationInfo[index].date.hour}:${state.pReservationInfo[index].date.minute.toString().padLeft(2, '0')}  ",
                                  onPressed: () {
                                    BlocProvider.of<PreservationInfoCubit>(
                                                context)
                                            .setId =
                                        state.pReservationInfo[index].id!;
                                    BlocProvider.of<ReportCubit>(context)
                                            .setReporId =
                                        state.pReservationInfo[index]
                                            .dermatologist.id!;
                                    if (BlocProvider.of<ReportCubit>(context)
                                                .patientReport ==
                                            null ||
                                        BlocProvider.of<PreservationInfoCubit>(
                                                    context)
                                                .currentReservation ==
                                            null) {
                                      failedAlert(context,
                                          "Something is wrong ,Delete this reservation and try again");
                                    } else {
                                      GoRouter.of(context).push(
                                          AppRoutes.kFollowUp,
                                          extra:
                                              state.pReservationInfo[index].id);
                                    
                                    }
                                  },
                                  textButton: "View",
                                ),
                              );
                            }));
                  }
                } else {
                  return const Expanded(
                    child: Center(
                      child: LoadingIndicator(
                        color: AppColors.kPrimaryColor,
                      ),
                    ),
                  );
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
