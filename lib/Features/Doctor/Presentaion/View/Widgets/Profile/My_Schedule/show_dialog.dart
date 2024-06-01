import 'package:dermabyte/Core/utils/font_styels.dart';
import 'package:dermabyte/Features/Doctor/Presentaion/View/Widgets/Set%20Schedule/timing.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void showScheduleDialog(
    {required BuildContext context,
    required String title,
    required String hintText,
    required String time,
    required String? Function(String?)? validator,
    onChange,
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
          content: Stack(
            children: [
              Form(
                  child: TextFormField(
                validator: validator,
                decoration: InputDecoration(
                    hintText: hintText,
                    hintStyle: Styels.textStyle18_300(context)),
              )),
              Timing(onChanged: (value){}, title: time)
            ],
          ),
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
