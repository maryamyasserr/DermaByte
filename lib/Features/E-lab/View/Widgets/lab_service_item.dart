import 'package:dermabyte/Core/utils/colors.dart';
import 'package:dermabyte/Core/utils/font_styels.dart';
import 'package:dermabyte/Features/E-lab/Data/lab_service_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

// ignore: must_be_immutable
class LabServiceItem extends StatelessWidget {
  LabServiceItem({super.key, required this.labServiceData});
  LabServiceData labServiceData;
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        height: mediaQuery.height *0.5,
        padding: const EdgeInsets.all(11),
        decoration: const BoxDecoration(
            color: AppColors.kCardColor,
            borderRadius: BorderRadius.all(Radius.circular(20)),
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                offset: Offset(0.0, 2.6),
                blurRadius: 6.0,
              )
            ]),
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SvgPicture.asset(
                labServiceData.image,
              ),
              SizedBox(height: mediaQuery.height *0.01),
              Text(
                labServiceData.title,
                style: Styels.textStyle16_400,
              ),
              SizedBox(height: mediaQuery.height *0.01),
              Text(labServiceData.subTitle,
              style: Styels.textStyle12_200,
              )
            ],
          ),
        ),
      ),
    );
  }
}
