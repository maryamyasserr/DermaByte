import 'package:dermabyte/Core/Widgets/empty.dart';
import 'package:dermabyte/Core/Widgets/failed_alert.dart';
import 'package:dermabyte/Core/Widgets/custom_appbar.dart';
import 'package:dermabyte/Core/Widgets/err_widget.dart';
import 'package:dermabyte/Core/Widgets/loading_indicator.dart';
import 'package:dermabyte/Core/utils/assets.dart';
import 'package:dermabyte/Core/utils/colors.dart';
import 'package:dermabyte/Core/utils/font_styels.dart';
import 'package:dermabyte/Core/utils/routes.dart';
import 'package:dermabyte/Features/Authentication/Presentation/View%20Model/Auth%20Cubit/auth_cubit.dart';
import 'package:dermabyte/Features/E-doctor%20Reservation/Presentaion/View/Widgets/doctor_item.dart';
import 'package:dermabyte/Features/E-doctor%20Reservation/Presentaion/View_Model/DoctorReservaion/doctor_reservation_cubit.dart';
import 'package:dermabyte/Features/E-doctor%20Reservation/Presentaion/View_Model/E-Doctor%20Cubit/edoctor_cubit.dart';
import 'package:dermabyte/Features/E-doctor%20Reservation/Presentaion/View_Model/FreeTimes/free_times_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class EdoctorViewBody extends StatefulWidget {
  const EdoctorViewBody({super.key});

  @override
  State<EdoctorViewBody> createState() => _EdoctorViewBodyState();
}

class _EdoctorViewBodyState extends State<EdoctorViewBody> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<EdoctorCubit>(context).getAllDoctors(
        token: BlocProvider.of<AuthCubit>(context).patient!.token);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(Assets.kBackground),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomAppBar(title: 'Doctors'),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Text(
              'Widest selection from the best\ncertified doctors.',
              style: Styels.textStyle16_400(context),
            ),
          ),
          BlocBuilder<EdoctorCubit, EdoctorState>(builder: (context, state) {
            if (state is EdoctorFailure) {
              return Expanded(
                child: ErrWidget(
                    onTap: () {
                      BlocProvider.of<EdoctorCubit>(context).getAllDoctors(
                          token: BlocProvider.of<AuthCubit>(context)
                              .patient!
                              .token);
                    },
                    errMessage: state.errMessage),
              );
            } else if (state is EdoctorSuccess) {
              if (state.doctors.isEmpty) {
                return const Expanded(
                  child:
                      EmptyWidget(text: "There are no doctors available now"),
                );
              } else {
                return Expanded(
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: state.doctors.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 8),
                        child: CarddItem(
                          imageCard: state.doctors[index].profilePic!,
                          bottomText:
                              "${state.doctors[index].schedules![0].sessionCost}"
                              r"$",
                          title:
                              "Dr ${state.doctors[index].firstName!} ${state.doctors[index].lastName!}",
                          subTitle: state.doctors[index].about!,
                          onPressed: () async {
                            BlocProvider.of<DoctorReservationCubit>(context)
                                .doctorId = state.doctors[index].id;
                            if (BlocProvider.of<DoctorReservationCubit>(context)
                                    .doctorId ==
                                null) {
                              failedAlert(context,
                                  "try to reserve with another doctor");
                            } else {
                              GoRouter.of(context)
                                  .push(AppRoutes.kDoctorReservationView);
                              await BlocProvider.of<FreeTimesCubit>(context)
                                  .getFreeTimes(
                                      token: BlocProvider.of<AuthCubit>(context)
                                          .patient!
                                          .token,
                                      body: {
                                    "dermatologist": state.doctors[index].id
                                  });
                              BlocProvider.of<FreeTimesCubit>(context).setDay =
                                  DateTime.now();
                            }
                          },
                          textButton: 'Reserve',
                        ),
                      );
                    },
                  ),
                );
              }
            } else {
              return const Expanded(
                  child: LoadingIndicator(color: AppColors.kPrimaryColor));
            }
          }),
        ],
      ),
    );
  }
}
