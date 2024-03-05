import 'package:dermabyte/Core/utils/font_styels.dart';
import 'package:dermabyte/Features/Profile/Data/Models/patient_consults_model/patient_consults_model.dart';
import 'package:dermabyte/Features/Profile/Presentaion/View_Model/Cubits/Reports%20Cubit/reports_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Medications extends StatelessWidget {
  const Medications({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    ReportModel consultaion =
        BlocProvider.of<ReportCubit>(context).currentConsultation;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Medications",
          style: Styels.textStyle24_600(context),
        ),
        const SizedBox(height: 10),
        ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: consultaion.medicine!.isEmpty
                ? 0
                : consultaion.medicine!.length,
            itemBuilder: ((context, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Text(
                  "- ${consultaion.medicine?[index] ?? ""}",
                  style: Styels.textStyle15_300(context),
                ),
              );
            }))
      ],
    );
  }
}
