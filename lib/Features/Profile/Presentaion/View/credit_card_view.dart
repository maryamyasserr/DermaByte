import 'package:dermabyte/Features/Profile/Presentaion/View/Widgets/CreditCard/credit_card_body.dart';
import 'package:flutter/material.dart';

class CreditCardView extends StatelessWidget {
  const CreditCardView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(child: Scaffold(body: CreditCardBody()));
  }
}
