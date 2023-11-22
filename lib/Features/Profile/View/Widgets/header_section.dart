import 'package:dermabyte/Core/utils/font_styels.dart';
import 'package:dermabyte/Features/Profile/View/Widgets/profile_photo.dart';
import 'package:flutter/material.dart';

class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
<<<<<<< HEAD
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            ProfilePhoto(),
            SizedBox(
              width: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Ahmed Mohamed",
                  style: Styels.textStyle20_700,
                ),
                Text(
                  "patient",
                  style: Styels.textStyle14_300,
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
=======
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
               Row(
                children: [
                  const ProfilePhoto(),
                  const SizedBox(
                    width: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Ahmed Mohamed",
                        style: Styels.textStyle20_700,
                      ),
                      Text(
                        "patient",
                        style: Styels.textStyle14_300,
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
>>>>>>> 19c63cb5047fbbb1e0b61c84f2f8a82c72177ea7
  }
}
