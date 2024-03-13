import 'dart:io';
import 'package:dermabyte/Core/utils/colors.dart';
import 'package:dermabyte/Core/utils/font_styels.dart';
import 'package:dermabyte/Features/Lab/Presentation/View_Model/Lab%20Helper/lab_helper_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FileUpload extends StatefulWidget {
  const FileUpload({super.key});

  @override
  State<FileUpload> createState() => _FileUploadState();
}

class _FileUploadState extends State<FileUpload> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LabHelperCubit, LabHelperState>(
      listener: (context, state) {},
      builder: (context, state) {
        return GestureDetector(
          onTap: () async {
            await BlocProvider.of<LabHelperCubit>(context).uploadResult();
          },
          child: BlocProvider.of<LabHelperCubit>(context).files.isNotEmpty
              ? Column(
                  children:
                      BlocProvider.of<LabHelperCubit>(context).files.map((e) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: Column(
                        children: [
                          IconButton(
                              onPressed: () {
                                BlocProvider.of<LabHelperCubit>(context)
                                    .removePhoto(e);
                              },
                              icon: const Icon(
                                Icons.close,
                                size: 30,
                              )),
                          const SizedBox(height: 4),
                          AspectRatio(
                            aspectRatio: 346 / 350,
                            child: Image.file(
                              File(e.path!),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                )
              : Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: 60,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: AppColors.kCardColor,
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.grey,
                          offset: Offset(0.0, 2.6),
                          blurRadius: 6.0,
                        )
                      ]),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Attach test resutls",
                          style: Styels.textStyle16_400(context),
                        ),
                        const Icon(
                          Icons.add,
                          size: 35,
                        )
                      ],
                    ),
                  ),
                ),
        );
      },
    );
  }
}
