import 'package:dermabyte/Core/Widgets/custom_appBar.dart';
import 'package:dermabyte/Core/utils/assets.dart';
import 'package:dermabyte/Core/utils/font_styels.dart';
import 'package:flutter/material.dart';

class DiseaseBody extends StatelessWidget {
  const DiseaseBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
       const CustomAppBar(title: "History"),
        SizedBox(height: MediaQuery.of(context).size.height*0.02,),
        Align(
          alignment: Alignment.centerRight,
          child: Text("10/10/2023",style: Styels.textStyle14_300,)),
          
        Image.asset(
          Assets.kDiseasePhoto,
          fit: BoxFit.cover,
          height: MediaQuery.of(context).size.height*0.23,)
      ],
    );
  }
}