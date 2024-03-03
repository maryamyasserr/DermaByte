import 'package:dermabyte/Core/utils/assets.dart';
import 'package:dermabyte/Core/utils/font_styels.dart';
import 'package:dermabyte/Features/Profile/Data/Models/patient_consults/patient_consults.dart';
import 'package:dermabyte/Features/Profile/Presentaion/View_Model/Cubits/Consults%20Cubit/consults_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ConsutlsHeaderSection extends StatelessWidget {
  const ConsutlsHeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    PatientConsultsModel consultaion =
        BlocProvider.of<ConsultsCubit>(context).currentConsultation;
    return Column(
      children: [
        Align(
            alignment: Alignment.centerRight,
            child: Text(
              "10/10/2023",
              style: Styels.textStyle14_300(context),
            )),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.17,
              width: MediaQuery.of(context).size.width * 0.31,
              child: AspectRatio(
                aspectRatio: 0.7,
                child: Image.asset(
                  Assets.kDiseasePhoto,
                  fit: BoxFit.fill,
                  height: 200,
                ),
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Melanoma",
                    style: Styels.textStyle24_600(context),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "The scans taken on 10/10/2023 show that you have melanoma.",
                    style: Styels.textStyle14_300(context),
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.03,
        ),
        const Divider(
          thickness: 0.7,
          color: Colors.black,
        ),
      ],
    );
  }
}
