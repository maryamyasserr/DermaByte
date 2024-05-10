import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void showDoneAlert(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return CupertinoAlertDialog(
        content: const Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.done,
              size: 48,
              color: Colors.green,
            ),
            SizedBox(height: 16),
            Text('Your process has been completed successfully.'),
          ],
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
            },
            child: const Text('Close'),
          ),
        ],
      );
    },
  );
}
