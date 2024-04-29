import 'package:dermabyte/Core/utils/colors.dart';
import 'package:dermabyte/Core/utils/font_styels.dart';
import 'package:flutter/material.dart';

class ErrWidget extends StatelessWidget {
  const ErrWidget({super.key, required this.errMessage, this.onTap});
  final String errMessage;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // SvgPicture.asset(Assets.kErrorIcon),
          GestureDetector(
              onTap: onTap,
              child: const Icon(
                Icons.refresh,
                color: AppColors.kPrimaryColor,
                size: 70,
              )),
          const SizedBox(height: 9),
          Text(
            "$errMessage,Tap to retry",
            style: Styels.textStyle20_700(context),
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
