import 'package:dermabyte/Core/Widgets/loading_indicator.dart';
import 'package:dermabyte/Core/Widgets/snack_bar.dart';
import 'package:dermabyte/Core/utils/assets.dart';
import 'package:dermabyte/Core/utils/colors.dart';
import 'package:dermabyte/Core/utils/font_styels.dart';
import 'package:dermabyte/Core/utils/service_locator.dart';
import 'package:dermabyte/Features/Authentication/Presentation/View%20Model/Auth%20Cubit/auth_cubit.dart';
import 'package:dermabyte/Features/Lab/Data/Models/lab_reservations/lab_reservations.dart';
import 'package:dermabyte/Features/Lab/Data/Repos/lab_repo_impl.dart';
import 'package:dermabyte/Features/Lab/Presentation/View/Widget/Home/file_upload.dart';
import 'package:dermabyte/Features/Lab/Presentation/View/Widget/Home/patient_info.dart';
import 'package:dermabyte/Features/Lab/Presentation/View/Widget/Home/patient_requested_tests.dart';
import 'package:dermabyte/Features/Lab/Presentation/View/Widget/patient_photo.dart';
import 'package:dermabyte/Features/Lab/Presentation/View_Model/Attach%20Result/attach_result_cubit.dart';
import 'package:dermabyte/Features/Lab/Presentation/View_Model/Lab%20Helper/lab_helper_cubit.dart';
import 'package:dermabyte/Features/Lab/Presentation/View_Model/Lab%20Reservaions%20Cubit/lab_reservations_cubit.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RequestBody extends StatelessWidget {
  const RequestBody({super.key});

  @override
  Widget build(BuildContext context) {
    LabReservations reservation =
        BlocProvider.of<LabReservationsCubit>(context).currentReservation;
    return BlocProvider(
      create: (context) => AttachResultCubit(getIt.get<LabRepoImpl>()),
      child: SafeArea(
        child: Scaffold(
          body: Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(Assets.kBackground), fit: BoxFit.cover)),
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.03),
              child: ListView(
                children: [
                  const SizedBox(height: 50),
                  const PatientPhoto(radius: 50),
                  const SizedBox(height: 30),
                  PatientInfo(
                      info: 'Name :',
                      data:
                          "${reservation.patient!.firstName!} ${reservation.patient!.lastName!}"),
                  const PatientInfo(info: 'Age :', data: "21"),
                  const PatientInfo(info: 'Gender :', data: " Male"),
                  const PatientInfo(info: 'Date :', data: " 29/5/2022"),
                  const SizedBox(height: 16),
                  const Divider(
                    thickness: 0.3,
                    color: Colors.black,
                  ),
                  const SizedBox(height: 16),
                  reservation.test!.isEmpty
                      ? const SizedBox()
                      : const PatientTestRequestedLab(),
                  const SizedBox(height: 50),
                  const FileUpload(),
                  const SizedBox(height: 80),
                  BlocConsumer<AttachResultCubit, AttachResultState>(
                    listener: (context, state) {
                      if (state is AttachResultSuccess) {
                        showSnackBar(context, "Done");
                      } else if (state is AttachResultFailure) {
                        showSnackBar(context, "Error");
                        print(state.errMessage);
                      }
                    },
                    builder: (context, state) {
                      return AttachButton(
                        isLoading: BlocProvider.of<AttachResultCubit>(context)
                            .isLoading,
                        onPressed: () async {
                          // print(
                          //   BlocProvider.of<LabHelperCubit>(context)
                          //       .allTest(reservation.test!),

                          // );
                          await BlocProvider.of<AttachResultCubit>(context)
                              .attachResult(
                                  context: context,
                                  token: BlocProvider.of<AuthCubit>(context)
                                      .labModel!
                                      .token,
                                  body: FormData.fromMap({
                                    "testName":
                                        BlocProvider.of<LabHelperCubit>(context)
                                            .allTest(reservation.test!),
                                    "testResult":
                                        BlocProvider.of<LabHelperCubit>(context)
                                            .files,
                                    "patient": reservation.patient!.id
                                  }));
                        },
                      );
                    },
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class AttachButton extends StatelessWidget {
  const AttachButton({
    super.key,
    required this.onPressed,
    required this.isLoading,
  });
  final void Function() onPressed;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          backgroundColor: AppColors.kPrimaryColor,
          padding: const EdgeInsets.symmetric(
            vertical: 15,
          )),
      child: isLoading
          ? const LoadingIndicator(color: Colors.white)
          : Text(
              "Save",
              style: Styels.textStyle18_600(context)
                  .copyWith(fontWeight: FontWeight.w700, color: Colors.white),
            ),
    );
  }
}
