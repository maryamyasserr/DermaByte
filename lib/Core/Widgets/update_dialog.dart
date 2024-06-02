 import 'package:dermabyte/Core/utils/font_styels.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Future<void> updateDialog({
  required BuildContext context,
  required String title,
  required String hintText,
  required String labelText,
  required void Function()? onPressed

}) async {
    TextEditingController controller = TextEditingController();

    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: Text('Update $title'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                const Text('Enter new text:'),
                TextField(
                  controller: controller,
                  decoration: InputDecoration(
                    labelText: labelText,
                    hintText: hintText
                  ),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  child: Text('Cancel',style: Styels.textStyle16_400(context),),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                TextButton(
                  onPressed: onPressed,
                  child: Text('Update',style: Styels.textStyle16_400(context))
                ),
              ],
            ),
          ],
        );
      },
    );
  }