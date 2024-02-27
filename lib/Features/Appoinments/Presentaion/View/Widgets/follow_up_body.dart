import 'package:dermabyte/Core/Widgets/custom_appbar.dart';
import 'package:dermabyte/Core/Widgets/err_widget.dart';
import 'package:dermabyte/Core/Widgets/loading_indicator.dart';
import 'package:dermabyte/Core/utils/assets.dart';
import 'package:dermabyte/Features/Appoinments/Presentaion/View/Widgets/custom_card.dart';
import 'package:dermabyte/Features/Appoinments/Presentaion/View/Widgets/header_text.dart';
import 'package:dermabyte/Features/Appoinments/Presentaion/View_Model/Cubits/Preservation_Cubit/preservation_info_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FollowUpBody extends StatelessWidget {
  const FollowUpBody({super.key});

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
            const CustomAppBar(title: "Follow Up!"),
            const HeaderText(
                text: "Follow up with your ongoing and future appointments."),
            const SizedBox(height: 32),
            BlocBuilder<PreservationInfoCubit, PreservationInfoState>(
              builder: (context, state) {
                if (state is PreservationInfoFailure) {
                  return const ErrWidget();
                } else if (state is PreservationInfoSuccess) {
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
                } else {
                  return const LoadingIndicator();
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
