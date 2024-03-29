import 'package:dermabyte/Core/Widgets/custom_appbar.dart';
import 'package:dermabyte/Core/Widgets/snack_bar.dart';
import 'package:dermabyte/Core/utils/assets.dart';
import 'package:dermabyte/Core/utils/font_styels.dart';
import 'package:dermabyte/Features/Authentication/Data/Models/lab_model/lab_model.dart';
import 'package:dermabyte/Features/Authentication/Presentation/View%20Model/Auth%20Cubit/auth_cubit.dart';
import 'package:dermabyte/Features/E-lab/Presentation/View/Widgets/lab_service_item.dart';
import 'package:dermabyte/Features/E-lab/Presentation/View/Widgets/submit_button.dart';
import 'package:dermabyte/Features/E-lab/Presentation/View_model/Elab%20Cubit/elab_cubit.dart';
import 'package:dermabyte/Features/E-lab/Presentation/View_model/Lab%20Reservation%20Cubit/lab_reservaion_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LabReservationViewBody extends StatefulWidget {
  const LabReservationViewBody(
      {super.key, this.dayController, this.monthController, this.preferdTime});
  final TextEditingController? dayController, monthController, preferdTime;

  @override
  State<LabReservationViewBody> createState() => _LabReservationViewBodyState();
}

class _LabReservationViewBodyState extends State<LabReservationViewBody> {
  List<String> labTests = [];
  int? selectedIndex;
  Set<int> selectedIndices = {};
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    LabModel lab = BlocProvider.of<ELabCubit>(context).currentLab;
    return BlocConsumer<LabReservaionCubit, LabReservaionState>(
      listener: (context, state) {
        if (state is LabReservaionFailuer) {
          showSnackBar(context, state.errMessage);
        } else {
          showSnackBar(context, "Done");
        }
      },
      builder: (context, state) {
        return Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(Assets.kBackground),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const CustomAppBar(title: 'Reservation'),
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Text(
                      'Reserve your lab tests.',
                      style: Styels.textStyle15_300(context),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  const Divider(
                    color: Color.fromRGBO(0, 0, 0, 0.4),
                    endIndent: 5,
                    indent: 5,
                    thickness: 1,
                    height: 36,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Text(
                      'Pick a day to take your required tests.',
                      style: Styels.textStyle15_300(context),
                    ),
                  ),
                  SizedBox(height: mediaQuery.height * 0.02),
                  lab.services!.isEmpty
                      ? Expanded(
                          child: Center(
                              child: Text(
                          "No Services Provided From This lab",
                          style: Styels.textStyle20_300(context),
                        )))
                      : Expanded(
                          child: GridView.builder(
                            physics: const BouncingScrollPhysics(),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    mainAxisSpacing: 30,
                                    crossAxisSpacing: 15,
                                    childAspectRatio: 1),
                            itemCount: lab.services!.length,
                            itemBuilder: (context, index) {
                              bool isSelected = selectedIndices.contains(index);
                              return LabServiceItem(
                                  onTap: () {
                                    setState(() {
                                      if (isSelected) {
                                        selectedIndices.remove(index);
                                        labTests
                                            .remove(lab.services![index].id!);
                                      } else {
                                        selectedIndices.add(index);
                                        labTests.add(lab.services![index].id!);
                                      }

                                      print(labTests);
                                    });
                                  },
                                  selected: isSelected,
                                  testName: lab.services![index].name!,
                                  cost: lab.services![index].cost.toString());
                            },
                          ),
                        ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 15),
                    child: SubmitButton(
                        isLoading: BlocProvider.of<LabReservaionCubit>(context)
                            .isLoading,
                        horizontal: 0,
                        textButton: "Submit",
                        onPressed: () async {
                          await BlocProvider.of<LabReservaionCubit>(context)
                              .createReservation(
                                  body: {"test": labTests, "lab": lab.id},
                                  token: BlocProvider.of<AuthCubit>(context)
                                      .patient!
                                      .token);
                        }),
                  ),
                ]),
          ),
        );
      },
    );
  }
}
