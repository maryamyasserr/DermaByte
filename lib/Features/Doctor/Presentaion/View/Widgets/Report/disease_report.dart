import 'package:cached_network_image/cached_network_image.dart';
import 'package:dermabyte/Core/utils/font_styels.dart';
import 'package:dermabyte/Features/Doctor/Presentaion/View%20Model/My_Patinets_Reports/my_patient_report_cubit.dart';
import 'package:dermabyte/Features/Profile/Data/Models/report_model/report_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

class DiseaseReport extends StatelessWidget {
  const DiseaseReport({super.key, required this.diseaseName});

  final String diseaseName;

  @override
  Widget build(BuildContext context) {
      ReportModel report =
        BlocProvider.of<MyPatientReportCubit>(context).getPatientReport!;
        
    return Row(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.22,
          width: MediaQuery.of(context).size.width * 0.31,
          child: AspectRatio(
            aspectRatio: 0.7,
            child: report.scan!.diseasePhoto==null?
           const Icon(FontAwesomeIcons.circleExclamation):
             ClipRRect(
              borderRadius: BorderRadius.circular(15),
               child: CachedNetworkImage(
                fit: BoxFit.fill,
                imageUrl: report.scan!.diseasePhoto!),
             )
            
        
          ),
        ),
        SizedBox(width: MediaQuery.of(context).size.width * 0.05),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: MediaQuery.sizeOf(context).width*0.58,
              child: Text(
               diseaseName,
                style: Styels.textStyle24_600(context),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.007),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.58,
              child:  Text(
                "The scans taken on ${DateFormat.yMMMMd().format(report.scan!.scanDate!)}  showed that ${report.patient?.firstName??""} might be suffering from ${report.scan?.diseaseName??""}. And Although our AI model is 95% accurate a doctor’s consultation is still a must.",
                maxLines: 7,
                overflow: TextOverflow.ellipsis,
              ),
            )
          ],
        )
      ],
    );
  }
}
