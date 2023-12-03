import 'package:dermabyte/Features/Profile/View/Widgets/Setting/settings_body.dart';
import 'package:flutter/material.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: SettingsBody(),
      ),
    );
  }
}