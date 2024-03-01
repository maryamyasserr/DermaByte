import 'package:dermabyte/Core/utils/assets.dart';
import 'package:dermabyte/Core/utils/font_styels.dart';
import 'package:dermabyte/Features/Profile/View/Widgets/Setting/settings_item.dart';
import 'package:flutter/material.dart';

class SettingsBody extends StatelessWidget {
  const SettingsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(Assets.kBackground), fit: BoxFit.cover)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text("Settings",
              style: Styels.textStyle40(context).copyWith(fontSize: 30)),
          SizedBox(height: MediaQuery.of(context).size.height * 0.05),
          SettingsItem(onTap: () {}, item: "Country"),
          SettingsItem(onTap: () {}, item: "App Language"),
          GestureDetector(
              onTap: () {},
              child: Text(
                "Delete account",
                style:
                    Styels.textStyle18_400(context).copyWith(color: Colors.red),
              ))
        ]),
      ),
    );
  }
}
