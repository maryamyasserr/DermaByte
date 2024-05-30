import 'package:dermabyte/Core/Widgets/err_widget.dart';
import 'package:dermabyte/Core/Widgets/loading_indicator.dart';
import 'package:dermabyte/Core/utils/assets.dart';
import 'package:dermabyte/Core/utils/colors.dart';
import 'package:dermabyte/Core/utils/font_styels.dart';
import 'package:dermabyte/Features/Authentication/Presentation/View%20Model/Auth%20Cubit/auth_cubit.dart';
import 'package:dermabyte/Features/Doctor/Presentaion/View%20Model/Get%20My%20Schedule/get_my_schedule_cubit.dart';
import 'package:dermabyte/Features/Doctor/Presentaion/View/Widgets/Profile/My%20Schedule/my_schedule_button.dart';
import 'package:dermabyte/Features/Doctor/Presentaion/View/Widgets/Profile/My%20Schedule/schedule_indo.dart';
import 'package:dermabyte/Features/Doctor/Presentaion/View/Widgets/Profile/My%20Schedule/swithcer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyScheduleBody extends StatefulWidget {
  const MyScheduleBody({super.key});

  @override
  State<MyScheduleBody> createState() => _MyScheduleBodyState();
}

class _MyScheduleBodyState extends State<MyScheduleBody> {
  @override
  void initState() {
    BlocProvider.of<GetMyScheduleCubit>(context).getMySchedule(
        token: BlocProvider.of<AuthCubit>(context).doctorModel!.token);
    super.initState();
  }

  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(Assets.kBackground), fit: BoxFit.fill)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: BlocBuilder<GetMyScheduleCubit, GetMyScheduleState>(
          builder: (context, state) {
            if (state is GetMyScheduleFailure) {
              return Center(
                child: ErrWidget(
                    onTap: () async {
                      await BlocProvider.of<GetMyScheduleCubit>(context)
                          .getMySchedule(
                              token: BlocProvider.of<AuthCubit>(context)
                                  .doctorModel!
                                  .token);
                    },
                    errMessage: 'SomeThing is Wrong, try again'),
              );
            }else if(state is GetMyScheduleSuccess){
            return ListView(
              children: <Widget>[
                const SizedBox(height: 70),
                Swithcer(
                  date: state.freeTimes[0].day!,
                  back: () {}, next: () {}),
                const SizedBox(height: 60),
                 MySechduleInfo(
                  title: 'Total Workdays',
                  subTitle: '${state.freeTimes.length} days',
                ),
                const SizedBox(height: 24),
                 MySechduleInfo(
                    title: 'Total Sessions today', subTitle: "${state.freeTimes[0].numOfReservedSessions} session"),
                const Divider(
                  height: 50,
                  thickness: 0.7,
                  color: AppColors.kPrimaryColor,
                ),
                Text('Free Times Today',
                    style: Styels.textStyle20_700(context)),
                const SizedBox(height: 16),
                ScheduleButton(
                  text: 'Update',
                  onPressed: () {},
                  isLoading: false,
                ),
                const SizedBox(height: 16),
                ScheduleButton(
                  text: 'Delete',
                  onPressed: () {},
                  isLoading: false,
                )
              ],
            );
         
            }else{
               return const Center(child: LoadingIndicator(color: AppColors.kPrimaryColor,),);
            }
          },
        ),
      ),
    );
  }
}
