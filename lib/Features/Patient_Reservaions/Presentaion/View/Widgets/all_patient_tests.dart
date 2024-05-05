import 'package:dermabyte/Core/Widgets/loading_indicator.dart';
import 'package:dermabyte/Core/utils/assets.dart';
import 'package:dermabyte/Core/utils/colors.dart';
import 'package:dermabyte/Core/utils/font_styels.dart';
import 'package:dermabyte/Features/Authentication/Presentation/View%20Model/Auth%20Cubit/auth_cubit.dart';
import 'package:dermabyte/Features/Patient_Reservaions/Presentaion/View/Widgets/selected_tests.dart';
import 'package:dermabyte/Features/Patient_Reservaions/Presentaion/View_Model/Add_Test_Result_Cubit/add_test_result_cubit.dart';
import 'package:dermabyte/Features/Profile/Presentaion/View_Model/Cubits/Tests%20Cubit/tests_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AllPatientTest extends StatefulWidget {
  const AllPatientTest({
    super.key,
  });

  @override
  State<AllPatientTest> createState() => _AllPatientScansState();
}

class _AllPatientScansState extends State<AllPatientTest> {
  @override
  void initState() {
    BlocProvider.of<TestsCubit>(context).getPatientTests(
        token: BlocProvider.of<AuthCubit>(context).patient!.token);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<int> indices = BlocProvider.of<AddTestResultCubit>(context).indices;
    List<String> ids = BlocProvider.of<AddTestResultCubit>(context).testsids;
    List<String> tests = BlocProvider.of<AddTestResultCubit>(context).tests;
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Your Tests",
                          style: Styels.textStyle20_700(context)),
                    ),
                    GestureDetector(
                      onTap: () {
                        GoRouter.of(context).pop();
                      },
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Icon(Icons.done, size: 30, color: Colors.green),
                            Text(
                              'Confirm',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Expanded(
                    child: ListView.builder(
                        itemCount: state.tests.length,
                        itemBuilder: (context, index) {
                          bool isSelectd = indices.contains(index);
                          return Column(
                            children: [
                              SelectedTests(
                                selected: isSelectd,
                                aspectRatio: 330 / 100,
                                imageCard: state.tests[index].lab.profilePic,
                                title: state.tests[index].testName!,
                                subTitle:
                                    "test Wan taken on ${state.tests[index].testDate!.day}/${state.tests[index].testDate!.month}/${state.tests[index].testDate!.year}",
                                onPressed: () {
                                  setState(() {
                                    if (isSelectd) {
                                      indices.remove(index);
                                      ids.remove(state.tests[index].id);
                                      tests.remove(state.tests[index].testName);
                                      print(indices);
                                    } else {
                                      indices.add(index);
                                      ids.add(state.tests[index].id!);
                                      tests.add(state.tests[index].testName!);
                                      print(indices);
                                    }
                                  });
                                  BlocProvider.of<AddTestResultCubit>(context)
                                      .selectTest(ids, tests);
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
              Text(
                state.errMessage,
                style: Styels.textStyle20_300(context)
                    .copyWith(fontWeight: FontWeight.w600),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
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

// import 'package:dermabyte/Core/Widgets/err_widget.dart';
// import 'package:dermabyte/Core/Widgets/loading_indicator.dart';
// import 'package:dermabyte/Core/utils/assets.dart';
// import 'package:dermabyte/Core/utils/colors.dart';
// import 'package:dermabyte/Core/utils/font_styels.dart';
// import 'package:dermabyte/Features/Authentication/Presentation/View%20Model/Auth%20Cubit/auth_cubit.dart';
// import 'package:dermabyte/Features/Patient_Reservaions/Presentaion/View/Widgets/selected_tests.dart';
// import 'package:dermabyte/Features/Profile/Presentaion/View_Model/Cubits/Tests%20Cubit/tests_cubit.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class AllPatientTest extends StatelessWidget {
//   const AllPatientTest({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<TestsCubit, TestsState>(builder: (context, state) {
//       if (state is TestsSuccess) {
//         return Container(
//           decoration: const BoxDecoration(
//               image: DecorationImage(
//                   image: AssetImage(Assets.kBackground), fit: BoxFit.fill)),
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Text("Your Lab Tests",
//                       style: Styels.textStyle20_700(context)),
//                 ),
//                 const SizedBox(height: 12),
//                 Expanded(
//                     child: ListView.builder(
//                         itemCount: state.tests.length,
//                         itemBuilder: (context, index) {
//                           return Column(
//                             children: [
//                               SelectedTests(
//                                 imageCard: state.tests[index].lab.profilePic,
//                                 title: state.tests[index].testName ?? "",
//                                 subTitle:
//                                     "the test was taken on ${state.tests[index].testDate?.day ?? "29"}/${state.tests[index].testDate?.month ?? "5"}/${state.tests[index].testDate?.year ?? "2022"}",
//                                 selected: false,
//                                 onPressed: () {
//                                   BlocProvider.of<TestsCubit>(context).testId =
//                                       state.tests[index].id;
//                                 },
//                               ),
//                               const SizedBox(
//                                 height: 12,
//                               )
//                             ],
//                           );
//                         })),
//               ],
//             ),
//           ),
//         );
//       } else if (state is TestsFailure) {
//         return Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               ErrWidget(errMessage: state.errMessage),
//               const SizedBox(height: 16),
//               ElevatedButton(
//                   onPressed: () {
//                     BlocProvider.of<TestsCubit>(context).getPatientTests(
//                         token:
//                             BlocProvider.of<AuthCubit>(context).patient!.token);
//                   },
//                   child: Text(
//                     "Refresh",
//                     style: Styels.textStyle20_700(context),
//                   ))
//             ],
//           ),
//         );
//       } else {
//         return const LoadingIndicator(color: AppColors.kPrimaryColor);
//       }
//     });
//   }
// }
