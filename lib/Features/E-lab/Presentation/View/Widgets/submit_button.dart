import 'package:dermabyte/Core/Widgets/loading_indicator.dart';
import 'package:dermabyte/Core/utils/colors.dart';
import 'package:dermabyte/Core/utils/font_styels.dart';
import 'package:flutter/material.dart';

class SubmitButton extends StatelessWidget {
  const SubmitButton({
    super.key,
    required this.horizontal,
    required this.textButton,
    required this.onPressed,
    required this.isLoading,
  });
  final double horizontal;
  final String textButton;
  final bool isLoading;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(horizontal: horizontal, vertical: 10),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            backgroundColor: AppColors.kPrimaryColor),
        child: isLoading
            ? const LoadingIndicator(color: Colors.white)
            : Text(
                textButton,
                style: Styels.textStyle24_600(context)
                    .copyWith(fontSize: 20, color: Colors.white),
              ));
  }
}
