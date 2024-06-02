import 'package:dermabyte/Core/Widgets/custom_appBar.dart';
import 'package:dermabyte/Core/Widgets/done_alert.dart';
import 'package:dermabyte/Core/Widgets/failed_alert.dart';
import 'package:dermabyte/Core/Widgets/loading_indicator.dart';
import 'package:dermabyte/Core/utils/assets.dart';
import 'package:dermabyte/Core/utils/colors.dart';
import 'package:dermabyte/Features/Profile/Presentaion/View/Widgets/Profile/items_list_view.dart';
import 'package:dermabyte/Features/Profile/Presentaion/View/Widgets/Profile/profile_header_section.dart';
import 'package:dermabyte/Features/Profile/Presentaion/View_Model/Cubits/Update%20Patient%20Profile/update_patient_profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class ProfileBody extends StatelessWidget {
  const ProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UpdatePatientProfileCubit, UpdatePatientProfileState>(
      listener: (context, state) {
        if (state is UpdatePatientProfileSuccess) {
          showDoneAlert(context);
        }
        
        if (state is UpdatePatientProfileFailure) {
          failedAlert(context, state.errMessage);
        }
      },
      builder: (context, state) {
        if (state is UpdatePatientProfileLoading) {
          return const Center(
              child: LoadingIndicator(color: AppColors.kPrimaryColor));
        } else {
          return Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(Assets.kBackground), fit: BoxFit.cover)),
            child: const Column(
              children: [
                CustomAppBar(title: "Profile"),
                SizedBox(height: 32),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: ProfileHeaderSection(),
                ),
                SizedBox(
                  height: 32,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: ItemsListView(),
                ),
                SizedBox(height: 7),
                // Padding(
                //   padding: EdgeInsets.symmetric(horizontal:  16.0),
                //   child: Divider(
                //     thickness: 0.7,
                //     color: Colors.black,
                //   ),
                // ),
                // SizedBox(height: 16),
                // Align(
                //     alignment: Alignment.centerLeft,
                //     child: Text(
                //       "Doctors you have consulted",
                //       style: Styels.textStyle18_600(context),
                //     )),
                // const SizedBox(
                //   height: 12,
                // ),
                // CarddItem(
                //   bottomText: '',
                //   imageCard: null,
                //   title: "Dr. Luka Modrich",
                //   subTitle:
                //       "An eye doctor to spread magic, creativity and happiness to us",
                //   textButton: "View",
                //   onPressed: () {},
                // ),
                // const SizedBox(
                //   height: 8,
                // )
              ],
            ),
          );
        }
      },
    );
  }
}
