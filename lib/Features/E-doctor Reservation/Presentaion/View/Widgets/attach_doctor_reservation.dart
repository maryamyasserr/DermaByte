import 'package:dermabyte/Core/utils/assets.dart';
import 'package:dermabyte/Core/utils/colors.dart';
import 'package:dermabyte/Core/utils/font_styels.dart';
import 'package:dermabyte/Features/E-doctor%20Reservation/Presentaion/View/Widgets/all_patient_scans.dart';
import 'package:dermabyte/Features/E-doctor%20Reservation/Presentaion/View_Model/DoctorReservaion/doctor_reservation_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class AttachDocotorReservaionField extends StatelessWidget {
  const AttachDocotorReservaionField({
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
    return BlocBuilder<DoctorReservationCubit, DoctorReservationState>(
        builder: (context, state) {
      if (state is SelectScanSuccess) {
        return Column(children: [
          const SizedBox(height: 18),
          Container(
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
                      Text(
                        BlocProvider.of<DoctorReservationCubit>(context)
                            .scanName!,
                        style: Styels.textStyle20_300(context).copyWith(
                            fontSize: 22, fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(width: 6),
                      const Icon(
                        Icons.file_download_done_sharp,
                        size: 27,
                        color: Color.fromARGB(255, 51, 144, 54),
                      )
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      BlocProvider.of<DoctorReservationCubit>(context)
                          .deleteScan();
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
          )
        ]);
      } else {
        return Column(
          children: [
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
                    return const AllPatientScans();
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
                      "Add Your Scan",
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
