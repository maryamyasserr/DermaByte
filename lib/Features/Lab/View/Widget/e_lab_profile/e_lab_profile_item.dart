import 'package:dermabyte/Core/utils/font_styels.dart';
import 'package:flutter/material.dart';

class ElabProfileItem extends StatelessWidget {
  const ElabProfileItem({super.key, required this.item, required this.onTap});

  final String item;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 14),
      child: GestureDetector(
        onTap: onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
             Text(
               item,
               style: Styels.textStyle18_400,
             ),
            const Icon(Icons.arrow_forward_ios_outlined)
          ],
        ),
      ),
    );
  }
}
