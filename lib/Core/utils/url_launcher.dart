import 'package:dermabyte/Core/Widgets/failed_alert.dart';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> cUrlLauncher({required BuildContext context, String? url}) async {
  if (url != null) {
    Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      failedAlert(context, 'Cannot launch $url');
    }
  }
}
