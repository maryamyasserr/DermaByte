import 'package:cached_network_image/cached_network_image.dart';
import 'package:dermabyte/Core/Widgets/err_widget.dart';
import 'package:dermabyte/Core/utils/font_styels.dart';
import 'package:dermabyte/Features/Profile/Data/Models/Report/report_model.dart';
import 'package:dermabyte/Features/Profile/Presentaion/View_Model/Cubits/Reports%20Cubit/reports_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TestResult extends StatelessWidget {
  const TestResult({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    ReportModel? consultaion =
        BlocProvider.of<ReportCubit>(context).currentConsultation;
    return  consultaion == null
        ? const ErrWidget(errMessage: "Something is wrong")
        : Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              "Test Results.",
              style: Styels.textStyle24_600(context),
            ),
            const SizedBox(height: 10),
            ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: consultaion.testResult!.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "- ${consultaion.testResult?[index].testName ?? ""}",
                            style: Styels.textStyle20_300(context),
                          ),
                        ),
                        const SizedBox(height: 16),
                        consultaion.testResult![index].testResult!.isEmpty
                            ? const SizedBox()
                            : SizedBox(
                                height:
                                    MediaQuery.sizeOf(context).height * 0.5,
                                child: PageView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: consultaion
                                        .testResult![index].testResult!.length,
                                    itemBuilder: (context, indexX) {
                                      return Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 20),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          child: AspectRatio(
                                            aspectRatio: 1.2,
                                            child: CachedNetworkImage(
                                              fit: BoxFit.fill,
                                              imageUrl: consultaion
                                                  .testResult![index]
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
                }),
          ]);
    
    // Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
    //   Text(
    //     "Test Results.",
    //     style: Styels.textStyle24_600(context),
    //   ),
    //   const SizedBox(height: 10),
    //   consultaion == null
    //       ? const ErrWidget(errMessage: 'Some Thing Is Wrong')
    //       : ListView.builder(
    //           shrinkWrap: true,
    //           physics: const NeverScrollableScrollPhysics(),
    //           itemCount: consultaion.testResult!.length,
    //           itemBuilder: (context, index) {
    //             return Padding(
    //               padding: const EdgeInsets.only(bottom: 10),
    //               child: Column(
    //                 children: [
    //                   Align(
    //                     alignment: Alignment.centerLeft,
    //                     child: Text(
    //                       "- ${consultaion.testResult?[index].testName ?? ""}",
    //                       style: Styels.textStyle18_400(context),
    //                     ),
    //                   ),
    //                   const SizedBox(height: 16),
    //                   // CachedNetworkImage(
    //                   //   imageUrl: consultaion.testResult?[index].testResult?[0],
    //                   //   errorWidget: (context, url, error) {
    //                   //     return const Icon(Icons.error);
    //                   //   },
    //                   // )
    //                 ],
    //               ),
    //             );
    //           }),
    // ]);
  }
}
