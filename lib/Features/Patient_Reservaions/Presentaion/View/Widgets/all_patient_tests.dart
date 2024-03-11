import 'package:dermabyte/Core/Widgets/err_widget.dart';
import 'package:dermabyte/Core/Widgets/loading_indicator.dart';
import 'package:dermabyte/Core/utils/assets.dart';
import 'package:dermabyte/Core/utils/colors.dart';
import 'package:dermabyte/Core/utils/font_styels.dart';
import 'package:dermabyte/Features/Authentication/Presentation/View%20Model/Auth%20Cubit/auth_cubit.dart';
import 'package:dermabyte/Features/Patient_Reservaions/Presentaion/View/Widgets/custom_card.dart';
import 'package:dermabyte/Features/Profile/Presentaion/View_Model/Cubits/Tests%20Cubit/tests_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AllPatientTest extends StatelessWidget {
  const AllPatientTest({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TestsCubit, TestsState>(builder: (context, state) {
      if (state is TestsSuccess) {
        return Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(Assets.kBackground), fit: BoxFit.fill)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Your Lab Tests",
                      style: Styels.textStyle20_700(context)),
                ),
                const SizedBox(height: 12),
                Expanded(
                    child: ListView.builder(
                        itemCount: state.tests.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              CustomCard(
                                iconCard: Assets.kAlphaScan,
                                cardTitle: state.tests[index].testName!,
                                cardSubTitle:
                                    "Scans taken on ${state.tests[index].testDate?.day ?? "29"}/${state.tests[index].testDate?.month ?? "5"}/${state.tests[index].testDate?.year ?? "2022"}",
                                textButton: "Select",
                                onPressed: () {
                                  BlocProvider.of<TestsCubit>(context).testId =
                                      state.tests[index].id!;
                                  GoRouter.of(context).pop();
                                },
                              ),
                              const SizedBox(
                                height: 12,
                              )
                            ],
                          );
                        })),
              ],
            ),
          ),
        );
      } else if (state is TestsFailure) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ErrWidget(errMessage: state.errMessage),
              const SizedBox(height: 16),
              ElevatedButton(
                  onPressed: () {
                    BlocProvider.of<TestsCubit>(context).getPatientTests(
                        token:
                            BlocProvider.of<AuthCubit>(context).patient!.token);
                  },
                  child: Text(
                    "Refresh",
                    style: Styels.textStyle20_700(context),
                  ))
            ],
          ),
        );
      } else {
        return const LoadingIndicator(color: AppColors.kPrimaryColor);
      }
    });
  }
}
