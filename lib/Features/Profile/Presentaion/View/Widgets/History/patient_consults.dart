import 'package:dermabyte/Core/Widgets/err_widget.dart';
import 'package:dermabyte/Core/Widgets/failed_alert.dart';
import 'package:dermabyte/Core/Widgets/loading_indicator.dart';

import 'package:dermabyte/Core/utils/colors.dart';
import 'package:dermabyte/Core/utils/routes.dart';
import 'package:dermabyte/Features/Authentication/Presentation/View%20Model/Auth%20Cubit/auth_cubit.dart';
import 'package:dermabyte/Features/Profile/Presentaion/View/Widgets/History/history_card.dart';
import 'package:dermabyte/Features/Profile/Presentaion/View_Model/Cubits/Reports%20Cubit/reports_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

class PatientConsults extends StatelessWidget {
  const PatientConsults({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReportCubit, ReportState>(
      builder: (context, state) {
        if (state is ReportSuccess) {
          print(state.reports.length);
          return ListView.builder(
              itemCount: state.reports.length,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          bottom: 12, left: 10, right: 10),
                      child: HistoryCard(
                        logo: false,
                        imageCard:
                            state.reports[index].dermatologist!.profilePic,
                        cardTitle:
                            "Dr ${state.reports[index].dermatologist?.firstName??""} ${state.reports[index].dermatologist?.lastName??""}",
                        cardSubTitle:
                            "with Scan ${state.reports[index].scan?[0].diseaseName??""}......, on ${DateFormat.yMMMd().format(state.reports[index].createdAt??DateTime.now())}",
                        textButton: "View",
                        onPressed: () {
                          BlocProvider.of<ReportCubit>(context)
                              .setConsulationId = state.reports[index].id!;
                          if (BlocProvider.of<ReportCubit>(context)
                                  .currentConsultation ==
                              null) {
                            failedAlert(
                                context, "Something is Wrong, try later");
                          } else {
                            GoRouter.of(context).push(AppRoutes.kConsults);
                          }
                        },
                      ),
                    )
                  ],
                );
              });
        } else if (state is ReportFailure) {
          return ErrWidget(
              onTap: () async {
                await BlocProvider.of<ReportCubit>(context).getPatientConults(
                    token: BlocProvider.of<AuthCubit>(context).patient!.token);
              },
              errMessage: state.errMessage);
        } else {
          return const LoadingIndicator(color: AppColors.kPrimaryColor);
        }
      },
    );
  }
}
