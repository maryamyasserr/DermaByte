import 'package:dermabyte/Core/utils/font_styels.dart';
import 'package:dermabyte/Features/Profile/Data/Models/profile_item_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DoctorProfileItem extends StatelessWidget {
  const DoctorProfileItem({super.key, required this.profileItemModel});
  final ProfileItemModel profileItemModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 18),
      child: GestureDetector(
        onTap: () {
          GoRouter.of(context).push(profileItemModel.route);
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              profileItemModel.title,
              style: Styels.textStyle18_400(context),
            ),
            const Icon(Icons.arrow_forward_ios_outlined)
          ],
        ),
      ),
    );
  }
}
