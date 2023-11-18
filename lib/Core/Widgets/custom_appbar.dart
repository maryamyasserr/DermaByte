import 'package:dermabyte/Core/utils/font_styels.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(top: 30,left: 9,right: 32),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Appoinments",style: Styels.textStyle24_600,),
          Row(
            children: [
              Icon(Icons.person_outline_sharp,color: Color(0xff0C0B35),size: 30,),
              
            ],
          )
        ],
      ),
    );
  }
}