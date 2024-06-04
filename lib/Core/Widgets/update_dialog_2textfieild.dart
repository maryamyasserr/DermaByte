import 'package:dermabyte/Core/utils/font_styels.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class UpdateProfileTwo extends StatelessWidget {
  const UpdateProfileTwo({
    super.key,
    required this.hintText,
    required this.title,
    required this.onPressed,
    required this.hintText2,
    required this.controller1,
    required this.controller2,
  });

  final TextEditingController controller1;
  final TextEditingController controller2;

  final String hintText, hintText2, title;

  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Center(
          child: Text(
        'Update $title',
        style: Styels.textStyle24_600(context),
      )),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextField(
            controller: controller1,
            decoration: InputDecoration(
                hintText: hintText, hintStyle: const TextStyle(fontSize: 18)),
          ),
          const SizedBox(height: 5),
          TextField(
            controller: controller2,
            decoration: InputDecoration(
                hintText: hintText2, hintStyle: const TextStyle(fontSize: 18)),
          ),
        ],
      ),
      actions: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              child: Text('Cancel', style: Styels.textStyle18_600(context)),
              onPressed: () {
                GoRouter.of(context).pop();
              },
            ),
            const SizedBox(width: 7),
            TextButton(
              onPressed: onPressed,
              child: Text('Update', style: Styels.textStyle18_600(context)),
            ),
          ],
        ),
      ],
    );
  }
}
