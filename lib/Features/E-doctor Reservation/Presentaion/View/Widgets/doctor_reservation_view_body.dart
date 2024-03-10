import 'package:dermabyte/Core/Widgets/custom_appbar.dart';
import 'package:dermabyte/Core/Widgets/snack_bar.dart';
import 'package:dermabyte/Core/utils/assets.dart';
import 'package:dermabyte/Core/utils/font_styels.dart';
import 'package:dermabyte/Features/Authentication/Presentation/View%20Model/Auth%20Cubit/auth_cubit.dart';
import 'package:dermabyte/Features/E-doctor%20Reservation/Presentaion/View/Widgets/all_patient_scans.dart';
import 'package:dermabyte/Features/E-doctor%20Reservation/Presentaion/View/Widgets/attach_doctor_reservation.dart';
import 'package:dermabyte/Features/E-doctor%20Reservation/Presentaion/View/Widgets/doctor_reservaion_button.dart';
import 'package:dermabyte/Features/E-doctor%20Reservation/Presentaion/View_Model/Cubits/DoctorReservaion/doctor_reservation_cubit.dart';
import 'package:dermabyte/Features/E-lab/Presentation/View/Widgets/custom_text_field.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mime/mime.dart';

class DoctorReservationViewBody extends StatelessWidget {
  const DoctorReservationViewBody({
    super.key,
  });

  static String? imgPath;
  Future<void> uploadPicture(BuildContext context) async {
    final picker = ImagePicker();
    final XFile? pickedFile =
        await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      imgPath = pickedFile.path;
      print('Selected image path: ${imgPath!}');
    }
  }

  static String mimeType = lookupMimeType(imgPath!)!;

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return BlocConsumer<DoctorReservationCubit, DoctorReservationState>(
      listener: (context, state) {
        if (state is DoctorReservationFailure) {
          showSnackBar(context, state.errMessage);
          print(state.errMessage);
        } else if (state is DoctorReservationSuccess) {
          showSnackBar(context, "done");
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
            child: ListView(children: [
              const CustomAppBar(title: 'Reservation'),
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Text(
                  'Book a consultation with your\ndoctor.',
                  style: Styels.textStyle15_300(context),
                  textAlign: TextAlign.left,
                ),
              ),
              SizedBox(height: mediaQuery.height * 0.035),
              CustomTextField(
                  hintext: 'When did you start noticing skin changes?',
                  width: mediaQuery.height * 0.5,
                  isrequired: true,
                  padding: const EdgeInsets.only(right: 15),
                  keyboardType: TextInputType.name),
              const SizedBox(height: 8),
              Stack(children: [
                AttachDocotorReservaionField(
                    title: 'Add your scans',
                    isrequired: true,
                    padding: const EdgeInsets.only(right: 15, bottom: 10),
                    onTap: () {
                      showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return const AllPatientScans();
                          });
                    }),
              ]),
              const SizedBox(height: 36),
              AttachDocotorReservaionField(
                  isrequired: false,
                  title: "Add your lab tests",
                  onTap: () {
                    // uploadPicture(context);
                    print(
                        BlocProvider.of<AuthCubit>(context).patient?.token);
                  }),
              const SizedBox(height: 32),
              DoctorButton(
                  horizontal: 0,
                  textButton: "Confirm",
                  onPressed: () async {
                    await BlocProvider.of<DoctorReservationCubit>(context)
                        .createReservationAndPatientReport(
                            reservationData: FormData.fromMap({
                              "patient": BlocProvider.of<AuthCubit>(context)
                                  .patient!
                                  .patient
                                  .id,
                              "dermatologist":
                                  BlocProvider.of<DoctorReservationCubit>(
                                          context)
                                      .doctorId,
                              "scan": BlocProvider.of<DoctorReservationCubit>(
                                      context)
                                  .scanId,
                              "date": DateTime.now().toIso8601String(),
                              // "uploadedTest": await MultipartFile.fromFile(
                              //     imgPath!,
                              //     filename: imgPath!
                              //         .split('/')
                              //         .last, // Extracts the filename from the path
                              //     contentType: MediaType.parse(mimeType))
                            }),
                            reportData: {
                              "patient": BlocProvider.of<AuthCubit>(context)
                                  .patient!
                                  .patient
                                  .id,
                              "dermatologist":
                                  BlocProvider.of<DoctorReservationCubit>(
                                          context)
                                      .doctorId,
                              "scan": BlocProvider.of<DoctorReservationCubit>(
                                      context)
                                  .scanId,
                                
                            },
                            token: BlocProvider.of<AuthCubit>(context)
                                .patient!
                                .token);
                  },
                  isLoading: BlocProvider.of<DoctorReservationCubit>(context)
                      .isLoading)
            ]),
          ),
        );
      },
    );
  }
}
