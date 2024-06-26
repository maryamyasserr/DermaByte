import 'package:dermabyte/Core/Widgets/calender.dart';
import 'package:dermabyte/Core/Widgets/failed_alert.dart';
import 'package:dermabyte/Core/Widgets/custom_appbar.dart';
import 'package:dermabyte/Core/Widgets/loading_indicator.dart';
import 'package:dermabyte/Core/Widgets/payment_alert.dart';
import 'package:dermabyte/Core/utils/assets.dart';
import 'package:dermabyte/Core/utils/colors.dart';
import 'package:dermabyte/Core/utils/font_styels.dart';
import 'package:dermabyte/Core/utils/url_launcher.dart';
import 'package:dermabyte/Features/Authentication/Presentation/View%20Model/Auth%20Cubit/auth_cubit.dart';
import 'package:dermabyte/Features/E-doctor%20Reservation/Presentaion/View/Widgets/all_free_time.dart';
import 'package:dermabyte/Features/E-doctor%20Reservation/Presentaion/View/Widgets/attach_doctor_reservation.dart';
import 'package:dermabyte/Features/E-doctor%20Reservation/Presentaion/View/Widgets/attach_text_field_doc_resevation.dart';
import 'package:dermabyte/Features/E-doctor%20Reservation/Presentaion/View/Widgets/doctor_reservaion_button.dart';
import 'package:dermabyte/Features/E-doctor%20Reservation/Presentaion/View_Model/DoctorReservaion/doctor_reservation_cubit.dart';
import 'package:dermabyte/Features/E-doctor%20Reservation/Presentaion/View_Model/FreeTimes/free_times_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class DoctorReservationViewBody extends StatefulWidget {
  const DoctorReservationViewBody({
    super.key,
  });

  @override
  State<DoctorReservationViewBody> createState() =>
      _DoctorReservationViewBodyState();
}

class _DoctorReservationViewBodyState extends State<DoctorReservationViewBody> {
  bool isVisible = false;

  TextEditingController controller = TextEditingController();
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        isVisible = true;
      });
    });
    // BlocProvider.of<FreeTimesCubit>(context).removeSelectedDate();
    BlocProvider.of<DoctorReservationCubit>(context).deleteAllScans();
    BlocProvider.of<DoctorReservationCubit>(context).indices = [];
    BlocProvider.of<DoctorReservationCubit>(context).ids = [];
    BlocProvider.of<DoctorReservationCubit>(context).scans = [];
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DoctorReservationCubit, DoctorReservationState>(
      listener: (context, state) {
        if (state is DoctorReservationFailure) {
          failedAlert(context, state.errMessage);
          print(state.errMessage);
        } else if (state is DoctorReservationSuccess) {
          if (BlocProvider.of<DoctorReservationCubit>(context).url == null) {
            failedAlert(context, 'Failed of Payment Process,try later');
          } else {
            paymentAlert(context, () async {
              await cUrlLauncher(
                  context: context,
                  url: BlocProvider.of<DoctorReservationCubit>(context).url);
              GoRouter.of(context).pop();
              GoRouter.of(context).pop();
            });
          }
        }
      },
      builder: (context, state) {
        return Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(Assets.kBackground),
                fit: BoxFit.cover,
              ),
              color: Color(0xffE7E0E0)),
          child: Column(children: [
            const CustomAppBar(title: 'Reservation'),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 16, top: 14),
                child: Text(
                  'Book a consultation with your\ndoctor.',
                  style: Styels.textStyle15_300(context),
                  textAlign: TextAlign.left,
                ),
              ),
            ),
            const SizedBox(height: 25),
            SizedBox(
              child: WeekCalender(onChangedSelectedDate: (date) {
                BlocProvider.of<FreeTimesCubit>(context).currentFreeTime(date);
              }),
            ),
            const SizedBox(height: 30),
            Expanded(
              child: ListView(
                shrinkWrap: true,
                children: [
                  isVisible
                      ? Visibility(
                          visible: isVisible,
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: AllFreeTime(),
                          ))
                      : const Center(
                          child:
                              LoadingIndicator(color: AppColors.kPrimaryColor)),
                  const SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: AttachTextFieldDoctorRes(
                      controller: controller,
                    ),
                  ),
                  const SizedBox(height: 30),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: AttachDocotorReservaionField(
                      isrequired: true,
                      padding: EdgeInsets.only(right: 15, bottom: 10),
                    ),
                  ),
                  const SizedBox(height: 36),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: DoctorButton(
                        horizontal: 0,
                        textButton: "Confirm",
                        onPressed: () async {
                          if (BlocProvider.of<FreeTimesCubit>(context)
                                  .selectedDate ==
                              null) {
                            failedAlert(context, 'No Date Selected');
                          } else if (BlocProvider.of<DoctorReservationCubit>(
                                  context)
                              .scanId
                              .isEmpty) {
                            failedAlert(context, "No Scan Selected");
                          } else {
                            print(
                                BlocProvider.of<DoctorReservationCubit>(context)
                                    .scanId);
                            await BlocProvider.of<DoctorReservationCubit>(
                                    context)
                                .createReservationAndPatientReport(
                                    context: context,
                                    reservationData: {
                                      "dermatologist": BlocProvider.of<
                                              DoctorReservationCubit>(context)
                                          .doctorId,
                                      "scan": BlocProvider.of<
                                              DoctorReservationCubit>(context)
                                          .scanId,
                                      "date": BlocProvider.of<FreeTimesCubit>(
                                              context)
                                          .selectedDate
                                          ?.toIso8601String(),
                                      'symptoms': controller.text
                                    },
                                    // reportData: {
                                    //   "patient":
                                    //       BlocProvider.of<AuthCubit>(context)
                                    //           .patient!
                                    //           .patient
                                    //           .id,
                                    //   "dermatologist": BlocProvider.of<
                                    //           DoctorReservationCubit>(context)
                                    //       .doctorId,
                                    //   "scan": BlocProvider.of<
                                    //           DoctorReservationCubit>(context)
                                    //       .scanId
                                    // },
                                    token: BlocProvider.of<AuthCubit>(context)
                                        .patient!
                                        .token);
                          }
                        },
                        isLoading:
                            BlocProvider.of<DoctorReservationCubit>(context)
                                .isLoading),
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            )
          ]),
        );
      },
    );
  }
}
