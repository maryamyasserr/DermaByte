import 'package:dermabyte/Core/Widgets/err_widget.dart';
import 'package:dermabyte/Core/Widgets/loading_indicator.dart';
import 'package:dermabyte/Core/utils/assets.dart';
import 'package:dermabyte/Core/utils/colors.dart';
import 'package:dermabyte/Core/utils/font_styels.dart';
import 'package:dermabyte/Features/Authentication/Presentation/View%20Model/Auth%20Cubit/auth_cubit.dart';
import 'package:dermabyte/Features/Doctor/Presentaion/View%20Model/Get%20My%20FreeTimes/get_my_freetimes_cubit.dart';
import 'package:dermabyte/Features/Doctor/Presentaion/View/Widgets/Profile/My_Schedule/my_schedule_button.dart';
import 'package:dermabyte/Features/Doctor/Presentaion/View/Widgets/Profile/My_Schedule/schedule_indo.dart';
import 'package:dermabyte/Features/Doctor/Presentaion/View/Widgets/Profile/My_Schedule/swithcer.dart';
import 'package:dermabyte/Features/E-doctor%20Reservation/Presentaion/View/Widgets/time_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyFreeTimesBody extends StatefulWidget {
  const MyFreeTimesBody({super.key});

  @override
  State<MyFreeTimesBody> createState() => _MyFreeTimesBodyState();
}

class _MyFreeTimesBodyState extends State<MyFreeTimesBody> {
  late PageController _pageController;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentPage);
    BlocProvider.of<GetMyFreeTimesDCubit>(context).getMySchedule(
      token: BlocProvider.of<AuthCubit>(context).doctorModel!.token,
    );
  }

  void _nextPage() {
    final state = BlocProvider.of<GetMyFreeTimesDCubit>(context).state;
    if (state is GetMyScheduleSuccess &&
        _currentPage < state.freeTimes.length - 1) {
      _currentPage++;
      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
      setState(() {});
    }
    if (state is GetMyScheduleSuccess &&
        _currentPage == state.freeTimes.length - 1) {
      _currentPage = 0;
      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
      setState(() {});
    }
  }

  void _previousPage() {
    if (_currentPage > 0) {
      _currentPage--;
      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(Assets.kBackground),
          fit: BoxFit.fill,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: BlocBuilder<GetMyFreeTimesDCubit, GetMyFreeTimesDState>(
          builder: (context, state) {
            if (state is GetMyScheduleFailure) {
              return Center(
                child: ErrWidget(
                  onTap: () async {
                    await BlocProvider.of<GetMyFreeTimesDCubit>(context)
                        .getMySchedule(
                      token: BlocProvider.of<AuthCubit>(context)
                          .doctorModel!
                          .token,
                    );
                  },
                  errMessage: 'SomeThing is Wrong, try again',
                ),
              );
            } else if (state is GetMyScheduleSuccess) {
              return Column(
                children: <Widget>[
                  const SizedBox(height: 70),
                  Swithcer(
                    date: state.freeTimes[_currentPage].day!,
                    back: _previousPage,
                    next: _nextPage,
                  ),
                  const SizedBox(height: 60),
                  Expanded(
                    child: PageView.builder(
                      controller: _pageController,
                      itemCount: state.freeTimes.length,
                      onPageChanged: (index) {
                        setState(() {
                          _currentPage = index;
                        });
                      },
                      itemBuilder: (context, pageIndex) {
                        return ListView(
                          children: <Widget>[
                            MySechduleInfo(
                              title: 'Total Workdays',
                              subTitle: '${state.freeTimes.length} days',
                            ),
                            const SizedBox(height: 24),
                            MySechduleInfo(
                              title: 'Total Sessions today',
                              subTitle:
                                  "${state.freeTimes[pageIndex].numOfReservedSessions} sessions",
                            ),
                            const Divider(
                              height: 50,
                              thickness: 0.7,
                              color: AppColors.kPrimaryColor,
                            ),
                            Text(
                              'Free Times Today',
                              style: Styels.textStyle20_700(context),
                            ),
                            const SizedBox(height: 16),
                            GridView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount:
                                  state.freeTimes[pageIndex].freeTime!.length,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 4,
                                crossAxisSpacing: 12,
                                mainAxisSpacing: 24,
                                childAspectRatio: 2 / 1.1,
                              ),
                              itemBuilder: (context, index) {
                                final time =
                                    state.freeTimes[pageIndex].freeTime![index];
                                return TimeWidget(
                                  title:
                                      "${time.hour}:${time.minute.toString().padLeft(2, '0')}",
                                  isSelected: false,
                                  onSelect: () {},
                                );
                              },
                            ),
                            const SizedBox(height: 32),
                            ScheduleButton(
                              text: 'Update',
                              onPressed: () {
                                showModalBottomSheet(
                                    context: context,
                                    builder: (context) {
                                      return Container();
                                    });
                              },
                              isLoading: false,
                            ),
                            const SizedBox(height: 16),
                            ScheduleButton(
                              text: 'Delete',
                              onPressed: () async {
                                //  BlocProvider.of<GetMyScheduleCubit>(context).deleteScheduleDay(id: state.freeTimes, token: token)
                              },
                              isLoading: false,
                            ),
                            const SizedBox(height: 16),
                          ],
                        );
                      },
                    ),
                  ),
                ],
              );
            } else {
              return const Center(
                child: LoadingIndicator(
                  color: AppColors.kPrimaryColor,
                ),
              );
            }
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}

// import 'package:dermabyte/Core/Widgets/err_widget.dart';
// import 'package:dermabyte/Core/Widgets/loading_indicator.dart';
// import 'package:dermabyte/Core/utils/assets.dart';
// import 'package:dermabyte/Core/utils/colors.dart';
// import 'package:dermabyte/Core/utils/font_styels.dart';
// import 'package:dermabyte/Features/Authentication/Presentation/View%20Model/Auth%20Cubit/auth_cubit.dart';
// import 'package:dermabyte/Features/Doctor/Presentaion/View%20Model/Get%20My%20Schedule/get_my_schedule_cubit.dart';
// import 'package:dermabyte/Features/Doctor/Presentaion/View/Widgets/Profile/My%20Schedule/my_schedule_button.dart';
// import 'package:dermabyte/Features/Doctor/Presentaion/View/Widgets/Profile/My%20Schedule/schedule_indo.dart';
// import 'package:dermabyte/Features/Doctor/Presentaion/View/Widgets/Profile/My%20Schedule/swithcer.dart';
// import 'package:dermabyte/Features/E-doctor%20Reservation/Presentaion/View/Widgets/time_widget.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class MyScheduleBody extends StatefulWidget {
//   const MyScheduleBody({super.key});

//   @override
//   State<MyScheduleBody> createState() => _MyScheduleBodyState();
// }

// class _MyScheduleBodyState extends State<MyScheduleBody> {
//   @override
//   void initState() {
//     BlocProvider.of<GetMyScheduleCubit>(context).getMySchedule(
//         token: BlocProvider.of<AuthCubit>(context).doctorModel!.token);
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: const BoxDecoration(
//           image: DecorationImage(
//               image: AssetImage(Assets.kBackground), fit: BoxFit.fill)),
//       child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 12),
//         child: BlocBuilder<GetMyScheduleCubit, GetMyScheduleState>(
//           builder: (context, state) {
//             if (state is GetMyScheduleFailure) {
//               return Center(
//                 child: ErrWidget(
//                     onTap: () async {
//                       await BlocProvider.of<GetMyScheduleCubit>(context)
//                           .getMySchedule(
//                               token: BlocProvider.of<AuthCubit>(context)
//                                   .doctorModel!
//                                   .token);
//                     },
//                     errMessage: 'SomeThing is Wrong, try again'),
//               );
//             } else if (state is GetMyScheduleSuccess) {
//               return
//               ListView(
//                 children: <Widget>[
//                   const SizedBox(height: 70),
//                   Swithcer(
//                       date: state.freeTimes[1].day!, back: () {}, next: () {}),
//                   const SizedBox(height: 60),
//                   MySechduleInfo(
//                     title: 'Total Workdays',
//                     subTitle: '${state.freeTimes.length} days',
//                   ),
//                   const SizedBox(height: 24),
//                   MySechduleInfo(
//                       title: 'Total Sessions today',
//                       subTitle:
//                           "${state.freeTimes[1].numOfReservedSessions} session"),
//                   const Divider(
//                     height: 50,
//                     thickness: 0.7,
//                     color: AppColors.kPrimaryColor,
//                   ),
//                   Text('Free Times Today',
//                       style: Styels.textStyle20_700(context)),
//                   const SizedBox(height: 16),
//                   GridView.builder(
//                       shrinkWrap: true,
//                       physics: const NeverScrollableScrollPhysics(),
//                       itemCount: state.freeTimes[1].freeTime!.length,
//                       gridDelegate:
//                           const SliverGridDelegateWithFixedCrossAxisCount(
//                               crossAxisCount: 4,
//                               crossAxisSpacing: 12,
//                               mainAxisSpacing: 24,
//                               childAspectRatio: 2 / 1.1),
//                       itemBuilder: (context, index) {
//                         return TimeWidget(
//                           title:
//                               "${state.freeTimes[1].freeTime![index].hour.toString()}:${state.freeTimes[1].freeTime![index].minute.toString().padLeft(2, '0')}",
//                           isSelected: false,
//                           onSelect: () {},
//                         );
//                       }),
//                   const SizedBox(height: 16),
//                   ScheduleButton(
//                     text: 'Update',
//                     onPressed: () {},
//                     isLoading: false,
//                   ),
//                   const SizedBox(height: 16),
//                   ScheduleButton(
//                     text: 'Delete',
//                     onPressed: () {},
//                     isLoading: false,
//                   ),
//                   const SizedBox(height: 16),
//                 ],
//               );
//             } else {
//               return const Center(
//                 child: LoadingIndicator(
//                   color: AppColors.kPrimaryColor,
//                 ),
//               );
//             }
//           },
//         ),
//       ),
//     );
//   }
// }
