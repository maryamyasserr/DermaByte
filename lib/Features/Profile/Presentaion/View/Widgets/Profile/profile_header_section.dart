import 'package:dermabyte/Core/utils/font_styels.dart';
import 'package:dermabyte/Core/utils/routes.dart';
import 'package:dermabyte/Core/Widgets/profile_photo.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProfileHeaderSection extends StatelessWidget {
  const ProfileHeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            const ProfilePhoto(
              radius: 40,
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
                  "patient",
                  style: Styels.textStyle14_300(context),
                ),
              ],
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(0),
          child: IconButton(
              onPressed: () {
                GoRouter.of(context).push(AppRoutes.kEditProfile);
              },
              icon: const Icon(
                Icons.edit_outlined,
                size: 30,
              )),
        )
      ],
    );
  }
}
