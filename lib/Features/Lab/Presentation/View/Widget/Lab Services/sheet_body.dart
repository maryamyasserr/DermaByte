import 'package:dermabyte/Core/Widgets/done_alert.dart';
import 'package:dermabyte/Core/Widgets/failed_alert.dart';
import 'package:dermabyte/Core/Widgets/loading_indicator.dart';
import 'package:dermabyte/Core/utils/assets.dart';
import 'package:dermabyte/Core/utils/colors.dart';
import 'package:dermabyte/Core/utils/font_styels.dart';
import 'package:dermabyte/Features/Authentication/Presentation/View%20Model/Auth%20Cubit/auth_cubit.dart';
import 'package:dermabyte/Features/Lab/Presentation/View_Model/Add%20Lab%20Services/add_lab_services_cubit.dart';
import 'package:dermabyte/Features/Lab/Presentation/View_Model/Get%20Lab%20Services/get_lab_services_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SheetBody extends StatelessWidget {
  const SheetBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final TextEditingController testName = TextEditingController();
    final TextEditingController cost = TextEditingController();
    final formKey = GlobalKey<FormState>();
    return BlocConsumer<AddServiceCubit, AddServiceState>(
      listener: (context, state) {
        if (state is AddServiceFailure) {
          failedAlert(context, state.errMessage);
        } else if (state is AddServiceSuccess) {
          showDoneAlert(context);
        }
      },
      builder: (context, state) {
        return Material(
          child: Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(Assets.kBackground), fit: BoxFit.fill)),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextFormField(
                      controller: testName,
                      validator: (testName) {
                        if (testName == null || testName.isEmpty) {
                          return "Test Name is required";
                        } else {
                          return null;
                        }
                      },
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      keyboardType: TextInputType.name,
                      textInputAction: TextInputAction.next,
                      decoration:
                          const InputDecoration(label: Text("Test Name")),
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: cost,
                      validator: (cost) {
                        if (cost == null || cost.isEmpty) {
                          return "Cost is required";
                        } else {
                          return null;
                        }
                      },
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.next,
                      decoration: const InputDecoration(label: Text("Cost")),
                    ),
                    const SizedBox(height: 42),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 50, vertical: 10),
                            backgroundColor: AppColors.kPrimaryColor),
                        onPressed: () async {
                          if (formKey.currentState!.validate()) {
                            await BlocProvider.of<AddServiceCubit>(context)
                                .addService(
                                    context: context,
                                    token: BlocProvider.of<AuthCubit>(context)
                                        .labModel!
                                        .token,
                                    body: {
                                  "name": "${testName.text} test",
                                  "cost": cost.text
                                });
                            await BlocProvider.of<GetLabServicesCubit>(context)
                                .getMyServices(
                                    token: BlocProvider.of<AuthCubit>(context)
                                        .labModel!
                                        .token);
                            testName.clear();
                            cost.clear();
                          }
                        },
                        child:
                            BlocProvider.of<AddServiceCubit>(context).isLoading
                                ? const LoadingIndicator(color: Colors.white)
                                : Text(
                                    "Add",
                                    style: Styels.textStyle20_700(context)
                                        .copyWith(color: Colors.white),
                                  ))
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
