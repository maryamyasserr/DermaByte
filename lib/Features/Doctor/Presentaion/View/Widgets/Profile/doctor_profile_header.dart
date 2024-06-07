import 'package:dermabyte/Core/utils/font_styels.dart';
import 'package:dermabyte/Core/Widgets/profile_photo.dart';
import 'package:dermabyte/Features/Authentication/Data/Models/doctor_model.dart';
import 'package:dermabyte/Features/Authentication/Presentation/View%20Model/Auth%20Cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DoctorProfileHeader extends StatelessWidget {
  const DoctorProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    DoctorModel doctor =
        BlocProvider.of<AuthCubit>(context).doctorModel!.doctorModel;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            ProfilePhoto(
              radius: 35,
              photo: doctor.profilePic,
            ),
            const SizedBox(
              width: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${doctor.firstName} " "${doctor.lastName}",
                  style: Styels.textStyle20_700(context),
                ),
                Text(
                  "Doctor",
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
