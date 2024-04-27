import 'package:dermabyte/Core/utils/font_styels.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

failedAlert(BuildContext context, String text) {
  return showDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: Text(
            "Failed",
            style: Styels.textStyle16_400(context),
          ),
          content: Text(
            text,
            style: Styels.textStyle14_300(context),
          ),
          actions: [
            TextButton(
              onPressed: () {
                GoRouter.of(context).pop();
              },
              child: Text(
                'Close',
                style: Styels.textStyle12_700(context),
              ),
            )
          ],
        );
      });
}
