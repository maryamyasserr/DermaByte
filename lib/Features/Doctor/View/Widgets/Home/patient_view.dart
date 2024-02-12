import 'package:dermabyte/Core/utils/assets.dart';
import 'package:dermabyte/Core/utils/font_styels.dart';
import 'package:dermabyte/Features/Doctor/View/Widgets/Home/patient_text_filed_report.dart';
import 'package:dermabyte/Features/Doctor/View/Widgets/button.dart';
import 'package:flutter/material.dart';

class PatientView extends StatelessWidget {
  const PatientView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(Assets.kBackground),
              fit: BoxFit.cover
              )
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).size.height*0.05,
              horizontal: MediaQuery.of(context).size.width*0.02
              ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Text("Patient’s diagnoses and treatment",style: Styels.textStyle24_600(context).copyWith(fontSize: 28)),
                  SizedBox(height: MediaQuery.of(context).size.height*0.02,),
                  const PatientTextFieldReport(hintText: "Diagnoses",),
                  SizedBox(height: MediaQuery.of(context).size.height*0.02),
                  const PatientTextFieldReport(hintText: "Treatment plan",),
                  SizedBox(height: MediaQuery.of(context).size.height*0.05),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MyButton(horizontal: MediaQuery.of(context).size.width*0.09, textButton: "Edit",onPressed: (){},),
                      MyButton(horizontal: MediaQuery.of(context).size.width*0.08, textButton: "Save",onPressed: (){},),
                      MyButton(horizontal: MediaQuery.of(context).size.width*0.07, textButton: "Delete",onPressed: (){}),
                    ],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height*0.05),
                  MyButton(horizontal: MediaQuery.of(context).size.width*0.2, textButton: "Send Report",onPressed: (){},),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}