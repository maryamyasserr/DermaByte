import 'package:dermabyte/Core/utils/assets.dart';
import 'package:dermabyte/Core/utils/font_styels.dart';
import 'package:dermabyte/Features/Profile/View/Widgets/Profile_Section/profile_photo.dart';
import 'package:dermabyte/Features/Profile/View/Widgets/custom_button.dart';
import 'package:dermabyte/Features/Profile/View/Widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class EditProfileBody extends StatelessWidget {
  const EditProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(Assets.kBackground), fit: BoxFit.cover)),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height*0.07,horizontal: MediaQuery.of(context).size.width*0.03),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text("Edit Profile", style: Styels.textStyle24_600.copyWith(fontWeight: FontWeight.w700))),
            SizedBox(height: MediaQuery.of(context).size.height*0.03),
            Stack(
              children: [
                const ProfilePhoto(radius: 50,),
                Positioned(
                    bottom: 0,
                    right: 0,
                    child: GestureDetector(
                        onTap: () {},
                        child: const Icon(Icons.add_a_photo_outlined,size: 30,)))
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height*0.02),
            CustomTextField(
              keyboardType: TextInputType.text,
              hintext: "Full Name",
              width: MediaQuery.of(context).size.width,
              isrequired: false),
            SizedBox(height: MediaQuery.of(context).size.height*0.01),
            CustomTextField(
              keyboardType: TextInputType.number,
              hintext: "Mobile Number",
              width: MediaQuery.of(context).size.width,
              isrequired: false),
            SizedBox(height: MediaQuery.of(context).size.height*0.01),
            CustomTextField(
              keyboardType: TextInputType.datetime,
              hintext: "Birth Date",
              width: MediaQuery.of(context).size.width,
              isrequired: false),
            SizedBox(height: MediaQuery.of(context).size.height*0.03,),
            const CustomButton(text: "Save")
          ],
        ),
      ),
    );
  }
}
