import 'package:dermabyte/Features/Scan/View/Widgets/scan_progress_view_body.dart';
import 'package:flutter/material.dart';

class ScanProgressView extends StatelessWidget {
  final String imagePath;

  const ScanProgressView({Key? key, required this.imagePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScanProgressViewBody(imagePath: imagePath),
    );
  }
}
