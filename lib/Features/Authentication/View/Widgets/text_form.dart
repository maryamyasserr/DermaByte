import 'package:dermabyte/Core/utils/font_styels.dart';
import 'package:flutter/material.dart';

class TextForm extends StatelessWidget {
  final String label ;
  const TextForm({super.key,
  required this.label
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
       decoration: InputDecoration(
        labelText: label ,
        labelStyle: Styels.textStyle20_200.copyWith(
           color:  Color(0xff0000005E)
        )
        ),
    );
  }
}