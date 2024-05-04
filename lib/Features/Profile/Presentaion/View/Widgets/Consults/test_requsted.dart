import 'package:dermabyte/Core/Widgets/err_widget.dart';
import 'package:dermabyte/Core/utils/font_styels.dart';
import 'package:dermabyte/Features/Profile/Data/Models/report_model/report_model.dart';

import 'package:dermabyte/Features/Profile/Presentaion/View_Model/Cubits/Reports%20Cubit/reports_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TestRequested extends StatelessWidget {
  const TestRequested({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    ReportModel? consultaion =
        BlocProvider.of<ReportCubit>(context).currentConsultation;
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        "Test requested.",
        style: Styels.textStyle24_600(context),
      ),
      const SizedBox(height: 10),
      consultaion == null
          ? const ErrWidget(errMessage: 'Some Thing Is Wrong')
          : ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: consultaion.tests?.length ?? 0,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Text(
                    "- ${consultaion.tests?[index].testName!.join() ?? ""}",
                    style: Styels.textStyle18_400(context),
                  ),
                );
              }),
    ]);
  }
}
