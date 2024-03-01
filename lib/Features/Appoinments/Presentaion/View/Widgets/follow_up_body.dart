import 'package:dermabyte/Core/Widgets/custom_appbar.dart';
import 'package:dermabyte/Core/utils/assets.dart';
import 'package:dermabyte/Features/Appoinments/Data/Models/preservation_model/preservation_model.dart';
import 'package:dermabyte/Features/Appoinments/Presentaion/View/Widgets/custom_card.dart';
import 'package:dermabyte/Features/Appoinments/Presentaion/View/Widgets/header_text.dart';
import 'package:dermabyte/Features/Appoinments/Presentaion/View_Model/Cubits/Preservation_Cubit/preservation_info_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FollowUpBody extends StatelessWidget {
  const FollowUpBody({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    late PreservationModel patientReservation =
        BlocProvider.of<PreservationInfoCubit>(context).currentReservation;
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
            CustomCard(
              iconCard: Assets.kFollowUpIcon,
              cardTitle:
                  "Dr. ${patientReservation.dermatologist.firstName}'s appointment",
              cardSubTitle:
                  'Dr. Mai has reviewed your scans and scheduled an online appointment',
              textButton: 'View',
              onPressed: () {},
            ),
            Expanded(
                child: ListView.builder(
                    itemCount: patientReservation.tests?.length ?? 0,
                    itemBuilder: (context, index) {
                      return CustomCard(
                          iconCard: Assets.kAppoinments,
                          cardTitle:
                              'Dr. ${patientReservation.dermatologist.firstName} requested tests.',
                          cardSubTitle:
                              "Dr. Mai reviewed your scans and it seems like she’ll need more tests to conduct her diagnosing process.",
                          textButton: "View",
                          onPressed: () {});
                    }))
          ],
        ),
      ),
    );
  }
}
