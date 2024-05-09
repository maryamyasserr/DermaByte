import 'package:dermabyte/Core/utils/font_styels.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

waitAlert({required BuildContext context,required String text}) {
  return showDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: Text(
            "Waiting",
            style: Styels.textStyle18_400(context).copyWith(
                color:  Colors.yellow[700], fontSize: 19),
          ),
          content: Text(
            text,
            style: Styels.textStyle15_300(context)
                .copyWith(fontWeight: FontWeight.w200),
          ),
          actions: [
            TextButton(
              onPressed: () {
                GoRouter.of(context).pop();
              },
              child: Text(
                'Close',
                style: Styels.textStyle16_400(context)
                    .copyWith(fontWeight: FontWeight.w700),
              ),
            )
          ],
        );
      });
}
