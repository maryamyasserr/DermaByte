import 'package:dermabyte/Core/utils/font_styels.dart';
import 'package:dermabyte/Features/Authentication/View/Widgets/text_form.dart';
import 'package:flutter/material.dart';

class SignInBody extends StatelessWidget {
  const SignInBody({super.key});

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Container(
        child: Column(children: [
          SizedBox(height: mediaQuery.height * 0.1),
          Text(
            'Sign In',
            style: Styels.textStyle40,
          ),
          TextForm(label: 'Email'),
          TextForm(label: 'Password'),
        ]),
      ),
    );
  }
}
