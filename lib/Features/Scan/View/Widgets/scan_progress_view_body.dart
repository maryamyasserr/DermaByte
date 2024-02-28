import 'dart:io';
import 'package:dermabyte/Features/Scan/View/Widgets/result_container.dart';
import 'package:dermabyte/Features/Scan/View/Widgets/scan_progress_container.dart';
import 'package:flutter/material.dart';

class ScanProgressViewBody extends StatefulWidget {
  const ScanProgressViewBody({Key? key, required this.imagePath})
      : super(key: key);
  final String imagePath;

  @override
  State<ScanProgressViewBody> createState() => _ScanProgressViewBodyState();
}

class _ScanProgressViewBodyState extends State<ScanProgressViewBody> {
  bool resultsContainer = false;

  @override
  void initState() {
    super.initState();

    // Delay for 3 seconds before showing the empty container
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        setState(() {
          resultsContainer = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: FileImage(File(widget
                    .imagePath)), // Use FileImage to load image from file path
                fit: BoxFit.fill,
              ),
            ),
          ),
          Column(children: [
            Expanded(
              child: Column(
                children: [
                  const Expanded(child: SizedBox()),
                  resultsContainer
                      ? const Expanded(flex: 3, child: ResutlContainer())
                      : const ScanProgressContainer()
                ],
              ),
            )
          ])
        ],
      ),
    );
  }
}
