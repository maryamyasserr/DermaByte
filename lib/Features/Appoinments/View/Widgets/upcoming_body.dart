import 'package:dermabyte/Core/Widgets/custom_appBar.dart';
import 'package:dermabyte/Core/utils/assets.dart';
import 'package:dermabyte/Core/utils/colors.dart';
import 'package:dermabyte/Core/utils/font_styels.dart';
import 'package:dermabyte/Features/Appoinments/View/Widgets/header_text.dart';
import 'package:flutter/material.dart';

class UpComingBody extends StatelessWidget {
  const UpComingBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Assets.kBackground),
            fit: BoxFit.cover
            )),
      child: Column(
        children: [
          const CustomAppBar(title: "Upcoming"),
          SizedBox(height: MediaQuery.of(context).size.height*0.08),
          SizedBox(
            width: MediaQuery.of(context).size.width*0.95,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:[
                const Text(
                  "The doctor has scheduled an online appointment for you on Tuesday 10/24/2023, at 2:30 PM.",
                  style: Styels.textStyle18_400
                  ),
                SizedBox(height: MediaQuery.of(context).size.height*0.07,),
                const Text(
                  "please click on the call button right 5 minutes before the appointment.",
                  style: Styels.textStyle14_300
                  ),
              ],
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height*0.1),
          ElevatedButton(
            onPressed: (){},
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.34,vertical: 12),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              backgroundColor: OurColors.kPrimaryColor
            ),
            child: Text("Start Call",style: Styels.textStyle20_700.copyWith(color: Colors.white),))
        ],
      ),
    );
  }
}
