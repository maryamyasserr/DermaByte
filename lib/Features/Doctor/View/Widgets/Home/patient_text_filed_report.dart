import 'package:dermabyte/Core/utils/colors.dart';
import 'package:dermabyte/Core/utils/font_styels.dart';
import 'package:flutter/material.dart';

class PatientTextFieldReport extends StatelessWidget {
  const PatientTextFieldReport({super.key, required this.hintText});
  final String hintText;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.95,
      height: MediaQuery.of(context).size.height * 0.25,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: AppColors.kCardColor,
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(0.0, 2.6),
              blurRadius: 6.0,
            )
          ]),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(hintText,style: Styels.textStyle18_400(context).copyWith(fontWeight: FontWeight.w600),),
             const TextField(
              maxLines: 3,
              keyboardType: TextInputType.text,
              cursorColor: AppColors.kPrimaryColor,
              decoration: InputDecoration(
                  border:  OutlineInputBorder(borderSide: BorderSide.none)),
                         ),
          ],
        ),
      ),
    );
  }
}
