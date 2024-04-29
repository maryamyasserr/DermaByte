import 'package:dermabyte/Core/utils/font_styels.dart';
import 'package:flutter/material.dart';

class GenderDropList extends StatelessWidget {
  const GenderDropList({
    super.key,
    this.onChanged,
  });
  final void Function(String?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 10,
      top: 9,
      child: DropdownButton<String>(
          elevation: 0,
          underline: const SizedBox(),
          items: <String>['male', 'female'].map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(
                value,
                style: Styels.textStyle20_300(context),
              ),
            );
          }).toList(),
          onChanged: onChanged),
    );
  }
}
