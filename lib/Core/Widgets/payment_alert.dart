import 'package:dermabyte/Core/utils/font_styels.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

paymentAlert(BuildContext context, void Function()? onPressed) {
  return showDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: Text(
            "Payment",
            style: Styels.textStyle16_400(context),
          ),
          content: Text(
            'Complete the Payment Process',
            style: Styels.textStyle14_300(context),
          ),
          actions: [
            TextButton(
              onPressed:onPressed, 
              child: Text(
                'Pay',
                style: Styels.textStyle18_600(context),
              ),
            )
          ],
        );
      });
}
