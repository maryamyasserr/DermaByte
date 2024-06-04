import 'package:dermabyte/Core/Widgets/done_alert.dart';
import 'package:dermabyte/Core/Widgets/failed_alert.dart';
import 'package:dermabyte/Core/utils/assets.dart';
import 'package:dermabyte/Core/utils/font_styels.dart';
import 'package:dermabyte/Features/Authentication/Presentation/View%20Model/Auth%20Cubit/auth_cubit.dart';
import 'package:dermabyte/Features/Authentication/Presentation/View/Widgets/text_form.dart';
import 'package:dermabyte/Features/Doctor/Presentaion/View%20Model/Set%20Schedule/set_schedule_cubit.dart';
import 'package:dermabyte/Core/Widgets/calender.dart';
import 'package:dermabyte/Features/Doctor/Presentaion/View/Widgets/Set%20Schedule/timing.dart';
import 'package:dermabyte/Features/Doctor/Presentaion/View/Widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SetScheduleBody extends StatefulWidget {
  const SetScheduleBody({super.key});
  static TextEditingController start = TextEditingController();
  static TextEditingController end = TextEditingController();
  static TextEditingController session = TextEditingController();
  static TextEditingController sessionPrice = TextEditingController();
  static DateTime? calenderTime;
  static DateTime? startTime;
  static DateTime? endTime;
  static int? sessionTime;
  static String? startTimePeriod;
  static String? endTimePeriod;

  @override
  State<SetScheduleBody> createState() => _SetScheduleBodyState();
}

class _SetScheduleBodyState extends State<SetScheduleBody> {
  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    return BlocConsumer<SetScheduleCubit, SetScheduleState>(
      listener: (context, state) {
        if (state is SetScheduleSuccess) {
          showDoneAlert(context);
        } else if (state is SetScheduleFailure) {
          failedAlert(context, state.errMessage);
        }
      },
      builder: (context, state) {
        return Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(Assets.kBackground), fit: BoxFit.cover)),
          child: ListView(
            children: [
              Container(
                width: double.infinity,
                height: MediaQuery.sizeOf(context).height * 0.08,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(25),
                        bottomRight: Radius.circular(25))),
                child: Center(
                  child: Text(
                    "Schedule",
                    style:
                        Styels.textStyle24_600(context).copyWith(fontSize: 30),
                  ),
                ),
              ),
              const SizedBox(height: 40),
              SizedBox(
                height: 150,
                child: WeekCalender(
                  onChangedSelectedDate: (date) {
                    SetScheduleBody.calenderTime = date;
                  },
                ),
              ),
              const SizedBox(height: 60),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            TextForm(
                              label: "Start-Time",
                              controller: SetScheduleBody.start,
                              enable: true,
                              keyboardType: TextInputType.number,
                              validator: (s) {
                                if (s == null || s.isEmpty) {
                                  return 'Start-Time is required';
                                } else if (int.parse(s) > 12) {
                                  return "Invalid Time";
                                } else {
                                  return null;
                                }
                              },
                            ),
                            Timing(
                                onChanged: (value) {
                                  setState(() {
                                    SetScheduleBody.startTimePeriod = value;
                                  });
                                },
                                title: SetScheduleBody.startTimePeriod)
                          ],
                        ),
                        const SizedBox(height: 24),
                        Stack(
                          children: [
                            TextForm(
                              label: "End-Time",
                              controller: SetScheduleBody.end,
                              enable: true,
                              keyboardType: TextInputType.number,
                              validator: (e) {
                                if (e == null || e.isEmpty) {
                                  return 'End-Time is required';
                                } else if (int.parse(e) > 12) {
                                  return "Invalid Time";
                                } else {
                                  return null;
                                }
                              },
                            ),
                            Timing(
                                onChanged: (value) {
                                  setState(() {
                                    SetScheduleBody.endTimePeriod = value;
                                  });
                                },
                                title: SetScheduleBody.endTimePeriod)
                          ],
                        ),
                        const SizedBox(height: 24),
                        TextForm(
                          enable: true,
                          keyboardType: TextInputType.number,
                          validator: (st) {
                            if (st == null || st.isEmpty) {
                              return 'Session-Time is required';
                            } else {
                              return null;
                            }
                          },
                          controller: SetScheduleBody.session,
                          label: "Session-Time",
                        ),
                        const SizedBox(height: 24),
                        TextForm(
                          enable: true,
                          keyboardType: TextInputType.number,
                          validator: (sp) {
                            if (sp == null || sp.isEmpty) {
                              return 'Session-Price is required';
                            } else {
                              return null;
                            }
                          },
                          controller: SetScheduleBody.sessionPrice,
                          label: "Session-Price",
                        ),
                      ],
                    )),
              ),
              const SizedBox(height: 12),
              const Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text("This price is fixed for all appointments"),
              ),
              const SizedBox(height: 80),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: MyButton(
                    horizontal: 0,
                    textButton: "Save",
                    onPressed: () async {
                      if (SetScheduleBody.calenderTime == null) {
                        failedAlert(context, "No Date Selected");
                      } else if (SetScheduleBody.startTimePeriod == null ||
                          SetScheduleBody.endTimePeriod == null) {
                        failedAlert(
                            context, 'You must choose the time AM or PM');
                      } else {
                        if (formKey.currentState!.validate()) {
                          int startHour = int.parse(SetScheduleBody.start.text);
                          int endHour = int.parse(SetScheduleBody.end.text);
                          if (SetScheduleBody.startTimePeriod == 'PM' &&
                              startHour != 12) {
                            startHour += 12;
                          } else if (SetScheduleBody.startTimePeriod == 'AM' &&
                              startHour == 12) {
                            startHour = 0;
                          }
                          if (SetScheduleBody.endTimePeriod == 'PM' &&
                              endHour != 12) {
                            endHour += 12;
                          } else if (SetScheduleBody.endTimePeriod == 'AM' &&
                              endHour == 12) {
                            endHour = 0;
                          }
                          SetScheduleBody.startTime = DateTime(
                            SetScheduleBody.calenderTime!.year,
                            SetScheduleBody.calenderTime!.month,
                            SetScheduleBody.calenderTime!.day,
                            startHour,
                          );
                          SetScheduleBody.endTime = DateTime(
                            SetScheduleBody.calenderTime!.year,
                            SetScheduleBody.calenderTime!.month,
                            SetScheduleBody.calenderTime!.day,
                            endHour,
                          );
                          if (SetScheduleBody.calenderTime!
                              .isBefore(DateTime.now())) {
                            failedAlert(context, 'Invaid Date');
                          } else if (SetScheduleBody.endTime!
                              .isBefore(SetScheduleBody.startTime!)) {
                            failedAlert(
                                context, "End Time Can't Be Before Start Time");
                          } else {
                            await BlocProvider.of<SetScheduleCubit>(context)
                                .setSchedule(
                                    body: {
                                  "day":
                                      SetScheduleBody.calenderTime!.toString(),
                                  // 'day': DateTime.now().day,
                                  "startTime":
                                      SetScheduleBody.startTime.toString(),
                                  "endTime": SetScheduleBody.endTime.toString(),
                                  "sessionTime": SetScheduleBody.session.text,
                                  'sessionCost':
                                      SetScheduleBody.sessionPrice.text
                                },
                                    token: BlocProvider.of<AuthCubit>(context)
                                        .doctorModel!
                                        .token);
                            if (BlocProvider.of<SetScheduleCubit>(context)
                                    .success ==
                                true) {
                              SetScheduleBody.start.clear();
                              SetScheduleBody.end.clear();
                              SetScheduleBody.session.clear();
                              setState(() {});
                            }
                          }
                        }
                      }
                    },
                    isLoading:
                        BlocProvider.of<SetScheduleCubit>(context).isLoading),
              )
            ],
          ),
        );
      },
    );
  }
}
