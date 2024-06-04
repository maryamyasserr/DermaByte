import 'package:dermabyte/Core/utils/font_styels.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class UpdateProfile3 extends StatelessWidget {
  const UpdateProfile3({
    super.key,
    required this.hintText,
    required this.title,
    required this.onPressed,
    required this.hintText2,
    required this.controller1,
    required this.controller2,
    required this.controller3,
    required this.hintText3,
    this.validator1,
    this.validator2,
    this.validator3,
    required this.formKey,
  });

  final TextEditingController controller1;
  final TextEditingController controller2;
  final TextEditingController controller3;

  final String hintText, hintText2, hintText3, title;

  final void Function() onPressed;
  final String? Function(String?)? validator1, validator2, validator3;
  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Center(
          child: Text(
        'Update $title',
        style: Styels.textStyle24_600(context),
      )),
      content: Form(
        key: formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: validator1,
              controller: controller1,
              decoration: InputDecoration(
                  hintText: hintText, hintStyle: const TextStyle(fontSize: 14)),
            ),
            const SizedBox(height: 5),
            TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: validator2,
              controller: controller2,
              decoration: InputDecoration(
                  hintText: hintText2,
                  hintStyle: const TextStyle(fontSize: 14)),
            ),
            TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: validator3,
              controller: controller3,
              decoration: InputDecoration(
                  hintText: hintText3,
                  hintStyle: const TextStyle(fontSize: 14)),
            ),
          ],
        ),
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
