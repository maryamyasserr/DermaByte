import 'package:dermabyte/Core/utils/font_styels.dart';
import 'package:dermabyte/Features/Authentication/Data/Models/lab_model/lab_model.dart';
import 'package:dermabyte/Features/Authentication/Presentation/View%20Model/Auth%20Cubit/auth_cubit.dart';
import 'package:dermabyte/Features/Lab/Presentation/View/Widget/lab_profile/e_lab_photo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ElabProfileHeaderSection extends StatelessWidget {
  const ElabProfileHeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    LabModel lab= BlocProvider.of<AuthCubit>(context).labModel!.lab;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
             ElapPhoto(
              photo: lab.profilePic,
            ),
            const SizedBox(
              width: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${lab.firstName}",
                  style: Styels.textStyle20_700(context),
                ),
                Text(
                  "Laboratory",
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
