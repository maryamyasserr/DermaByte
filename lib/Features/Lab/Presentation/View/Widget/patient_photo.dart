import 'package:dermabyte/Core/utils/assets.dart';
import 'package:dermabyte/Core/utils/colors.dart';
import 'package:dermabyte/Features/Lab/Data/Models/lab_reservations/lab_reservations.dart';
import 'package:dermabyte/Features/Lab/Presentation/View_Model/Lab%20Reservaions%20Cubit/lab_reservations_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class PatientPhoto extends StatelessWidget {
  const PatientPhoto({super.key, required this.radius});
  final double radius;

  @override
  @override
  Widget build(BuildContext context) {
    LabReservations reservation =
        BlocProvider.of<LabReservationsCubit>(context).currentReservation!;
    return Container(
        padding: const EdgeInsets.all(2),
        decoration: const BoxDecoration(
            color: AppColors.kPrimaryColor, shape: BoxShape.circle),
        child: reservation.patient!.profilePic != null
            ? CircleAvatar(
                radius: 60,
                child: CircleAvatar(
                    radius: 60,
                    backgroundImage:
                        NetworkImage(reservation.patient!.profilePic!)),
              )
            : CircleAvatar(
                backgroundColor: const Color(0xffB9EEE8),
                radius: radius,
                child: SvgPicture.asset(Assets.kProfileAvatar)));
  }
}
