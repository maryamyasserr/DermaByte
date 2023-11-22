import 'package:dermabyte/Features/Profile/View/Widgets/Account/account_body.dart';
import 'package:flutter/material.dart';

class AccountView extends StatelessWidget {
  const AccountView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: AccountBody(),
      ),
    );
  }
}