import 'package:dermabyte/Core/Widgets/custom_appBar.dart';
import 'package:dermabyte/Core/Widgets/delete_alert.dart';
import 'package:dermabyte/Core/Widgets/empty.dart';
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
    super.initState();
    final authCubit = BlocProvider.of<AuthCubit>(context);
    BlocProvider.of<PreservationInfoCubit>(context)
        .getPatientReservationInfo(token: authCubit.patient!.token);
    BlocProvider.of<ReportCubit>(context)
        .getPatientConults(token: authCubit.patient!.token);
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
                return Column(
                  children: [
                    const SizedBox(height: 230),
                    ErrWidget(
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
                        
                      },
                      errMessage: state.errMessage,
                    ),
                  ],
                );
              }
              if (state is PreservationInfoSuccess) {
                if (state.allReservationModel.doctorReservations.isEmpty &&
                    state.allReservationModel.labReservations.isEmpty) {
                  return const Column(
                    children: [
                      SizedBox(height: 230),
                      EmptyWidget(text: 'No Appoinments Yet'),
                    ],
                  );
                }
                return Column(
                  children: [
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount:
                          state.allReservationModel.doctorReservations.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 8),
                          child: CustomCard(
                            antoherButton: true,
                            onDelete: () async {
                              deleteAlert(
                                  context: context,
                                  onConfirm: () async {
                                    GoRouter.of(context).pop();
                                    await BlocProvider.of<
                                            PreservationInfoCubit>(context)
                                        .deleteReservation(
                                      id: state.allReservationModel
                                          .doctorReservations[index].id!,
                                      token: token,
                                    );
                                  });
                            },
                            textButton2: 'Delete',
                            iconCard: null,
                            cardTitle: "Follow Up",
                            cardSubTitle:
                                "You Have Reserved With Dr. ${state.allReservationModel.doctorReservations[index].dermatologist.firstName} ${state.allReservationModel.doctorReservations[index].dermatologist.lastName} on ${state.allReservationModel.doctorReservations[index].date.day}/${state.allReservationModel.doctorReservations[index].date.month}/${state.allReservationModel.doctorReservations[index].date.year} At ${timeTitle(state.allReservationModel.doctorReservations[index].date.hour)}:${state.allReservationModel.doctorReservations[index].date.minute.toString().padLeft(2, '0')} ${night(state.allReservationModel.doctorReservations[index].date.hour)}",
                            onPressed: () {
                              BlocProvider.of<PreservationInfoCubit>(context)
                                      .setId =
                                  state.allReservationModel
                                      .doctorReservations[index].id!;
                              BlocProvider.of<ReportCubit>(context).setReporId =
                                  state
                                      .allReservationModel
                                      .doctorReservations[index]
                                      .dermatologist
                                      .id!;
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
                                  extra: state.allReservationModel
                                      .doctorReservations[index].id,
                                );
                              }
                            },
                            textButton: "View",
                          ),
                        );
                      },
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount:
                          state.allReservationModel.labReservations.length,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 8),
                          child: CustomCard(
                            antoherButton: true,
                            onDelete: () async {
                              deleteAlert(
                                  context: context,
                                  onConfirm: () async {
                                    GoRouter.of(context).pop();
                                    await BlocProvider.of<
                                            PreservationInfoCubit>(context)
                                        .deleteLabReservation(
                                            token: token,
                                            id: state.allReservationModel
                                                .labReservations[index].id!);
                                  });
                            },
                            textButton2: 'Delete',
                            iconCard: state.allReservationModel
                                .labReservations[index].lab!.profilePic,
                            cardTitle: "Follow Up",
                            cardSubTitle:
                                "You Have Reserved With lab. ${state.allReservationModel.labReservations[index].lab!.firstName} with ${state.allReservationModel.labReservations[index].test!.length} Test",
                            onPressed: () {
                              infoAlert(
                                  context: context,
                                  location: "Giza",
                                  tests: state.allReservationModel
                                      .labReservations[index]);
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
              } else {
                return const Padding(
                  padding: EdgeInsets.only(top: 260),
                  child: LoadingIndicator(color: AppColors.kPrimaryColor),
                );
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
