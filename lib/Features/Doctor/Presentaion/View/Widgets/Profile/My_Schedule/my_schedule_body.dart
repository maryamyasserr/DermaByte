import 'package:dermabyte/Core/Widgets/err_widget.dart';
import 'package:dermabyte/Core/Widgets/loading_indicator.dart';
import 'package:dermabyte/Core/utils/assets.dart';
import 'package:dermabyte/Core/utils/colors.dart';
import 'package:dermabyte/Core/utils/font_styels.dart';
import 'package:dermabyte/Features/Authentication/Presentation/View%20Model/Auth%20Cubit/auth_cubit.dart';
import 'package:dermabyte/Features/Doctor/Presentaion/View%20Model/My%20Schedule/my_schedule_cubit.dart';
import 'package:dermabyte/Features/Doctor/Presentaion/View/Widgets/Profile/My_Schedule/schedule_day.dart';
import 'package:dermabyte/Features/Doctor/Presentaion/View/Widgets/Profile/My_Schedule/show_dialog.dart';
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
                return ListView(
                  children: <Widget>[
                    const SizedBox(height: 30),
                    Center(
                        child: Text("My Schedule",
                            style: Styels.textStyle40(context))),
                    const SizedBox(height: 40),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                            "Session Cost : ${state.schedule[0].sessionCost}"
                            r" $",
                            style: Styels.textStyle20_700(context)),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.edit,
                                color: AppColors.kPrimaryColor, size: 24))
                      ],
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
                          updateStartTime: () {
                            showScheduleDialog(
                                context: context,
                                title: 'New Start Time',
                                hintText: state.schedule[index].startTime!.hour
                                    .toString(),
                                update: () {});
                          },
                          updateEndTime: () {
                              showScheduleDialog(
                                context: context,
                                title: 'New End Time',
                                hintText: state.schedule[index].endTime!.hour
                                    .toString(),
                                update: () {});
                          },
                        );
                      },
                    )
                  ],
                );
              }
            } else if (state is MyScheduleFailure) {
              return Center(
                child: ErrWidget(
                    errMessage: 'Some Thing is Wrong, try again',
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



// class MyScheduleBody extends StatefulWidget {
//   const MyScheduleBody({super.key});

//   @override
//   State<MyScheduleBody> createState() => _MyScheduleBodyState();
// }

// class _MyScheduleBodyState extends State<MyScheduleBody> {
//   @override
//   void initState() {
//     BlocProvider.of<MyScheduleCubit>(context).getMySchedulesD(
//         token: BlocProvider.of<AuthCubit>(context).doctorModel!.token);
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     List<DoctorScheduleModel> schedule =
//         BlocProvider.of<MyScheduleCubit>(context).schedule;
//     String token = BlocProvider.of<AuthCubit>(context).doctorModel!.token;
//     return Container(
//       decoration: const BoxDecoration(
//           image: DecorationImage(
//               image: AssetImage(Assets.kBackground), fit: BoxFit.fill)),
//       child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 16),
//         child: BlocBuilder<MyScheduleCubit, MyScheduleState>(
//           builder: (context, state) {
//             if (state is MyScheduleSuccess) {
//               if (schedule.isEmpty) {
//                 return Center(
//                   child: Text(
//                     "There is no schedule yet",
//                     style: Styels.textStyle24_600(context),
//                   ),
//                 );
//               } else {
//                 return ListView(
//                   children: <Widget>[
//                     const SizedBox(height: 30),
//                     Center(
//                         child: Text("My Schedule",
//                             style: Styels.textStyle40(context))),
//                     const SizedBox(height: 40),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Text(
//                             "Session Cost : ${schedule[0].sessionCost ?? '0'}"
//                             r" $",
//                             style: Styels.textStyle20_700(context)),
//                         IconButton(
//                             onPressed: () {},
//                             icon: const Icon(Icons.edit,
//                                 color: AppColors.kPrimaryColor, size: 24))
//                       ],
//                     ),
//                     const Divider(
//                       color: AppColors.kPrimaryColor,
//                       height: 20,
//                     ),
//                     ListView.builder(
//                       shrinkWrap: true,
//                       physics: const NeverScrollableScrollPhysics(),
//                       itemCount: schedule.length,
//                       itemBuilder: (context, index) {
//                         return ScheduleDay(
//                           day: DateFormat.EEEE().format(schedule[index].day!),
//                           deleteDay: () async {
//                             await BlocProvider.of<MyScheduleCubit>(context)
//                                 .deleteScheduleDay(
//                                     id: schedule[index].id!, token: token);
                           
                         
//                              BlocProvider.of<MyScheduleCubit>(context)
//                                 .getMySchedulesD(token: token);
                            
//                           },
//                           startTime: schedule[index].startTime!.hour > 12
//                               ? '${schedule[index].startTime!.hour - 12} pm'
//                               : '${schedule[index].startTime!.hour} Am',
//                           endTime: schedule[index].endTime!.hour > 12
//                               ? '${schedule[index].endTime!.hour - 12} pm'
//                               : '${schedule[index].endTime!.hour} Am',
//                           updateStartTime: () {},
//                           updateEndTime: () {},
//                         );
//                       },
//                     )
//                   ],
//                 );
//               }
//             } else if (state is MyScheduleFailure) {
//               return Center(
//                 child: ErrWidget(
//                     errMessage: 'Some Thing is Wrong, try again',
//                     onTap: () async {
//                       await BlocProvider.of<MyScheduleCubit>(context)
//                           .getMySchedulesD(token: token);
//                     }),
//               );
//             } else {
//               return const Center(
//                   child: LoadingIndicator(color: AppColors.kPrimaryColor));
//             }
//           },
//         ),
//       ),
//     );
//   }
// }
