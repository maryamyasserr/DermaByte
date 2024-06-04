import 'package:dermabyte/Core/utils/font_styels.dart';
import 'package:dermabyte/Features/Profile/Data/Models/profile_item_model.dart';
import 'package:flutter/material.dart';

class ElabProfileItem extends StatelessWidget {
  const ElabProfileItem(
      {super.key, required this.profileItemModel, required this.onTap});

  final ProfileItemModel profileItemModel;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: GestureDetector(
        onTap: onTap,
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
