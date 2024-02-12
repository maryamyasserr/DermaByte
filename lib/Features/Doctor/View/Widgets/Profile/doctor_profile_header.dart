import 'package:dermabyte/Core/utils/font_styels.dart';
import 'package:dermabyte/Core/Widgets/profile_photo.dart';
import 'package:flutter/material.dart';

class DoctorProfileHeader extends StatelessWidget {
  const DoctorProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            const ProfilePhoto(
              radius: 35,
            ),
            const SizedBox(
              width: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Ahmed Mohamed",
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
        Padding(
          padding: const EdgeInsets.all(0),
          child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.edit_outlined,
                size: 30,
              )),
        )
      ],
    );
  }
}
