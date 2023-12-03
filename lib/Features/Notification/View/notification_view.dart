import 'package:dermabyte/Features/Notification/View/Widget/notification_body.dart';
import 'package:flutter/material.dart';

class NotificationsView extends StatelessWidget {
  const NotificationsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: NotificationsBody(),
      ),
    );
  }
}
