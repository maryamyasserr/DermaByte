import 'package:dermabyte/Core/Widgets/snack_bar.dart';
import 'package:dermabyte/Core/utils/assets.dart';
import 'package:dermabyte/Core/utils/font_styels.dart';
import 'package:dermabyte/Features/Authentication/Presentation/View%20Model/Auth%20Cubit/auth_cubit.dart';
import 'package:dermabyte/Features/Doctor/Presentaion/View%20Model/Set%20Schedule/set_schedule_cubit.dart';
import 'package:dermabyte/Features/Doctor/Presentaion/View/Widgets/Schedule/calender.dart';
import 'package:dermabyte/Features/Doctor/Presentaion/View/Widgets/Schedule/schedule_field.dart';
import 'package:dermabyte/Features/Doctor/Presentaion/View/Widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class ScheduleBody extends StatelessWidget {
  const ScheduleBody({super.key});
  static TextEditingController start = TextEditingController();
  static TextEditingController end = TextEditingController();
  static TextEditingController session = TextEditingController();
  static DateTime? calenderTime;
  static DateTime? startTime;
  static DateTime? endTime;
  static int? sessionTime;
  @override
  Widget build(BuildContext context) {
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
                    calenderTime = date;
                  },
                ),
              ),
              const SizedBox(height: 60),
              ScheduleForm(
                controller: start,
                label: "Start-Time",
              ),
              const SizedBox(height: 24),
              ScheduleForm(
                controller: end,
                label: "End-Time",
              ),
              const SizedBox(height: 24),
              ScheduleForm(
                controller: session,
                label: "Session-Time",
              ),
              const SizedBox(height: 100),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: MyButton(
                    horizontal: 0,
                    textButton: "Save",
                    onPressed: () async {
                      startTime = DateTime(
                          calenderTime!.year,
                          calenderTime!.month,
                          calenderTime!.day,
                          int.parse(start.text));
                      endTime = DateTime(
                          calenderTime!.year,
                          calenderTime!.month,
                          calenderTime!.day,
                          int.parse(end.text));
                      await BlocProvider.of<SetScheduleCubit>(context)
                          .setSchedule(
                              body: {
                            "day": DateFormat('EEEE')
                                .format(calenderTime!)
                                .toString(),
                            "startTime": startTime.toString(),
                            "endTime": endTime.toString(),
                            "sessionTime": session.text
                          },
                              token: BlocProvider.of<AuthCubit>(context)
                                  .doctorModel!
                                  .token);

                      start.clear();
                      end.clear();
                      session.clear();
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
