import 'package:dermabyte/Core/utils/assets.dart';
import 'package:dermabyte/Core/utils/font_styels.dart';
import 'package:flutter/material.dart';

class AddressBody extends StatelessWidget {
  const AddressBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage(Assets.kBackground), fit: BoxFit.cover),
      ),
      child: Column(
        children: [
          Text("Address", style: Styels.textStyle24_600(context)),
        ],
      ),
    );
  }
}
