import 'package:cached_network_image/cached_network_image.dart';

import 'package:dermabyte/Core/utils/font_styels.dart';
import 'package:dermabyte/Features/Profile/Data/Models/Report/report_model.dart';
import 'package:dermabyte/Features/Profile/Presentaion/View_Model/Cubits/Reports%20Cubit/reports_cubit.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class ConsutlsHeaderSection extends StatelessWidget {
  const ConsutlsHeaderSection({super.key, required this.pageController});

  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    ReportModel consultaion =
        BlocProvider.of<ReportCubit>(context).currentConsultation!;
    return Column(
      children: [
        Align(
            alignment: Alignment.centerRight,
            child: Text(
              "${consultaion.scan![0].scanDate!.year}/${consultaion.scan![0].scanDate!.month}/${consultaion.scan![0].scanDate!.day}",
              style: Styels.textStyle14_300(context),
            )),
        const SizedBox(height: 10),
        SizedBox(
          height: MediaQuery.sizeOf(context).height * 0.17,
          child: PageView.builder(
              controller: pageController,
              scrollDirection: Axis.horizontal,
              itemCount: consultaion.scan!.length,
              itemBuilder: (context, index) {
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.17,
                      width: MediaQuery.of(context).size.width * 0.31,
                      child: AspectRatio(
                        aspectRatio: 0.7,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: CachedNetworkImage(
                            imageUrl: consultaion.scan![index].diseasePhoto!,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: MediaQuery.sizeOf(context).width * 0.7,
                            child: Text(
                              consultaion.scan![index].diseaseName!,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              style: Styels.textStyle24_600(context),
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            "The scans taken on ${consultaion.scan![0].scanDate!.year}/${consultaion.scan![0].scanDate!.month}/${consultaion.scan![0].scanDate!.day}",
                            style: Styels.textStyle14_300(context),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              }),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.03,
        ),
      ],
    );
  }
}
