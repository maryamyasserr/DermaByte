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
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        padding: const EdgeInsets.all(8),
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
          padding: const EdgeInsets.only(top: 10, left: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SvgPicture.asset(
                labServiceData.image,
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                labServiceData.title,
                style: Styels.textStyle18_400(context),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                labServiceData.subTitle,
                style: Styels.textStyle14_300(context),
              )
            ],
          ),
        ),
      ),
    );
  }
}
