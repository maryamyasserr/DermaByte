import 'package:dermabyte/Core/Widgets/custom_appbar.dart';
import 'package:dermabyte/Core/Widgets/loading_indicator.dart';
import 'package:dermabyte/Core/utils/assets.dart';
import 'package:dermabyte/Core/utils/colors.dart';
import 'package:dermabyte/Core/utils/font_styels.dart';
import 'package:dermabyte/Core/utils/routes.dart';
import 'package:dermabyte/Features/E-doctor/Presentaion/View/Widgets/doctor_item.dart';
import 'package:dermabyte/Features/E-doctor/Presentaion/View_Model/Cubits/DoctorReservaion/doctor_reservation_cubit.dart';
import 'package:dermabyte/Features/E-doctor/Presentaion/View_Model/E-Doctor%20Cubit/edoctor_cubit.dart';
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
    BlocProvider.of<EdoctorCubit>(context).getAllDoctors();
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
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomAppBar(title: 'Doctors'),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Widest selection from the best\ncertified doctors.',
                style: Styels.textStyle15_300(context),
              ),
            ),
            BlocBuilder<EdoctorCubit, EdoctorState>(builder: (context, state) {
              if (state is EdoctorFailure) {
                return Center(
                  child: Text(state.errMessage),
                );
              } else if (state is EdoctorSuccess) {
                return Expanded(
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: state.doctors.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 24),
                        child: DoctorItem(
                          iconCard: Assets.kWomanIcon,
                          title: state.doctors[index].firstName!,
                          subTitle:
                              'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                          onPressed: () {
                            BlocProvider.of<DoctorReservationCubit>(context)
                                .doctorId = state.doctors[index].id;
                            GoRouter.of(context)
                                .push(AppRoutes.kDoctorReservationView);
                          },
                          textButton: 'Reserve',
                        ),
                      );
                    },
                  ),
                );
              } else {
                return const LoadingIndicator(color: AppColors.kPrimaryColor);
              }
            }),
          ],
        ),
      ),
    );
  }
}
