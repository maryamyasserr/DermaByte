import 'package:dermabyte/Core/Widgets/custom_appBar.dart';
import 'package:dermabyte/Core/Widgets/delete_alert.dart';
import 'package:dermabyte/Core/Widgets/err_widget.dart';
import 'package:dermabyte/Core/Widgets/failed_alert.dart';
import 'package:dermabyte/Core/Widgets/info_alert.dart';
import 'package:dermabyte/Core/Widgets/loading_indicator.dart';
import 'package:dermabyte/Core/utils/assets.dart';
import 'package:dermabyte/Core/utils/colors.dart';
import 'package:dermabyte/Core/utils/routes.dart';
import 'package:dermabyte/Features/Authentication/Presentation/View%20Model/Auth%20Cubit/auth_cubit.dart';
import 'package:dermabyte/Features/Patient_Reservaions/Presentaion/View/Widgets/custom_card.dart';
import 'package:dermabyte/Features/Patient_Reservaions/Presentaion/View/Widgets/header_text.dart';
import 'package:dermabyte/Features/Patient_Reservaions/Presentaion/View_Model/Delete_Doctor_Reservation_Cubit/delete_doctor_reservation_cubit.dart';
import 'package:dermabyte/Features/Patient_Reservaions/Presentaion/View_Model/Lab%20Reservation/patiaent_lab_reservation_cubit.dart';
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
      BlocProvider.of<PatientLabReservationCubit>(context)
          .getPatientLabReservations(
              token: BlocProvider.of<AuthCubit>(context).patient!.token);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String token = BlocProvider.of<AuthCubit>(context).patient!.token;
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(Assets.kBackground),
          fit: BoxFit.cover,
        ),
      ),
      child: ListView(
        children: [
          const CustomAppBar(title: 'Reservations'),
          const SizedBox(height: 12),
          const HeaderText(
              text: "Follow up with your ongoing and future appointments."),
          const SizedBox(height: 16),
          BlocBuilder<PreservationInfoCubit, PreservationInfoState>(
            builder: (context, state) {
              if (state is PreservationInfoFailure) {
                return Padding(
                  padding: const EdgeInsets.only(top: 200),
                  child: ErrWidget(
                    onTap: () async {
                      final authCubit = BlocProvider.of<AuthCubit>(context);
                      await BlocProvider.of<PreservationInfoCubit>(context)
                          .getPatientReservationInfo(
                        token: authCubit.patient!.token,
                      );
                      await BlocProvider.of<ReportCubit>(context)
                          .getPatientConults(
                        token: token,
                      );
                      await BlocProvider.of<PatientLabReservationCubit>(context)
                          .getPatientLabReservations(
                        token: token,
                      );
                    },
                    errMessage: state.errMessage,
                  ),
                );
              } else if (state is PreservationInfoSuccess) {
                if (state.pReservationInfo.isEmpty) {
                  return const SizedBox();
                } else {
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: state.pReservationInfo.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 12, horizontal: 8),
                        child: CustomCard(
                          antoherButton: true,
                          onDelete: () async {
                            deleteAlert(
                                context: context,
                                onConfirm: () async {
                                  GoRouter.of(context).pop();
                                  await BlocProvider.of<
                                          DeleteDoctorReservationCubit>(context)
                                      .deleteReservation(
                                    id: state.pReservationInfo[index].id!,
                                    token: token,
                                  );
                                  await BlocProvider.of<PreservationInfoCubit>(
                                          context)
                                      .getPatientReservationInfo(
                                    token: token,
                                  );
                                });
                          },
                          textButton2: 'Delete',
                          iconCard: null,
                          cardTitle: "Follow Up",
                          cardSubTitle:
                              "You Have Reserved With Dr. ${state.pReservationInfo[index].dermatologist.firstName} ${state.pReservationInfo[index].dermatologist.lastName} on ${state.pReservationInfo[index].date.day}/${state.pReservationInfo[index].date.month}/${state.pReservationInfo[index].date.year} At ${timeTitle(state.pReservationInfo[index].date.hour)}:${state.pReservationInfo[index].date.minute.toString().padLeft(2, '0')} ${night(state.pReservationInfo[index].date.hour)}",
                          onPressed: () {
                            BlocProvider.of<PreservationInfoCubit>(context)
                                .setId = state.pReservationInfo[index].id!;
                            BlocProvider.of<ReportCubit>(context).setReporId =
                                state.pReservationInfo[index].dermatologist.id!;
                            if (BlocProvider.of<ReportCubit>(context)
                                        .patientReport ==
                                    null ||
                                BlocProvider.of<PreservationInfoCubit>(context)
                                        .currentReservation ==
                                    null) {
                              failedAlert(context,
                                  "Something is wrong ,Delete this reservation and try again");
                            } else {
                              GoRouter.of(context).push(
                                AppRoutes.kFollowUp,
                                extra: state.pReservationInfo[index].id,
                              );
                            }
                          },
                          textButton: "View",
                        ),
                      );
                    },
                  );
                }
              } else {
                return const Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 20
                  ),
                  child: LoadingIndicator(
                    color: AppColors.kPrimaryColor,
                  ),
                );
              }
            },
          ),
          BlocBuilder<PatientLabReservationCubit, PatientLabReservationState>(
            builder: (context, state) {
              if (state is PatiaentLabReservationSuccess) {
                if (state.reservations.isEmpty) {
                  return const SizedBox();
                } else {
                  return Column(
                    children: [
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount: state.reservations.length,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(
                                bottom: 12, left: 8, right: 8),
                            child: CustomCard(
                              antoherButton: true,
                              onDelete: () async {
                                deleteAlert(
                                    context: context,
                                    onConfirm: () async {
                                      GoRouter.of(context).pop();
                                      await BlocProvider.of<
                                                  PatientLabReservationCubit>(
                                              context)
                                          .deleteLabReservation(
                                              token: token,
                                              id: state
                                                  .reservations[index].id!);
                                     
                                    });
                              },
                              textButton2: 'Delete',
                              iconCard:
                                  state.reservations[index].lab!.profilePic,
                              cardTitle: "Follow Up",
                              cardSubTitle:
                                  "You Have Reserved With lab. ${state.reservations[index].lab!.firstName} with ${state.reservations[index].test!.length} Test",
                              onPressed: () {
                                infoAlert(
                                    context: context,
                                    location: "Giza",
                                    tests: state.reservations[index]);
                              },
                              textButton: "View",
                            ),
                          );
                        },
                      ),
                      const SizedBox(
                        height: 16,
                      )
                    ],
                  );
                }
              }
              if (state is PatiaentLabReservationLoading) {
                return const Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 20
                  ),
                  child: LoadingIndicator(color: AppColors.kPrimaryColor),
                );
              } else {
                return const SizedBox();
              }
            },
          ),
        ],
      ),
    );
  }
}

String night(int hour) {
  if (hour >= 12) {
    return 'PM';
  } else {
    return 'AM';
  }
}

String timeTitle(int hour) {
  if (hour > 12) {
    int newHour = hour - 12;
    return newHour.toString();
  } else {
    return hour.toString();
  }
}
