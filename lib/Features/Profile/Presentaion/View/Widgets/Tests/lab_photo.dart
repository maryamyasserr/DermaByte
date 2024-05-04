import 'package:dermabyte/Core/utils/assets.dart';
import 'package:flutter/material.dart';

class TestLabPhoto extends StatelessWidget {
  const TestLabPhoto({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      padding: const EdgeInsets.all(2),
      child: Image.asset(
        Assets.kLogo,
        fit: BoxFit.fill,
      ),
    );
  }
}
