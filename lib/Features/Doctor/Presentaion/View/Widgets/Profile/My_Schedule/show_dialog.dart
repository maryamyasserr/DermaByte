import 'package:dermabyte/Core/utils/font_styels.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void showScheduleDialog(
    {required BuildContext context,
    required String title,
    required String hintText,
    required void Function() update}) {
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Center(
              child: Text(
            title,
            style: Styels.textStyle24_600(context),
          )),
          content: Form(
              child: TextFormField(
            decoration: InputDecoration(
                hintText: hintText, hintStyle: Styels.textStyle18_300(context)),
          )),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {
                    GoRouter.of(context).pop();
                  },
                  child: Text('Cancel', style: Styels.textStyle20_700(context)),
                ),
                TextButton(
                  onPressed: update,
                  child: Text('Done', style: Styels.textStyle20_700(context)),
                ),
              ],
            ),
          ],
        );
      });
}