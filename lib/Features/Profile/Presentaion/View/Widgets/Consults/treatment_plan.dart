import 'package:dermabyte/Core/utils/font_styels.dart';
import 'package:dermabyte/Features/Profile/Data/Models/Report/report_model.dart';

import 'package:dermabyte/Features/Profile/Presentaion/View_Model/Cubits/Reports%20Cubit/reports_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TreatmentPlan extends StatelessWidget {
  const TreatmentPlan({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    ReportModel consultaion =
        BlocProvider.of<ReportCubit>(context).currentConsultation;
    return Column(
      children: [
        Text("Treatment plan", style: Styels.textStyle24_600(context)),
        Text(
          consultaion.treatmentPlan,
          style: Styels.textStyle15_300(context),
        ),
      ],
    );
  }
}
