import 'package:dermabyte/Core/utils/assets.dart';
import 'package:dermabyte/Core/utils/font_styels.dart';
import 'package:dermabyte/Features/Profile/View/Widgets/custom_button.dart';
import 'package:dermabyte/Features/Profile/View/Widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class AccountBody extends StatelessWidget {
  const AccountBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(image: AssetImage(Assets.kBackground),fit: BoxFit.cover)
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 70),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Account",
              style: Styels.textStyle40.copyWith(fontSize: 30),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.04,
            ),
            SCustomTextField(
                keyboardType: TextInputType.emailAddress,
                isrequired: false,
                padding: const EdgeInsets.only(right: 20),
                labelText: "seift470@gmail.com",
                width: MediaQuery.of(context).size.height * 0.9),
            SCustomTextField(
                keyboardType: TextInputType.text,
                isrequired: false,
                padding: const EdgeInsets.only(right: 20),
                labelText: "Hala Madird For Ever",
                width: MediaQuery.of(context).size.height * 0.9),
            
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.06,
            ),
            const CustomButton(text: "Save")
          ],
        ),
      ),
    );
  }
}
