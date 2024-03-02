import 'package:dermabyte/Features/Profile/Presentaion/View/Widgets/Edit_Profile/edit_profile_body.dart';
import 'package:flutter/material.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: EditProfileBody(),
      ),
    );
  }
}
