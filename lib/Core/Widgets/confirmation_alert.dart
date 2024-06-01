  import 'package:dermabyte/Core/utils/font_styels.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void confirmationDialog({required BuildContext context,required void Function()? onPressed}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
        
          title:  Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Confirmation',style: Styels.textStyle24_600(context))
            ],
          ),
          content:  Text('Are you sure you want to proceed?',style: Styels.textStyle15_400(context),),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [ 
                TextButton(
                  onPressed: () {
                    GoRouter.of(context).pop(); // Dismiss the dialog
                  },
                  child:  Text('Cancel',style: Styels.textStyle20_700(context))
                ),
                TextButton(
                  onPressed:onPressed,
                  child:  Text('Confirm',style: Styels.textStyle20_700(context),),
                ),
              ],
            ),
          ],
        );
      },
    );
  }