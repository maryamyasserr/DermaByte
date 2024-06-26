import 'package:dermabyte/Core/Widgets/err_widget.dart';
import 'package:dermabyte/Core/Widgets/loading_indicator.dart';
import 'package:dermabyte/Core/utils/assets.dart';
import 'package:dermabyte/Core/utils/colors.dart';
import 'package:dermabyte/Core/utils/font_styels.dart';
import 'package:dermabyte/Features/Authentication/Presentation/View%20Model/Auth%20Cubit/auth_cubit.dart';
import 'package:dermabyte/Features/Doctor/Presentaion/View%20Model/Get%20My%20FreeTimes/get_my_freetimes_cubit.dart';
import 'package:dermabyte/Features/Doctor/Presentaion/View/Widgets/Profile/My_Schedule/schedule_info.dart';
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
    if (state is GetMyFreeTimesSuccess &&
        _currentPage < state.freeTimes.length - 1) {
      _currentPage++;
      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 150),
        curve: Curves.easeInOut,
      );
      setState(() {});
    }
    if (state is GetMyFreeTimesSuccess &&
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
            if (state is GetMyFreeTimesFailure) {
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
            } else if (state is GetMyFreeTimesSuccess) {
              if (state.freeTimes.isEmpty) {
                return Center(
                  child: Text(
                    "There is no schedule yet",
                    style: Styels.textStyle24_600(context),
                  ),
                );
              } else {
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
                                  final time = state
                                      .freeTimes[pageIndex].freeTime![index];
                                  return TimeWidget(
                                    title:
                                        "${timeTitle(time.hour)}:${time.minute.toString().padLeft(2, '0')} ""${night(time.hour)}",
                                    isSelected: false,
                                    onSelect: () {},
                                  );
                                },
                              ),
                              const SizedBox(height: 32),
                              const SizedBox(height: 16),
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                );
              }
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
String timeTitle(int hour) {
  if (hour > 12) {
    int newHour = hour - 12;
    return newHour.toString();
  } else {
    return hour.toString();
  }
}

String night(int hour) {
  if (hour >= 12) {
    return 'PM';
  } else {
    return 'AM';
  }
}
