import 'package:dermabyte/Features/Scan/Presentaion/View/Widgets/scan_progress_view_body.dart';
import 'package:flutter/material.dart';

class ScanProgressView extends StatelessWidget {
  const ScanProgressView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ScanProgressViewBody(),
    );
  }
}
