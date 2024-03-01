import 'package:dermabyte/Core/Widgets/custom_appBar.dart';
import 'package:dermabyte/Core/Widgets/err_widget.dart';
import 'package:dermabyte/Core/Widgets/loading_indicator.dart';
import 'package:dermabyte/Core/utils/assets.dart';
import 'package:dermabyte/Core/utils/colors.dart';
import 'package:dermabyte/Features/Appoinments/Presentaion/View/Widgets/custom_card.dart';
import 'package:dermabyte/Features/Appoinments/Presentaion/View/Widgets/header_text.dart';
import 'package:dermabyte/Features/Appoinments/Presentaion/View_Model/Cubits/Preservation_Cubit/preservation_info_cubit.dart';
import 'package:dermabyte/Features/Authentication/Presentation/View%20Model/Auth%20Cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppoinmentsBody extends StatefulWidget {
  const AppoinmentsBody({super.key});

  @override
  State<AppoinmentsBody> createState() => _AppoinmentsBodyState();
}

class _AppoinmentsBodyState extends State<AppoinmentsBody> {
  @override
  void initState() {
    BlocProvider.of<PreservationInfoCubit>(context).getPatientReservationInfo(
        id: '65dc8e92feeacbd13e5da2b6');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(Assets.kBackground), fit: BoxFit.cover)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 8),
        child: Column(
          children: [
            const CustomAppBar(title: 'Appoinments'),
            const HeaderText(
                text: "Follow up with your ongoing and future appointments."),
            const SizedBox(height: 32),
            BlocBuilder<PreservationInfoCubit, PreservationInfoState>(
              builder: (context, state) {
                if (state is PreservationInfoFailure) {
                  return const ErrWidget();
                } else if (state is PreservationInfoSuccess) {
                  if (state.pReservationInfo.isEmpty){
                    return const Center(
                      child: Text("There are no Reservations yet"),
                    );
                  }else{
                  return Expanded(
                      child: ListView.builder(
                          itemCount: state.pReservationInfo.length,
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              child: CustomCard(
                                iconCard: Assets.kFollowUpIcon,
                                cardTitle:
                                    "Dr ${state.pReservationInfo[index].dermatologist.firstName}",
                                cardSubTitle:
                                    " Dr. ${state.pReservationInfo[index].dermatologist.firstName} has reviewed your scans",
                                onPressed: () {},
                                textButton: "View",
                              ),
                            );
                          }));
                  }
                } else {
                  return const LoadingIndicator(color: AppColors.kPrimaryColor);
                }
              },
            )
            // CustomCard(
            //   iconCard: Assets.kFollowUpIcon,
            //   cardTitle: "Follow Up!",
            //   cardSubTitle:
            //       "Follow up with your last appointments, doctor has requested.",
            //   textButton: "View",
            //   onPressed: () {
            //     GoRouter.of(context).push(AppRoutes.kFollowUp);
            //   },
            // ),
            // const SizedBox(height: 24),
            // CustomCard(
            //   iconCard: Assets.kWallBlock,
            //   cardTitle: "Upcoming appoinment!",
            //   cardSubTitle: "Doctor Mohamed has scheduled an appointment on..",
            //   textButton: "View",
            //   onPressed: () {
            //     GoRouter.of(context).push(AppRoutes.kUpcoming);
            //   },
            // )
          ],
        ),
      ),
    );
  }
}
