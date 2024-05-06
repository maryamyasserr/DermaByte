import 'package:dermabyte/Features/Authentication/Presentation/View/Widgets/sign_in_body.dart';
import 'package:flutter/material.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
      body: SignInBody(),
    );
  }
}
