import 'dart:io';
import 'package:dermabyte/Features/Scan/Presentaion/View%20Model/Create%20Scan%20Cubit/create_scan_cubit.dart';
import 'package:dermabyte/Features/Scan/Presentaion/View/Widgets/result_container.dart';
import 'package:dermabyte/Features/Scan/Presentaion/View/Widgets/scan_progress_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ScanProgressViewBody extends StatelessWidget {
  const ScanProgressViewBody({
    Key? key,
  }) : super(key: key);

  @override
  @override
  Widget build(BuildContext context) {
    String imagePath = BlocProvider.of<CreateScanCubit>(context).takePhotoPath!;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: FileImage(File(
                    imagePath)), // Use FileImage to load image from file path
                fit: BoxFit.fill,
              ),
            ),
          ),
          Column(children: [
            Expanded(
              child: Column(
                children: [
                  const Expanded(child: SizedBox()),
                  BlocBuilder<CreateScanCubit, CreateScanState>(
                    builder: (context, state) {
                      if (state is CreateScanLoading) {
                        return const ScanProgressContainer();
                      } else {
                        return const Expanded(
                            flex: 1, child: ResutlContainer());
                      }
                    },
                  )
                ],
              ),
            )
          ])
        ],
      ),
    );
  }
}
