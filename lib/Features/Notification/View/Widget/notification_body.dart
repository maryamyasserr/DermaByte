import 'package:dermabyte/Core/Widgets/custom_appBar.dart';
import 'package:dermabyte/Core/utils/assets.dart';
import 'package:dermabyte/Features/Notification/View/Widget/notification_card.dart';
import 'package:flutter/material.dart';

class NotificationsBody extends StatelessWidget {
  const NotificationsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(Assets.kBackground), fit: BoxFit.cover)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          children: [
            const CustomAppBar(title: "Notification"),
            const SizedBox(height: 24),
            Expanded(
                child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: 10,
                    itemBuilder: (context, index){
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 7),
                        child: NotificationCard(
                            cardTitle: "Notification",
                            cardSubTitle:
                                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur vitae rhoncus sapien",
                            textButton: "View",
                            onPressed: () {}),
                      );
                    }))
          ],
        ),
      ),
    );
  }
}
