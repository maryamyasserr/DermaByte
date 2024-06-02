import 'package:dermabyte/Core/Widgets/err_widget.dart';
import 'package:dermabyte/Core/Widgets/loading_indicator.dart';
import 'package:dermabyte/Core/utils/assets.dart';
import 'package:dermabyte/Core/utils/colors.dart';
import 'package:dermabyte/Core/utils/font_styels.dart';
import 'package:dermabyte/Features/Authentication/Presentation/View%20Model/Auth%20Cubit/auth_cubit.dart';
import 'package:dermabyte/Features/Doctor/Presentaion/View%20Model/My%20Schedule/my_schedule_cubit.dart';
import 'package:dermabyte/Features/Doctor/Presentaion/View/Widgets/Profile/My_Schedule/edit_session_cost.dart';
import 'package:dermabyte/Features/Doctor/Presentaion/View/Widgets/Profile/My_Schedule/schedule_day.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class MyScheduleBody extends StatefulWidget {
  const MyScheduleBody({super.key});

  @override
  State<MyScheduleBody> createState() => _MyScheduleBodyState();
}

class _MyScheduleBodyState extends State<MyScheduleBody> {
  late final MyScheduleCubit _myScheduleCubit;
  late final AuthCubit _authCubit;

  List<bool> editStartTimes = [];
  List<bool> editEndTimes = [];
  List<String> startTimingTitles = [];
  List<String> endTimingTitles = [];
  late List<TextEditingController> startTimeControllers;
  List<TextEditingController> endTimeControllers = [];
  bool editCost = false;
  TextEditingController costController = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _myScheduleCubit.getMySchedulesD(token: _authCubit.doctorModel!.token);
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _myScheduleCubit = BlocProvider.of<MyScheduleCubit>(context);
    _authCubit = BlocProvider.of<AuthCubit>(context);
  }

  @override
  Widget build(BuildContext context) {
    String token = _authCubit.doctorModel!.token;
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(Assets.kBackground), fit: BoxFit.fill)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: BlocBuilder<MyScheduleCubit, MyScheduleState>(
          builder: (context, state) {
            if (state is MyScheduleSuccess) {
              if (state.schedule.isEmpty) {
                return Center(
                  child: Text(
                    "There is no schedule yet",
                    style: Styels.textStyle24_600(context),
                  ),
                );
              } else {
                if (startTimingTitles.length != state.schedule.length &&
                    endTimingTitles.length != state.schedule.length) {
                  startTimingTitles = List<String>.generate(
                      state.schedule.length, (index) => 'Am');
                  endTimingTitles = List<String>.generate(
                      state.schedule.length, (index) => 'Am');
                  editStartTimes = List<bool>.generate(
                      state.schedule.length, (index) => false);
                  editEndTimes = List<bool>.generate(
                      state.schedule.length, (index) => false);
                  startTimeControllers = List<TextEditingController>.generate(
                      state.schedule.length,
                      (index) => TextEditingController());
                  endTimeControllers = List<TextEditingController>.generate(
                      state.schedule.length,
                      (index) => TextEditingController());
                }

                return ListView(
                  children: <Widget>[
                    const SizedBox(height: 30),
                    Center(
                        child: Text("My Schedule",
                            style: Styels.textStyle40(context))),
                    const SizedBox(height: 40),
                    SessionCost(
                      update: () async {
                        await BlocProvider.of<MyScheduleCubit>(context)
                            .updateSchedule(
                                id: state.schedule[0].id!,
                                token: token,
                                body: {
                                  'updateAll':true,
                                  "sessionCost": costController.text});
                        setState(() {
                          editCost = false;
                        });
                        await _myScheduleCubit.getMySchedulesD(token: token);
                      },
                      label: 'Cost',
                      edit: editCost,
                      enableEditing: () {
                        setState(() {
                          editCost = true;
                        });
                      },
                      controller: costController,
                      hintText: state.schedule[0].sessionCost!,
                      cost: state.schedule[0].sessionCost!,
                    ),
                    const Divider(
                      color: AppColors.kPrimaryColor,
                      height: 20,
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: state.schedule.length,
                      itemBuilder: (context, index) {
                        return ScheduleDay(
                          enableEditStartTime: () {
                            setState(() {
                              editStartTimes[index] = true;
                            });
                          },
                          enablEditEndTime: () {
                            setState(() {
                              editEndTimes[index] = true;
                            });
                          },
                          startTimeEdit: editStartTimes[index],
                          endTimeEdit: editEndTimes[index],
                          startTimingTitle: startTimingTitles[index],
                          endTimingTitles: endTimingTitles[index],
                          endTimeController: endTimeControllers[index],
                          startTimeController: startTimeControllers[index],
                          labelStartTime: 'Start-Time',
                          labelEndTime: 'End-Time',
                          onChanged: (value) {
                            setState(() {
                              startTimingTitles[index] = value ?? 'Am';
                            });
                          },
                          onChanged2: (value) {
                            setState(() {
                              endTimingTitles[index] = value ?? 'Am';
                            });
                          },
                          day: DateFormat.EEEE()
                              .format(state.schedule[index].day!),
                          deleteDay: () async {
                            await _myScheduleCubit.deleteScheduleDay(
                                id: state.schedule[index].id!, token: token);
                            await _myScheduleCubit.getMySchedulesD(
                                token: token);
                          },
                          startTime: state.schedule[index].startTime!.hour > 12
                              ? '${state.schedule[index].startTime!.hour - 12} pm'
                              : '${state.schedule[index].startTime!.hour} Am',
                          endTime: state.schedule[index].endTime!.hour > 12
                              ? '${state.schedule[index].endTime!.hour - 12} pm'
                              : '${state.schedule[index].endTime!.hour} Am',
                          updateStartTime: () async {
                            if (startTimeControllers[index].text.isEmpty) {
                              setState(() {
                                editStartTimes[index] = false;
                              });
                            } else {
                              int startHour =
                                  int.parse(startTimeControllers[index].text);
                              if (startTimingTitles[index] == 'PM' &&
                                  startHour != 12) {
                                startHour += 12;
                              } else if (startTimingTitles[index] == 'AM' &&
                                  startHour == 12) {
                                startHour = 0;
                              }
                              DateTime newStartTime = DateTime(
                                  state.schedule[index].startTime!.year,
                                  state.schedule[index].startTime!.month,
                                  state.schedule[index].startTime!.day,
                                  startHour);

                              await BlocProvider.of<MyScheduleCubit>(context)
                                  .updateSchedule(
                                      id: state.schedule[index].id!,
                                      token: token,
                                      body: {
                                    "startTime": newStartTime.toString()
                                  });
                              await _myScheduleCubit.getMySchedulesD(
                                  token: token);
                              setState(() {
                                editStartTimes[index] = false;
                              });
                            }
                          },
                          updateEndTime: () async {
                            if (endTimeControllers[index].text.isEmpty) {
                              setState(() {
                                editEndTimes[index] = false;
                              });
                            } else {
                              int endHour =
                                  int.parse(endTimeControllers[index].text);
                              if (endTimingTitles[index] == 'PM' &&
                                  endHour != 12) {
                                endHour += 12;
                              } else if (endTimingTitles[index] == 'AM' &&
                                  endHour == 12) {
                                endHour = 0;
                              }
                              DateTime newEndTime = DateTime(
                                  state.schedule[index].endTime!.year,
                                  state.schedule[index].endTime!.month,
                                  state.schedule[index].endTime!.day,
                                  endHour);

                              await BlocProvider.of<MyScheduleCubit>(context)
                                  .updateSchedule(
                                      id: state.schedule[index].id!,
                                      token: token,
                                      body: {"endTime": newEndTime.toString()});
                              await _myScheduleCubit.getMySchedulesD(
                                  token: token);
                              setState(() {
                                editEndTimes[index] = false;
                              });
                            }
                          },
                          hintText: state.schedule[index].startTime!.hour > 12
                              ? '${state.schedule[index].startTime!.hour - 12} pm'
                              : '${state.schedule[index].startTime!.hour} Am'
                                  .toString(),
                          hintText2: state.schedule[index].endTime!.hour > 12
                              ? '${state.schedule[index].endTime!.hour - 12} pm'
                              : '${state.schedule[index].endTime!.hour} Am'
                                  .toString(),
                        );
                      },
                    )
                  ],
                );
              }
            } else if (state is MyScheduleFailure) {
              return Center(
                child: ErrWidget(
                    errMessage: 'Something is wrong, try again',
                    onTap: () async {
                      await _myScheduleCubit.getMySchedulesD(token: token);
                    }),
              );
            } else {
              return const Center(
                  child: LoadingIndicator(color: AppColors.kPrimaryColor));
            }
          },
        ),
      ),
    );
  }
}
