import 'package:dermabyte/Core/utils/assets.dart';
import 'package:dermabyte/Core/utils/font_styels.dart';
import 'package:flutter/material.dart';

class DiseaseHeaderSection extends StatelessWidget {
  const DiseaseHeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerRight,
          child: Text("10/10/2023",style: Styels.textStyle14_300,)),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height*0.22,
              width: MediaQuery.of(context).size.width*0.31,
              child: AspectRatio(
                aspectRatio: 0.7,
                child: Image.asset(
                  Assets.kDiseasePhoto,
                  fit: BoxFit.fill,
                  height: 200,),
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Melanoma",style: Styels.textStyle24_600,),
                  SizedBox(height: MediaQuery.of(context).size.height*0.02,),
                  Text("The scans taken on 10/10/2023 show that you have melanoma.",style: Styels.textStyle14_300,),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: MediaQuery.of(context).size.height*0.03,),
         const Divider(
              thickness: 0.7,
              color: Colors.black,
            ),
      ],
    );
  }
}