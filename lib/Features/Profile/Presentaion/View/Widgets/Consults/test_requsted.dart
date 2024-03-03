import 'package:dermabyte/Core/utils/font_styels.dart';
import 'package:dermabyte/Features/Profile/Data/Models/patient_consults/patient_consults.dart';
import 'package:dermabyte/Features/Profile/Presentaion/View_Model/Cubits/Consults%20Cubit/consults_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TestRequested extends StatelessWidget {
  const TestRequested({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    PatientConsultsModel consultaion =
        BlocProvider.of<ConsultsCubit>(context).currentConsultation;
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        "Test requested.",
        style: Styels.textStyle24_600(context),
      ),
      const SizedBox(height: 10),
      ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: consultaion.tests?.length ?? 0,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Text(
                "- ${consultaion.tests![index].testName}",
                style: Styels.textStyle15_300(context),
              ),
            );
          }),
    ]);
  }
}
