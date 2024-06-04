import 'package:dermabyte/Core/utils/colors.dart';
import 'package:dermabyte/Core/utils/font_styels.dart';
import 'package:flutter/material.dart';

class TextFieldEditing extends StatelessWidget {
  const TextFieldEditing({
    super.key,
    required this.hintText,
    required this.onChanged,
    required this.timingTitle,
    required this.onTap,
    required this.controller,
    required this.labelText,
  });

  final String hintText, timingTitle, labelText;
  final void Function(String? p1) onChanged;
  final void Function() onTap;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            flex: 3,
            child: TextField(
              controller: controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                fillColor: AppColors.kFilledTextForm,
                filled: true,
                labelText: labelText,
                hintText: hintText,
                hintStyle: Styels.textStyle18_400(context).copyWith(
                  color: AppColors.kTextInForm.withOpacity(0.8),
                ),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide.none),
              ),
            )),
        Expanded(
          flex: 2,
          child: Row(
            children: [
              DropdownButton<String>(
                  elevation: 0,
                  underline: const SizedBox(),
                  items: <String>['AM', 'PM'].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: Styels.textStyle20_300(context),
                      ),
                    );
                  }).toList(),
                  onChanged: onChanged),
              Text(timingTitle, style: Styels.textStyle16_400(context)),
              const SizedBox(width: 22),
              GestureDetector(
                onTap: onTap,
                child: const Icon(Icons.done,
                    color: AppColors.kPrimaryColor, size: 30),
              ),
              const SizedBox(width: 4)
            ],
          ),
        )
      ],
    );
  }
}
