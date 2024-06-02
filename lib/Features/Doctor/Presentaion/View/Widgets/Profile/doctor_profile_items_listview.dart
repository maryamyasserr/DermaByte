import 'package:dermabyte/Core/Widgets/update_dialog_1textfield.dart';
import 'package:dermabyte/Core/Widgets/update_dialog_2textfieild.dart';
import 'package:dermabyte/Core/utils/routes.dart';
import 'package:dermabyte/Features/Authentication/Data/Models/doctor_model.dart';
import 'package:dermabyte/Features/Authentication/Presentation/View%20Model/Auth%20Cubit/auth_cubit.dart';
import 'package:dermabyte/Features/Doctor/Presentaion/View/Widgets/Profile/doctor_profile_item.dart';
import 'package:dermabyte/Features/Profile/Data/Models/profile_item_model.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class DoctorProfileItems extends StatelessWidget {
  const DoctorProfileItems({super.key});

  @override
  Widget build(BuildContext context) {
    DoctorModel doctorModel =
        BlocProvider.of<AuthCubit>(context).doctorModel!.doctorModel;
    final List<ProfileItemModel> items = [
      ProfileItemModel(
          title: 'email',
          onTap: () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return UpdateProfileOne(
                    hintText: doctorModel.email!,
                    title: 'Email',
                    controller: TextEditingController(),
                    onPressed: () {},
                  );
                });
          }),
       ProfileItemModel(
          title: 'Password',
          onTap: () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return UpdateProfileTwo(
                    hintText: 'old Password',
                    title: 'Password',
                    controller1: TextEditingController(),
                    controller2: TextEditingController(),
                    hintText2:'New Password',
                    onPressed: () {},
                  );
                });
          }),
      ProfileItemModel(
          title: 'My Schedule',
          onTap: () {
            GoRouter.of(context).push(AppRoutes.kMySchedule);
          }),
      ProfileItemModel(
          title: 'My Free Times',
          onTap: () {
            GoRouter.of(context).push(AppRoutes.kMyFreeTimes);
          }),
      ProfileItemModel(title: 'Log Out', onTap: () {})
    ];
    return Column(
      children: items.map((e) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: DoctorProfileItem(
            profileItemModel: e,
            onTap: e.onTap,
          ),
        );
      }).toList(),
    );
  }
}
