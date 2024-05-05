import 'package:dermabyte/Core/utils/assets.dart';
import 'package:dermabyte/Core/utils/colors.dart';
import 'package:dermabyte/Core/utils/font_styels.dart';
import 'package:dermabyte/Features/Patient_Reservaions/Presentaion/View/Widgets/all_patient_tests.dart';
import 'package:dermabyte/Features/Patient_Reservaions/Presentaion/View_Model/Preservation_Cubit/preservation_info_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class AddTestResultField extends StatelessWidget {
  const AddTestResultField({
    super.key,
    this.width,
    this.padding,
    required this.isrequired,
    this.controller,
  });

  final double? width;
  final EdgeInsetsGeometry? padding;
  final bool isrequired;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PreservationInfoCubit, PreservationInfoState>(
        builder: (context, state) {
      if (state is SelecttestSuccess) {
        if (state.tests.isEmpty) {
          return Column(children: [
            isrequired
                ? Padding(
                    padding: padding!,
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: SvgPicture.asset(Assets.kRequiredIcon),
                    ),
                  )
                : const SizedBox(
                    width: 0,
                    height: 0,
                  ),
            GestureDetector(
              onTap: () {
                showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return const AllPatientTest();
                    });
              },
              child: Container(
                width: MediaQuery.of(context).size.width * 0.95,
                height: MediaQuery.of(context).size.height * 0.075,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: AppColors.kCardColor,
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.grey,
                        offset: Offset(0.0, 2.6),
                        blurRadius: 6.0,
                      )
                    ]),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Add Your Tests Results",
                        style: Styels.textStyle20_300(context),
                      ),
                      const Icon(
                        Icons.add,
                        size: 35,
                      )
                    ],
                  ),
                ),
              ),
            )
          ]);
        } else {
          return Column(
            children: [
              ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: state.tests[0].length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.95,
                        height: MediaQuery.of(context).size.height * 0.075,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: AppColors.kCardColor,
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.grey,
                                offset: Offset(0.0, 2.6),
                                blurRadius: 6.0,
                              )
                            ]),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  const SizedBox(width: 10),
                                  SizedBox(
                                    width:
                                        MediaQuery.sizeOf(context).width * 0.7,
                                    child: Text(
                                      state.tests[0][index],
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                      style: Styels.textStyle20_300(context)
                                          .copyWith(
                                              fontSize: 22,
                                              fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                ],
                              ),
                              GestureDetector(
                                onTap: () {
                                  BlocProvider.of<PreservationInfoCubit>(
                                          context)
                                      .deleteTest(state.tests[0][index],
                                          state.tests[1][index],index);
                                  print(BlocProvider.of<PreservationInfoCubit>(
                                          context)
                                      .indices);
                                },
                                child: const Icon(
                                  Icons.cancel,
                                  color: Colors.red,
                                  size: 27,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
              GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return const AllPatientTest();
                      });
                },
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.95,
                  height: MediaQuery.of(context).size.height * 0.075,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: AppColors.kCardColor,
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.grey,
                          offset: Offset(0.0, 2.6),
                          blurRadius: 6.0,
                        )
                      ]),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Attach Addtional tests",
                          style: Styels.textStyle20_300(context),
                        ),
                        const Icon(
                          Icons.add,
                          size: 35,
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          );
        }
      } else {
        return Column(children: [
          isrequired
              ? Padding(
                  padding: padding!,
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: SvgPicture.asset(Assets.kRequiredIcon),
                  ),
                )
              : const SizedBox(
                  width: 0,
                  height: 0,
                ),
          GestureDetector(
            onTap: () {
              showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return const AllPatientTest();
                  });
            },
            child: Container(
              width: MediaQuery.of(context).size.width * 0.95,
              height: MediaQuery.of(context).size.height * 0.075,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: AppColors.kCardColor,
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(0.0, 2.6),
                      blurRadius: 6.0,
                    )
                  ]),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Add Your Tests",
                      style: Styels.textStyle20_300(context),
                    ),
                    const Icon(
                      Icons.add,
                      size: 35,
                    )
                  ],
                ),
              ),
            ),
          )
        ]);
      }
    });
  }
}
