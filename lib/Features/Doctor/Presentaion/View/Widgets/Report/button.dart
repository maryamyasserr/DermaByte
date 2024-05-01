import 'package:dermabyte/Core/Widgets/loading_indicator.dart';
import 'package:dermabyte/Core/utils/colors.dart';
import 'package:dermabyte/Core/utils/font_styels.dart';
import 'package:flutter/material.dart';

class AddTestButton extends StatelessWidget {
  const AddTestButton({
    super.key,
    required this.onPressed,
    required this.isLoading,
    required this.text,
  });
  final void Function() onPressed;
  final bool isLoading;
  final String text;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.sizeOf(context).width * 0.3, vertical: 15),
        backgroundColor: AppColors.kPrimaryColor,
      ),
      onPressed: onPressed,
      child: isLoading
          ? const LoadingIndicator(color: Colors.white)
          : Text(
              text,
              style:
                  Styels.textStyle20_700(context).copyWith(color: Colors.white),
            ),
    );
  }
}
