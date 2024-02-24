import 'package:dermabyte/Core/utils/colors.dart';
import 'package:dermabyte/Core/utils/font_styels.dart';
import 'package:flutter/material.dart';

class CardButton extends StatelessWidget {
  const CardButton({super.key, required this.textButton, this.onPressed});

  final String textButton;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          maxHeight: 30
        ),
        child: AspectRatio(
          aspectRatio: 64 / 21,
          child: ElevatedButton(
              onPressed: onPressed,
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(0),
                backgroundColor: AppColors.kPrimaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: Text(
                textButton,
                style:
                    Styels.textStyle12_700(context).copyWith(color: Colors.white),
              )),
        ),
      ),
    );
  }
}
