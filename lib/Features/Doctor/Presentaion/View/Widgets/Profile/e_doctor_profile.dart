import 'package:dermabyte/Core/Widgets/done_alert.dart';
import 'package:dermabyte/Core/Widgets/failed_alert.dart';
import 'package:dermabyte/Core/Widgets/loading_indicator.dart';
import 'package:dermabyte/Core/utils/colors.dart';
import 'package:dermabyte/Core/utils/font_styels.dart';
import 'package:dermabyte/Core/utils/routes.dart';
import 'package:dermabyte/Features/Doctor/Presentaion/View%20Model/Update%20Doctor%20Profile/update_doctor_profile_cubit.dart';
import 'package:dermabyte/Features/Doctor/Presentaion/View/Widgets/Profile/doctor_profile_header.dart';
import 'package:dermabyte/Features/Doctor/Presentaion/View/Widgets/Profile/doctor_profile_items_listview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EdoctorProfile extends StatelessWidget {
  EdoctorProfile({super.key});

  final Map<String, String> items = {
    "Address": AppRoutes.kAddress,
    "Account": AppRoutes.kAccount,
    "Certifications": AppRoutes.kCreditCard,
    "Help": AppRoutes.kHelp,
    "Setting": AppRoutes.kSettings,
    "Logout": ""
  };
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UpdateDoctorProfileCubit, UpdateDoctorProfileState>(
      listener: (context, state) {
        if (state is UpdateDoctorProfileSuccess) {
          showDoneAlert(context);
        }
        if (state is UpdateDoctorProfileFailure) {
          failedAlert(context, state.errMessage);
        }
      },
      builder: (context, state) {
        if (state is UpdateDoctorProfileLoading) {
          return const Center(
            child: LoadingIndicator(color: AppColors.kPrimaryColor),
          ); 
        } else {
          return Padding(
            padding: const EdgeInsets.symmetric(
               horizontal: 16,
               vertical: 32
               ),
            child:  ListView(
              children:  [
                const DoctorProfileHeader(),
                const SizedBox(
                  height: 32,
                ),
                const DoctorProfileItems(),
                 Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Center(child: Text("dermabyte2024@gmail.com",style: Styels.textStyle18_600(context),)),
                )
              ],
            ),
          );
        }
      },
    );
  }
}
