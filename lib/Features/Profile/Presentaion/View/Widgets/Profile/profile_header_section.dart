import 'package:dermabyte/Core/utils/font_styels.dart';
import 'package:dermabyte/Core/Widgets/profile_photo.dart';
import 'package:dermabyte/Features/Authentication/Data/Models/patient.dart';
import 'package:dermabyte/Features/Authentication/Presentation/View%20Model/Auth%20Cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileHeaderSection extends StatelessWidget {
  const ProfileHeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    PatientModel patient = BlocProvider.of<AuthCubit>(context).patient!.patient;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            ProfilePhoto(
              radius: 40,
              photo: patient.profilePic,
            ),
            const SizedBox(
              width: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${patient.firstName} " "${patient.lastName}",
                  style: Styels.textStyle20_700(context),
                ),
                Text(
                  "patient",
                  style: Styels.textStyle14_300(context),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
