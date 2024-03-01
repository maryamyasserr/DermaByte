import 'package:dermabyte/Core/utils/assets.dart';
import 'package:dermabyte/Core/utils/font_styels.dart';
import 'package:dermabyte/Features/E-lab/View/Widgets/custom_text_field.dart';
import 'package:dermabyte/Features/Profile/View/Widgets/custom_text_field.dart';
import 'package:dermabyte/Features/Profile/View/Widgets/custom_button.dart';
import 'package:flutter/material.dart';

class CreditCardBody extends StatelessWidget {
  const CreditCardBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height,
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(Assets.kBackground), fit: BoxFit.cover)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 70),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Credit Card",
                style: Styels.textStyle24_600(context),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              CustomTextField(
                  keyboardType: TextInputType.name,
                  isrequired: true,
                  padding: const EdgeInsets.only(right: 20),
                  hintext: "Card holder name",
                  width: MediaQuery.of(context).size.height * 0.9),
              CustomTextField(
                  keyboardType: TextInputType.number,
                  isrequired: true,
                  padding: const EdgeInsets.only(right: 20),
                  hintext: "Card Number",
                  width: MediaQuery.of(context).size.height * 0.9),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SCustomTextField(
                      keyboardType: TextInputType.datetime,
                      isrequired: true,
                      padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * 0.33),
                      labelText: "Expiration Date",
                      width: MediaQuery.of(context).size.height * 0.22),
                  SizedBox(width: MediaQuery.of(context).size.width * 0.04),
                  SCustomTextField(
                      keyboardType: TextInputType.number,
                      isrequired: true,
                      padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * 0.33),
                      labelText: "Security Code",
                      width: MediaQuery.of(context).size.height * 0.22),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
              ),
              const CustomButton(text: "Save")
            ],
          ),
        ),
      ),
    );
  }
}
