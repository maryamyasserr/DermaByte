import 'package:dermabyte/Core/utils/colors.dart';
import 'package:dermabyte/Core/utils/font_styels.dart';
import 'package:flutter/material.dart';

class SessionCost extends StatelessWidget {
  const SessionCost(
      {super.key,
      required this.cost,
      required this.hintText,
      this.enableEditing,
      required this.edit,
      this.update,
      required this.controller,
      required this.label});

  final String cost, hintText, label;
  final bool edit;
  final void Function()? enableEditing, update;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return edit != true
        ? Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                  "Session Cost : $cost"
                  r" $",
                  style: Styels.textStyle20_700(context)),
              IconButton(
                  onPressed: enableEditing,
                  icon: const Icon(Icons.edit,
                      color: AppColors.kPrimaryColor, size: 24))
            ],
          )
        : Row(children: [
            Expanded(
                flex: 6,
                child: TextField(
                  controller: controller,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    fillColor: AppColors.kFilledTextForm,
                    filled: true,
                    hintText: hintText,
                    labelText: label,
                    hintStyle: Styels.textStyle18_400(context).copyWith(
                      color: AppColors.kTextInForm.withOpacity(0.8),
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide.none),
                  ),
                )),
            Expanded(
              child: GestureDetector(
                onTap: update,
                child: const Icon(Icons.done,
                    color: AppColors.kPrimaryColor, size: 30),
              ),
            )
          ]);
  }
}
