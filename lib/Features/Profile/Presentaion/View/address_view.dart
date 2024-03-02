import 'package:dermabyte/Features/Profile/Presentaion/View/Widgets/Address/address_body.dart';
import 'package:flutter/material.dart';

class AddressView extends StatelessWidget {
  const AddressView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: AddressBody(),
      ),
    );
  }
}
