import 'package:dermabyte/Core/utils/colors.dart';
import 'package:dermabyte/Core/utils/font_styels.dart';
import 'package:dermabyte/Features/Patient_Reservaions/Data/Models/preservation_model/preservation_model.dart';
import 'package:flutter/material.dart';

class UpcomingButton extends StatelessWidget {
  const UpcomingButton({
    super.key,
    required this.reservation,
    required this.text,
    required this.onPressed,
    required this.isLoading,
  });

  final PreservationModel reservation;
  final String text;
  final void Function() onPressed;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.35,
          vertical: 12,
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        backgroundColor: AppColors.kPrimaryColor,
      ),
      child: isLoading
          ? const Padding(
              padding: EdgeInsets.symmetric(horizontal: 28),
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
            )
          : Text(
              text,
              style:
                  Styels.textStyle20_700(context).copyWith(color: Colors.white),
            ),
    );
  }
}
