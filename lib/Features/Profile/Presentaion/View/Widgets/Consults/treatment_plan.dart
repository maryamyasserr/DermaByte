import 'package:dermabyte/Core/utils/font_styels.dart';
import 'package:dermabyte/Features/Profile/Data/Models/patient_consults_model/patient_consults.dart';
import 'package:dermabyte/Features/Profile/Presentaion/View_Model/Cubits/Consults%20Cubit/consults_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TreatmentPlan extends StatelessWidget {
  const TreatmentPlan({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    PatientConsultsModel consultaion =
        BlocProvider.of<ConsultsCubit>(context).currentConsultation;
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
