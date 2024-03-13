import 'package:dermabyte/Core/utils/assets.dart';
import 'package:dermabyte/Core/utils/colors.dart';
import 'package:dermabyte/Core/utils/font_styels.dart';
import 'package:dermabyte/Features/Lab/Presentation/View/Widget/Home/file_upload.dart';
import 'package:dermabyte/Features/Lab/Presentation/View/Widget/Home/patient_info.dart';
import 'package:dermabyte/Features/Lab/Presentation/View/Widget/patient_photo.dart';
import 'package:flutter/material.dart';

class RequestBody extends StatelessWidget {
  const RequestBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(Assets.kBackground), fit: BoxFit.cover)),
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.03),
            child: ListView(
              children: [
                const SizedBox(height: 50),
                const PatientPhoto(radius: 50),
                const SizedBox(height: 30),
                const PatientInfo(info: 'Name :', data: " Seif Tariq"),
                const PatientInfo(info: 'Age :', data: " 21"),
                const PatientInfo(info: 'Gender :', data: " Male"),
                const PatientInfo(info: 'Date :', data: " 29/5/2022"),
                const SizedBox(height: 10),
                const Divider(
                  thickness: 0.3,
                  color: Colors.black,
                ),
                const SizedBox(height: 30),
                const FileUpload(),
                const SizedBox(height: 70),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      backgroundColor: AppColors.kPrimaryColor,
                      padding: const EdgeInsets.symmetric(
                          vertical: 15,
                          )),
                  child: Text(
                    "Save",
                    style: Styels.textStyle18_600(context).copyWith(
                        fontWeight: FontWeight.w700, color: Colors.white),
                  ),
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
