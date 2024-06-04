import 'package:dermabyte/Core/Widgets/calender.dart';
import 'package:dermabyte/Core/Widgets/custom_appBar.dart';
import 'package:dermabyte/Core/Widgets/failed_alert.dart';
import 'package:dermabyte/Core/utils/assets.dart';
import 'package:dermabyte/Core/utils/font_styels.dart';
import 'package:dermabyte/Core/utils/url_launcher.dart';
import 'package:dermabyte/Features/Authentication/Presentation/View%20Model/Auth%20Cubit/auth_cubit.dart';
import 'package:dermabyte/Features/E-doctor%20Reservation/Presentaion/View/Widgets/all_free_time.dart';
import 'package:dermabyte/Features/E-doctor%20Reservation/Presentaion/View_Model/FreeTimes/free_times_cubit.dart';
import 'package:dermabyte/Features/Patient_Reservaions/Data/Models/preservation_model/preservation_model.dart';
import 'package:dermabyte/Features/Patient_Reservaions/Presentaion/View/Widgets/upcoming_button.dart';
import 'package:dermabyte/Features/Patient_Reservaions/Presentaion/View_Model/Preservation_Cubit/preservation_info_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UpComingBody extends StatefulWidget {
  const UpComingBody({super.key});

  @override
  State<UpComingBody> createState() => _UpComingBodyState();
}

class _UpComingBodyState extends State<UpComingBody> {
  bool isVisable = false;
  bool isLoading = false;
  @override
  void initState() {
    BlocProvider.of<FreeTimesCubit>(context).removeSelectedDate();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    PreservationModel reservation =
        BlocProvider.of<PreservationInfoCubit>(context).currentReservation!;
    return BlocConsumer<PreservationInfoCubit, PreservationInfoState>(
      listener: (context, state) {
        if (state is PreservationInfoFailure) {
          failedAlert(context, 'Some Thing is Wrong, try again');
        }
      },
      builder: (context, state) {
        return Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(Assets.kBackground),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SingleChildScrollView(
              child: Column(
                children: [
                  const CustomAppBar(title: "Upcoming"),
                  const SizedBox(height: 64),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "The doctor has scheduled an online appointment for you on ${reservation.date.day}/ ${reservation.date.month}/ ${reservation.date.year}, at ${timeTitle(reservation.date.hour)}:${reservation.date.minute.toString().padLeft(2, '0')} ${night(reservation.date.hour)}.",
                          style: Styels.textStyle18_400(context),
                        ),
                        const SizedBox(height: 64),
                        Text(
                          "Please click on the call button right 5 minutes before the appointment.",
                          style: Styels.textStyle14_300(context),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 74),
                  UpcomingButton(
                    isLoading: false,
                    onPressed: () async {
                      await cUrlLauncher(
                          context: context, url: reservation.meetingUrl);
                    },
                    text: 'Start Call',
                    reservation: reservation,
                  ),
                  const SizedBox(height: 16),
                  Visibility(
                    visible: isVisable,
                    child: Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 4),
                          child: WeekCalender(
                            onChangedSelectedDate: (date) {
                              BlocProvider.of<FreeTimesCubit>(context)
                                  .currentFreeTime(date);
                            },
                          ),
                        ),
                        const SizedBox(height: 24),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: AllFreeTime(),
                        ),
                        const SizedBox(height: 24),
                      ],
                    ),
                  ),
                  // const SizedBox(height: 16),
                  UpcomingButton(
                    isLoading: isLoading,
                    reservation: reservation,
                    text: isVisable ? '   Done   ' : ' Update  ',
                    onPressed: () async {
                      if (isVisable == true) {
                        setState(() {
                          isLoading = true;
                        });
                        if (BlocProvider.of<FreeTimesCubit>(context)
                                .selectedDate ==
                            null) {
                          failedAlert(context, 'No Date Selected');
                        } else {
                          await BlocProvider.of<PreservationInfoCubit>(context)
                              .updatePatinetReservation(
                                  token: BlocProvider.of<AuthCubit>(context)
                                      .patient!
                                      .token,
                                  id: reservation.id!,
                                  body: {
                                "date": BlocProvider.of<FreeTimesCubit>(context)
                                    .selectedDate
                                    ?.toIso8601String(),
                              });
                          await BlocProvider.of<PreservationInfoCubit>(context)
                              .getPatientReservationInfo(
                            token: BlocProvider.of<AuthCubit>(context)
                                .patient!
                                .token,
                          );
                          await BlocProvider.of<FreeTimesCubit>(context)
                              .getFreeTimes(
                                  token: BlocProvider.of<AuthCubit>(context)
                                      .patient!
                                      .token,
                                  body: {
                                "dermatologist": reservation.dermatologist.id
                              });
                          setState(() {
                            isLoading = false;
                            isVisable = false;
                          });
                        }
                      } else {
                        setState(() {
                          isVisable = true;
                        });
                      }
                    },
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ],
        );
      },
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
