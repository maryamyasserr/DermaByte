import 'package:dermabyte/Core/utils/font_styels.dart';
import 'package:flutter/material.dart';

class Timing extends StatelessWidget {
  const Timing({super.key, required this.onChanged, required this.title});
  final void Function(String?)? onChanged;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 10,
      top: 9,
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
          Text(title ?? ""),
          const SizedBox(width: 4)
        ],
      ),
    );
  }
}
