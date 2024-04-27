import 'package:dermabyte/Core/Widgets/failed_alert.dart';
import 'package:dermabyte/Core/Widgets/snack_bar.dart';
import 'package:dermabyte/Core/utils/assets.dart';
import 'package:dermabyte/Core/utils/font_styels.dart';
import 'package:dermabyte/Features/Authentication/Presentation/View%20Model/Auth%20Cubit/auth_cubit.dart';
import 'package:dermabyte/Features/Authentication/Presentation/View/Widgets/text_form.dart';
import 'package:dermabyte/Features/Doctor/Presentaion/View%20Model/Set%20Schedule/set_schedule_cubit.dart';
import 'package:dermabyte/Core/Widgets/calender.dart';
import 'package:dermabyte/Features/Doctor/Presentaion/View/Widgets/Schedule/timing.dart';
import 'package:dermabyte/Features/Doctor/Presentaion/View/Widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ScheduleBody extends StatefulWidget {
  const ScheduleBody({super.key});
  static TextEditingController start = TextEditingController();
  static TextEditingController end = TextEditingController();
  static TextEditingController session = TextEditingController();
  static DateTime? calenderTime;
  static DateTime? startTime;
  static DateTime? endTime;
  static int? sessionTime;
  static String? startTimePeriod;
  static String? endTimePeriod;

  @override
  State<ScheduleBody> createState() => _ScheduleBodyState();
}

class _ScheduleBodyState extends State<ScheduleBody> {
  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    return BlocConsumer<SetScheduleCubit, SetScheduleState>(
      listener: (context, state) {
        if (state is SetScheduleSuccess) {
          showSnackBar(context, state.successMessage);
        } else if (state is SetScheduleFailure) {
          showSnackBar(context, state.errMessage);
        }
      },
      builder: (context, state) {
        return Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(Assets.kBackground), fit: BoxFit.cover)),
          child: ListView(
            children: [
              const SizedBox(height: 50),
              Center(
                child: Text(
                  "Schedule",
                  style: Styels.textStyle24_600(context).copyWith(fontSize: 30),
                ),
              ),
              const SizedBox(height: 40),
              SizedBox(
                height: 150,
                child: WeekCalender(
                  onChangedSelectedDate: (date) {
                    ScheduleBody.calenderTime = date;
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
                              controller: ScheduleBody.start,
                              enable: true,
                              keyboardType: TextInputType.number,
                              validator: (s) {
                                if (s == null || s.isEmpty) {
                                  return 'Start-Time is required';
                                } else {
                                  return null;
                                }
                              },
                            ),
                            Timing(
                                onChanged: (value) {
                                  setState(() {
                                    ScheduleBody.startTimePeriod = value;
                                  });
                                },
                                title: ScheduleBody.startTimePeriod)
                          ],
                        ),
                        const SizedBox(height: 24),
                        Stack(
                          children: [
                            TextForm(
                              label: "End-Time",
                              controller: ScheduleBody.end,
                              enable: true,
                              keyboardType: TextInputType.number,
                              validator: (e) {
                                if (e == null || e.isEmpty) {
                                  return 'Start-Time is required';
                                } else {
                                  return null;
                                }
                              },
                            ),
                            Timing(
                                onChanged: (value) {
                                  setState(() {
                                    ScheduleBody.endTimePeriod = value;
                                  });
                                },
                                title: ScheduleBody.endTimePeriod)
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
                          controller: ScheduleBody.session,
                          label: "Session-Time",
                        ),
                      ],
                    )),
              ),
              const SizedBox(height: 100),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: MyButton(
                    horizontal: 0,
                    textButton: "Save",
                    onPressed: () async {
                      if (ScheduleBody.calenderTime == null) {
                        failedAlert(context, "No Date Selected");
                      } else if (ScheduleBody.startTimePeriod == null ||
                          ScheduleBody.endTimePeriod == null) {
                        failedAlert(
                            context, 'You must choose the time AM or PM');
                      } else {
                        if (formKey.currentState!.validate()) {
                          if (ScheduleBody.startTimePeriod == 'PM') {
                            int startHour = int.parse(ScheduleBody.start.text);
                            startHour += 12;
                            ScheduleBody.startTime = DateTime(
                                ScheduleBody.calenderTime!.year,
                                ScheduleBody.calenderTime!.month,
                                ScheduleBody.calenderTime!.day,
                                startHour);
                          }
                          if (ScheduleBody.endTimePeriod == 'PM') {
                            int endHour = int.parse(ScheduleBody.start.text);
                            endHour += 12;
                            ScheduleBody.endTime = DateTime(
                                ScheduleBody.calenderTime!.year,
                                ScheduleBody.calenderTime!.month,
                                ScheduleBody.calenderTime!.day,
                                endHour);
                          }
                          ScheduleBody.startTime = DateTime(
                              ScheduleBody.calenderTime!.year,
                              ScheduleBody.calenderTime!.month,
                              ScheduleBody.calenderTime!.day,
                              int.parse(ScheduleBody.start.text));
                          ScheduleBody.endTime = DateTime(
                              ScheduleBody.calenderTime!.year,
                              ScheduleBody.calenderTime!.month,
                              ScheduleBody.calenderTime!.day,
                              int.parse(ScheduleBody.end.text));
                          await BlocProvider.of<SetScheduleCubit>(context)
                              .setSchedule(
                                  body: {
                                "day": ScheduleBody.calenderTime?.day,
                                "startTime": ScheduleBody.startTime.toString(),
                                "endTime": ScheduleBody.endTime.toString(),
                                "sessionTime": ScheduleBody.session.text
                              },
                                  token: BlocProvider.of<AuthCubit>(context)
                                      .doctorModel!
                                      .token);

                          ScheduleBody.start.clear();
                          ScheduleBody.end.clear();
                          ScheduleBody.session.clear();
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
