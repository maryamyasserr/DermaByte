import 'package:dermabyte/Core/Widgets/snack_bar.dart';
import 'package:dermabyte/Core/utils/colors.dart';
import 'package:dermabyte/Core/utils/font_styels.dart';
import 'package:dermabyte/Features/Authentication/Presentation/View%20Model/Auth%20Cubit/auth_cubit.dart';
import 'package:dermabyte/Features/Doctor/Presentaion/View%20Model/My_Patinets_Reports/my_patient_report_cubit.dart';
import 'package:dermabyte/Features/Doctor/Presentaion/View%20Model/Request_Test/request_tests_cubit.dart';
import 'package:dermabyte/Features/Doctor/Presentaion/View/Widgets/Report/button.dart';
import 'package:dermabyte/Features/Profile/Data/Models/report_model/report_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddTestBody extends StatefulWidget {
  const AddTestBody({super.key});

  @override
  _AddTestBodyState createState() => _AddTestBodyState();
}

class _AddTestBodyState extends State<AddTestBody> {
  final List<TextEditingController> _controllers = [];

  @override
  void initState() {
    super.initState();
    _controllers.add(TextEditingController());
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  void _addTextField() {
    setState(() {
      _controllers.add(TextEditingController());
    });
  }

  List<Map<String, String>> generateTestsJson() {
    List<Map<String, String>> tests = _controllers.map((controller) {
      return {'testName': controller.text};
    }).toList();
    // String jsonTests = jsonEncode({'tests': tests});

    return tests;
  }

  @override
  Widget build(BuildContext context) {
    ReportModel report =
        BlocProvider.of<MyPatientReportCubit>(context).getPatientReport;
    return BlocConsumer<RequestTestsCubit, RequestTestsState>(
      listener: (context, state) {
        if (state is RequestTestsSuccess) {
          showSnackBar(context, "Done");
        } else if (state is RequestTestsFailure) {
          // showSnackBar(context, state.errMessage);
          print(state.errMessage);
        }
      },
      builder: (context, state) {
        return Material(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Stack(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                        flex: 2,
                        child: SizedBox(
                          child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                "Required tests",
                                style: Styels.textStyle24_600(context),
                              )),
                        )),
                    Expanded(
                      flex: 11,
                      child: ListView.builder(
                        itemCount: _controllers.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 8, horizontal: 4),
                            child: TextField(
                              controller: _controllers[index],
                              keyboardType: TextInputType.name,
                              textInputAction: TextInputAction.next,
                              decoration: InputDecoration(
                                  suffixIcon: IconButton(
                                    icon: const Icon(
                                      Icons.delete,
                                      color: AppColors.kPrimaryColor,
                                      size: 25,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        _controllers.removeAt(index);
                                      });
                                    },
                                  ),
                                  label: Text("Test Name ${index + 1}")),
                            ),
                          );
                        },
                      ),
                    ),
                    AddTestButton(
                      isLoading:
                          BlocProvider.of<RequestTestsCubit>(context).isLoading,
                      onPressed: () async {
                        List<Map<String, String>> tests = generateTestsJson();
                        await BlocProvider.of<RequestTestsCubit>(context)
                            .requestTests(
                                context: context,
                                id: report.id!,
                                body: {"tests": tests},
                                token: BlocProvider.of<AuthCubit>(context)
                                    .doctorModel!
                                    .token);
                      },
                    ),
                    const Expanded(flex: 2, child: SizedBox())
                  ],
                ),
                Positioned(
                  bottom: 20,
                  right: 6,
                  child: FloatingActionButton(
                    backgroundColor: AppColors.kPrimaryColor,
                    onPressed: _addTextField,
                    shape: const CircleBorder(),
                    child: const Icon(Icons.add, size: 35, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
