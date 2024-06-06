import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void deleteAlert(
    {required BuildContext context, required void Function()? onConfirm}) {
  showDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: const Text("Confirm Delete"),
          content: const Text("Are you sure you want to delete this item?"),
          actions: <Widget>[
            CupertinoDialogAction(
              onPressed: () {
                GoRouter.of(context).pop();
              },
              child: const Text("Cancel"),
            ),
            CupertinoDialogAction(
              isDestructiveAction: true,
              onPressed: onConfirm,
              child: const Text("Delete"),
            ),
          ],
        );
      });
}
