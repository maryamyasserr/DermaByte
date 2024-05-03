import 'package:dermabyte/Core/Widgets/snack_bar.dart';
import 'package:dermabyte/Core/utils/assets.dart';
import 'package:dermabyte/Core/utils/colors.dart';
import 'package:dermabyte/Core/utils/font_styels.dart';
import 'package:dermabyte/Features/Authentication/Presentation/View%20Model/Auth%20Cubit/auth_cubit.dart';
import 'package:dermabyte/Features/Doctor/Presentaion/View%20Model/My_Patinets_Reports/my_patient_report_cubit.dart';
import 'package:dermabyte/Features/Doctor/Presentaion/View%20Model/Update_Report/update_report_cubit.dart';
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
    ReportModel? report =
        BlocProvider.of<MyPatientReportCubit>(context).getPatientReport;
    return BlocConsumer<UpdateReportCubit, UpdateReportState>(
      listener: (context, state) {
        if (state is UpdatePatientReportStateSuccess) {
          showSnackBar(context, "Done");
        } else if (state is UpdatePatientReportStateFailure) {
          // showSnackBar(context, state.errMessage);
          print(state.errMessage);
        }
      },
      builder: (context, state) {
        final formKey = GlobalKey<FormState>();
        return Material(
          child: Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(Assets.kBackground), fit: BoxFit.fill)),
            child: Padding(
              padding: const EdgeInsets.only(right: 16, left: 16, top: 16),
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                        flex: 2,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              child: Text(
                                "Required tests",
                                style: Styels.textStyle24_600(context),
                              ),
                            ),
                            IconButton(
                                onPressed: _addTextField,
                                icon: const Icon(
                                  Icons.add_circle,
                                  size: 30,
                                  color: AppColors.kPrimaryColor,
                                )),
                          ],
                        )),
                    const SizedBox(height: 15),
                    Expanded(
                      flex: 11,
                      child: ListView.builder(
                        itemCount: _controllers.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 8, horizontal: 4),
                            child: TextFormField(
                              controller: _controllers[index],
                              validator: (testName) {
                                if (testName == null || testName.isEmpty) {
                                  return "Add Test Name";
                                } else {
                                  return null;
                                }
                              },
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
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
                      text: 'Confirm',
                      isLoading:
                          BlocProvider.of<UpdateReportCubit>(context).isLoading,
                      onPressed: () async {
                        if (formKey.currentState!.validate()) {
                          List<Map<String, String>> tests = generateTestsJson();
                          await BlocProvider.of<UpdateReportCubit>(context)
                              .updateReport(
                                  context: context,
                                  id: report!.id!,
                                  body: {"tests": tests},
                                  token: BlocProvider.of<AuthCubit>(context)
                                      .doctorModel!
                                      .token);
                          // await BlocProvider.of<MyPatientReportCubit>(context)
                          //     .getMyPatientsReport(
                          //         token: BlocProvider.of<AuthCubit>(context)
                          //             .doctorModel!
                          //             .token);
                        }
                      },
                    ),
                    const Expanded(flex: 1, child: SizedBox())
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
