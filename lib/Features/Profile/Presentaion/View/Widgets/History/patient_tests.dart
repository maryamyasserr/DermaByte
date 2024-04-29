import 'package:dermabyte/Core/Widgets/err_widget.dart';
import 'package:dermabyte/Core/Widgets/failed_alert.dart';
import 'package:dermabyte/Core/Widgets/loading_indicator.dart';
import 'package:dermabyte/Core/utils/assets.dart';
import 'package:dermabyte/Core/utils/colors.dart';
import 'package:dermabyte/Core/utils/routes.dart';
import 'package:dermabyte/Features/Profile/Presentaion/View/Widgets/History/history_card.dart';
import 'package:dermabyte/Features/Profile/Presentaion/View_Model/Cubits/Tests%20Cubit/tests_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class PatientTests extends StatelessWidget {
  const PatientTests({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TestsCubit, TestsState>(
      builder: (context, state) {
        if (state is TestsSuccess) {
          return ListView.builder(
              itemCount: state.tests.length,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: HistoryCard(
                        iconCard: Assets.kDoctorAvatar,
                        cardTitle: state.tests[index].testName![0]!,
                        cardSubTitle:
                            "Scans taken on ${state.tests[index].testDate}",
                        textButton: "View",
                        onPressed: () {
                          BlocProvider.of<TestsCubit>(context).setId =
                              state.tests[index].id!;
                          if (BlocProvider.of<TestsCubit>(context)
                                  .currentTest ==
                              null) {
                            failedAlert(
                                context, "Something is Wrong,try later");
                          } else {
                            GoRouter.of(context).push(AppRoutes.kTestView);
                          }
                        },
                      ),
                    )
                  ],
                );
              });
        } else if (state is TestsFailure) {
          return ErrWidget(errMessage: state.errMessage);
        } else {
          return const LoadingIndicator(color: AppColors.kPrimaryColor);
        }
      },
    );
  }
}
