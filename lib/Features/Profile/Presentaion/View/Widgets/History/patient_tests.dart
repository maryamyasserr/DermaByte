import 'package:dermabyte/Core/Widgets/err_widget.dart';
import 'package:dermabyte/Core/Widgets/failed_alert.dart';
import 'package:dermabyte/Core/Widgets/loading_indicator.dart';

import 'package:dermabyte/Core/utils/colors.dart';
import 'package:dermabyte/Core/utils/routes.dart';
import 'package:dermabyte/Features/Authentication/Presentation/View%20Model/Auth%20Cubit/auth_cubit.dart';
import 'package:dermabyte/Features/Profile/Presentaion/View/Widgets/History/history_card.dart';
import 'package:dermabyte/Features/Profile/Presentaion/View_Model/Cubits/Tests%20Cubit/tests_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

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
                        logo: false,
                        imageCard: state.tests[index].lab.profilePic,
                        cardTitle: state.tests[index].testName!,
                        cardSubTitle:
                            "The test was done on ${DateFormat.yMMMd().format(state.tests[index].testDate!)} at the ${state.tests[index].lab.name}",
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
          return ErrWidget(
            onTap: ()async{
                   await  BlocProvider.of<TestsCubit>(context).getPatientTests(
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
