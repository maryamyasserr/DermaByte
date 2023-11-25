import 'package:dermabyte/Core/utils/assets.dart';
import 'package:dermabyte/Core/utils/colors.dart';
import 'package:dermabyte/Core/utils/font_styels.dart';
import 'package:dermabyte/Features/E-Lab/View/Widget/Home/file_upload.dart';
import 'package:dermabyte/Features/E-Lab/View/Widget/Home/patient_info.dart';
import 'package:dermabyte/Features/E-Lab/View/Widget/patient_photo.dart';
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
                vertical: MediaQuery.of(context).size.height * 0.07,
                horizontal: MediaQuery.of(context).size.width * 0.03),
            child: Column(
              children: [
                const PatientPhoto(radius: 50),
                SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                const PatientInfo(info: 'Name :', data: " Seif Tariq"),
                const PatientInfo(info: 'Age :', data: " 21"),
                const PatientInfo(info: 'Gender :', data: " Male"),
                const PatientInfo(info: 'Date :', data: " 29/5/2022"),
                SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                const Divider(
                  thickness: 0.3,
                  color: Colors.black,
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                const FileUpload(),
                SizedBox(height: MediaQuery.of(context).size.height * 0.07),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      backgroundColor: AppColors.kPrimaryColor,
                      padding: EdgeInsets.symmetric(
                          vertical: MediaQuery.of(context).size.height * 0.014,
                          horizontal:
                              MediaQuery.of(context).size.width * 0.40)),
                  child: Text(
                    "Save",
                    style: Styels.textStyle18_600.copyWith(
                        fontWeight: FontWeight.w700, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
