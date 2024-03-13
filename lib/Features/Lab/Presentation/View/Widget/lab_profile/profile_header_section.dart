import 'package:dermabyte/Core/utils/font_styels.dart';
import 'package:dermabyte/Features/Lab/Presentation/View/Widget/lab_profile/e_lab_photo.dart';
import 'package:flutter/material.dart';

class ElabProfileHeaderSection extends StatelessWidget {
  const ElabProfileHeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            const ElapPhoto(),
            const SizedBox(
              width: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Alpha Scan",
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
