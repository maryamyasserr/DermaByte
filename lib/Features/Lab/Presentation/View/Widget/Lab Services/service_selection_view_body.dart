import 'package:dermabyte/Core/Widgets/err_widget.dart';
import 'package:dermabyte/Core/Widgets/loading_indicator.dart';
import 'package:dermabyte/Core/utils/assets.dart';
import 'package:dermabyte/Core/utils/colors.dart';
import 'package:dermabyte/Core/utils/font_styels.dart';
import 'package:dermabyte/Features/Authentication/Presentation/View%20Model/Auth%20Cubit/auth_cubit.dart';
import 'package:dermabyte/Features/Lab/Presentation/View/Widget/Lab%20Services/service_item.dart';
import 'package:dermabyte/Features/Lab/Presentation/View/Widget/Lab%20Services/sheet_body.dart';
import 'package:dermabyte/Features/Lab/Presentation/View/Widget/Lab%20Services/update_test_body.dart';
import 'package:dermabyte/Features/Lab/Presentation/View_Model/Get%20Lab%20Services/get_lab_services_cubit.dart';
import 'package:dermabyte/Features/Lab/Presentation/View_Model/Lab%20Helper/lab_helper_cubit.dart';
import 'package:dermabyte/Features/Lab/Presentation/View_Model/Lab%20Services/lab_services_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ServiceSelectionViewBody extends StatefulWidget {
  const ServiceSelectionViewBody({super.key});

  @override
  State<ServiceSelectionViewBody> createState() =>
      _ServiceSelectionViewBodyState();
}

class _ServiceSelectionViewBodyState extends State<ServiceSelectionViewBody> {
  @override
  void initState() {
    BlocProvider.of<GetLabServicesCubit>(context).getMyServices(
        token: BlocProvider.of<AuthCubit>(context).labModel!.token);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(Assets.kBackground),
          fit: BoxFit.fill,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            const SizedBox(height: 50),
            Center(
              child: Text(
                'Your Tests Services.',
                style: Styels.textStyle18_600(context).copyWith(fontSize: 24),
              ),
            ),
            const SizedBox(height: 24),
            BlocBuilder<GetLabServicesCubit, GetLabServicesState>(
              builder: (context, state) {
                if (state is GetLabServicesSuccess) {
                  if (state.services.isEmpty) {
                    return Expanded(
                        child: Center(
                            child: Text(
                      "No Services Yet",
                      style: Styels.textStyle24_600(context),
                    )));
                  } else {
                    return Expanded(
                      child: GridView.builder(
                        physics: const BouncingScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 30,
                                crossAxisSpacing: 15,
                                childAspectRatio: 1.1),
                        itemCount: state.services.length,
                        itemBuilder: (context, index) {
                          return ServiceItem(
                              deleteTest: () async {
                                BlocProvider.of<LabServiceCubit>(context)
                                    .deleteTest(
                                        token:
                                            BlocProvider.of<AuthCubit>(context)
                                                .labModel!
                                                .token,
                                        id: state.services[index].id!);
                                await BlocProvider.of<GetLabServicesCubit>(
                                        context)
                                    .getMyServices(
                                        token:
                                            BlocProvider.of<AuthCubit>(context)
                                                .labModel!
                                                .token);
                              },
                              updateTest: () async {
                                BlocProvider.of<LabHelperCubit>(context).test =
                                    state.services[index];
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return UpdateLabTest();
                                    });
                              },
                              testName: state.services[index].name ?? "",
                              cost: state.services[index].cost.toString());
                        },
                      ),
                    );
                  }
                } else if (state is GetLabServicesFailure) {
                  return Expanded(
                      child: Center(
                          child: ErrWidget(
                    errMessage: state.errMessage,
                    onTap: () {
                      BlocProvider.of<GetLabServicesCubit>(context)
                          .getMyServices(
                              token: BlocProvider.of<AuthCubit>(context)
                                  .labModel!
                                  .token);
                    },
                  )));
                } else {
                  return const Expanded(
                      child: Center(
                    child: LoadingIndicator(color: AppColors.kPrimaryColor),
                  ));
                }
              },
            ),
            const SizedBox(height: 16),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.kPrimaryColor,
                  padding: EdgeInsets.symmetric(
                      horizontal: mediaQuery.width * 0.19,
                      vertical: mediaQuery.height * 0.015),
                ),
                onPressed: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return const SheetBody();
                      });
                },
                child: Text(
                  "Add Your Services",
                  style: Styels.textStyle20_700(context)
                      .copyWith(color: Colors.white),
                )),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
