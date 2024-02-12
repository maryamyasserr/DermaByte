import 'dart:io';
import 'package:dermabyte/Core/utils/colors.dart';
import 'package:dermabyte/Core/utils/font_styels.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class FileUpload extends StatefulWidget {
  const FileUpload({super.key});

  @override
  State<FileUpload> createState() => _FileUploadState();
}

class _FileUploadState extends State<FileUpload> {
  String? imgPath;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        FilePickerResult? result = await FilePicker.platform.pickFiles(
          // type: FileType.image,
          allowMultiple: false
        );
        if (result != null&&result.files.isNotEmpty) {
          setState(() {
          imgPath = result.files.first.path;
          });
        } else {
        }
      },
      child: imgPath!=null? Image.file(
        File(imgPath!),
        height: MediaQuery.of(context).size.height*0.3,
        width: MediaQuery.of(context).size.width*0.9,
        fit: BoxFit.cover,
      ):
      Container(
        width: MediaQuery.of(context).size.width * 0.9,
        height: MediaQuery.of(context).size.height * 0.07,
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
  }
}
