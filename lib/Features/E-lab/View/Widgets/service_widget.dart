import 'package:dermabyte/Core/utils/assets.dart';
import 'package:dermabyte/Core/utils/colors.dart';
import 'package:dermabyte/Core/utils/font_styels.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

// ignore: must_be_immutable
class ServiceWidget extends StatefulWidget {
  ServiceWidget({super.key, required this.serviceName});
  String serviceName;

  @override
  State<ServiceWidget> createState() => _ServiceWidgetState();
}

class _ServiceWidgetState extends State<ServiceWidget> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: GestureDetector(
          onTap: () {
            setState(() {
              isSelected = !isSelected;
            });
          },
          child: Container(
            width: mediaQuery.width * 0.45,
            height: mediaQuery.height * 0.055,
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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  isSelected ? Assets.kSelectedIcon : Assets.kUnselectedIcon,
                ),
                Text(
                  widget.serviceName,
                  style: Styels.textStyle18_300(context),
                  textAlign: TextAlign.center,
                )
              ],
            ),
          ),
        ));
  }
}
