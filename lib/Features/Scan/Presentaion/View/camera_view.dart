import 'package:dermabyte/Features/Scan/Presentaion/View/Widgets/camera_view_body.dart';
import 'package:flutter/material.dart';

class CameraView extends StatelessWidget {
  const CameraView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CameraViewBody(),
    );
  }
}
