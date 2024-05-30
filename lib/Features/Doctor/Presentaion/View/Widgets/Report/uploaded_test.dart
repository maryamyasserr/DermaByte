import 'package:cached_network_image/cached_network_image.dart';
import 'package:dermabyte/Core/Widgets/err_widget.dart';
import 'package:dermabyte/Core/utils/font_styels.dart';
import 'package:dermabyte/Features/Doctor/Presentaion/View%20Model/My_Patinets_Reports/my_patient_report_cubit.dart';
import 'package:dermabyte/Features/Profile/Data/Models/Report/report_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UploadedTestReport extends StatelessWidget {
  const UploadedTestReport({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    ReportModel? consultaion =
        BlocProvider.of<MyPatientReportCubit>(context).getPatientReport;
    return consultaion == null
        ? const ErrWidget(errMessage: "Something is wrong")
        : ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: consultaion.uploadedTest!.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "- ${consultaion.uploadedTest?[index].testName ?? ""}",
                        style: Styels.textStyle20_300(context),
                      ),
                    ),
                    const SizedBox(height: 16),
                    consultaion.uploadedTest![index].testResult!.isEmpty
                        ? const SizedBox()
                        : SizedBox(
                            height: MediaQuery.sizeOf(context).height * 0.5,
                            child: PageView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: consultaion
                                    .uploadedTest![index].testResult!.length,
                                itemBuilder: (context, indexX) {
                                  return Padding(
                                    padding: const EdgeInsets.only(bottom: 20),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(15),
                                      child: AspectRatio(
                                        aspectRatio: 1.2,
                                        child: CachedNetworkImage(
                                          fit: BoxFit.fill,
                                          imageUrl: consultaion
                                              .uploadedTest![index]
                                              .testResult![indexX],
                                        ),
                                      ),
                                    ),
                                  );
                                }),
                          ),
                  ],
                ),
              );
            });
  }
}
