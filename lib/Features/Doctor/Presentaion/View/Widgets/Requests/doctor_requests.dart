import 'package:dermabyte/Core/Widgets/empty.dart';
import 'package:dermabyte/Core/Widgets/failed_alert.dart';
import 'package:dermabyte/Core/Widgets/err_widget.dart';
import 'package:dermabyte/Core/Widgets/loading_indicator.dart';
import 'package:dermabyte/Core/utils/colors.dart';
import 'package:dermabyte/Core/utils/font_styels.dart';
import 'package:dermabyte/Core/utils/routes.dart';
import 'package:dermabyte/Features/Authentication/Presentation/View%20Model/Auth%20Cubit/auth_cubit.dart';
import 'package:dermabyte/Features/Doctor/Presentaion/View%20Model/My_Patinets_Reports/my_patient_report_cubit.dart';
import 'package:dermabyte/Features/Doctor/Presentaion/View%20Model/My_Reservation_Cubit/my_reservation_cubit.dart';
import 'package:dermabyte/Features/Doctor/Presentaion/View/Widgets/patient_card.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

class DoctorRequests extends StatefulWidget {
  const DoctorRequests({super.key});

  @override
  State<DoctorRequests> createState() => _DoctorRequestsState();
}

class _DoctorRequestsState extends State<DoctorRequests> {
  @override
  void initState() {
    BlocProvider.of<MyReservationCubit>(context).getMyReservations(
        reviwed: 'false',
        token: BlocProvider.of<AuthCubit>(context).doctorModel!.token);
    BlocProvider.of<MyPatientReportCubit>(context).getMyPatientsReport(
        token: BlocProvider.of<AuthCubit>(context).doctorModel!.token);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // List<MyReservaionModel> reservations =
    //     BlocProvider.of<MyReservationCubit>(context).allAppoinments;
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
          BlocBuilder<MyReservationCubit, MyReservationState>(
            builder: (context, state) {
              if (state is MyReservationSuccess) {
                if (state.reservation == null || state.reservation!.isEmpty) {
                  return const Expanded(child: EmptyWidget(text: "No Reservation Yet"));
                }else{

                return Expanded(
                    child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemCount: state.reservation!.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 7),
                            child: PatientCard(
                              show: false,
                              date: DateFormat.yMMMd()
                                  .format(state.reservation![index].date!),
                              imageCard:
                                  state.reservation![index].scan?.diseasePhoto,
                              cardTitle:
                                  "${state.reservation![index].patient?.firstName ?? ""}'s report",
                              cardSubTitle:
                                  "${state.reservation![index].patient?.firstName ?? ""} had an scan and the result was ${state.reservation![index].scan?.diseaseName ?? ""}",
                              diagnose: () {},
                              textButton: 'View',
                              onPressed: () async {
                                BlocProvider.of<MyPatientReportCubit>(context)
                                    .setId = state.reservation![index].scan!.id!;
                                if (BlocProvider.of<MyPatientReportCubit>(
                                            context)
<<<<<<< HEAD
                                        .viewPatient(
                                            id: reservations[index].id!,
                                            token: BlocProvider.of<AuthCubit>(
                                                    context)
                                                .doctorModel!
                                                .token,
                                            body: FormData.fromMap(
                                              {
                                                'reviewed':'true'
                                              }
                                              
                                            ));
                                    await BlocProvider.of<MyReservationCubit>(
                                            context)
                                        .getMyReservations(
                                            token: BlocProvider.of<AuthCubit>(
                                                    context)
                                                .doctorModel!
                                                .token,
                                            reviwed: 'false');
                                  }
                                },
                                onTap: () {},
                              ),
                            );
                          }));
                } else if (state is MyReservationFailure) {
                  return Expanded(
                      child: Center(
                          child: ErrWidget(
                              onTap: () {
                                BlocProvider.of<MyReservationCubit>(context)
                                    .getMyReservations(
                                        reviwed: 'false',
                                        token:
                                            BlocProvider.of<AuthCubit>(context)
                                                .doctorModel!
                                                .token);
=======
                                        .getPatientReport ==
                                    null) {
                                  failedAlert(context, 'Something is Wrong');
                                } else {
                                  GoRouter.of(context)
                                      .push(AppRoutes.kReportView);
                                  await BlocProvider.of<MyReservationCubit>(
                                          context)
                                      .viewPatient(
                                          id: state.reservation![index].id!,
                                          token: BlocProvider.of<AuthCubit>(
                                                  context)
                                              .doctorModel!
                                              .token,
                                          body: FormData.fromMap(
                                              {'reviewed': 'true'}));
                               
                                }
>>>>>>> frpsm
                              },
                              onTap: () {},
                            ),
                          );
                        }));
              
                }
              } else if (state is MyReservationFailure) {
                return Expanded(
                    child: Center(
                        child: ErrWidget(
                            onTap: () {
                              BlocProvider.of<MyReservationCubit>(context)
                                  .getMyReservations(
                                      reviwed: 'false',
                                      token: BlocProvider.of<AuthCubit>(context)
                                          .doctorModel!
                                          .token);
                            },
                            errMessage: state.errMessage)));
              } else {
                return const Expanded(
                  child: Center(
                      child: LoadingIndicator(color: AppColors.kPrimaryColor)),
                );
              }
            },
          )
        ],
      ),
    );
  }
}
