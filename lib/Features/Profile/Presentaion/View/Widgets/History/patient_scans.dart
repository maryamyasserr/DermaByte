import 'package:dermabyte/Core/Widgets/err_widget.dart';
import 'package:dermabyte/Core/Widgets/failed_alert.dart';
import 'package:dermabyte/Core/Widgets/loading_indicator.dart';
import 'package:dermabyte/Core/utils/colors.dart';
import 'package:dermabyte/Core/utils/routes.dart';
import 'package:dermabyte/Features/Authentication/Presentation/View%20Model/Auth%20Cubit/auth_cubit.dart';
import 'package:dermabyte/Features/Profile/Presentaion/View/Widgets/History/history_card.dart';
import 'package:dermabyte/Features/Profile/Presentaion/View_Model/Cubits/Scan%20Cubit/scan_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

class PatientScans extends StatelessWidget {
  const PatientScans({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ScanCubit, ScanState>(builder: (context, state) {
      if (state is ScanSuccess) {
        return ListView.builder(
            itemCount: state.scans.length,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(bottom: 12, right: 10, left: 10),
                    child: HistoryCard(
                      logo: true,
                      imageCard: state.scans[index].diseasePhoto,
                      cardTitle: state.scans[index].diseaseName,
                      cardSubTitle:
                          "Scans taken on ${DateFormat.yMMMd().format(state.scans[index].scanDate)} at ${DateFormat.jm().format(state.scans[index].scanDate)}",
                      textButton: "View",
                      onPressed: () {
                        BlocProvider.of<ScanCubit>(context).setId =
                            state.scans[index].id!;
                        if (BlocProvider.of<ScanCubit>(context).currentScan ==
                            null) {
                          failedAlert(context, 'Something is wrong ,try later');
                        } else {
                          GoRouter.of(context).push(AppRoutes.kDisease);
                        }
                      },
                    ),
                  )
                ],
              );
            });
      } else if (state is ScanFailure) {
        return ErrWidget(
          onTap: () async {
            await BlocProvider.of<ScanCubit>(context).getPatientScan(
                token: BlocProvider.of<AuthCubit>(context).patient!.token);
          },
          errMessage: state.errMessage,
        );
      } else {
        return const LoadingIndicator(color: AppColors.kPrimaryColor);
      }
    });
  }
}
