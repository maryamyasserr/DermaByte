import 'package:dermabyte/Core/utils/font_styels.dart';
import 'package:flutter/material.dart';

class AttachTextFieldDoctorRes extends StatelessWidget {
  const AttachTextFieldDoctorRes({super.key, required this.controller});
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width * 0.95,
        height: MediaQuery.of(context).size.height * 0.075,
        padding: const EdgeInsets.only(left: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
            boxShadow: const [
              BoxShadow(
                color: Colors.grey,
                offset: Offset(0.0, 2.6),
                blurRadius: 6.0,
              )
            ]),
        child: TextField(
          controller: controller,
          decoration: InputDecoration(
              border: InputBorder.none,
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              hintText: 'Do you feel any symptoms?',
              hintStyle: Styels.textStyle18_300(context)),
        ));
  }
}
