import 'package:dermabyte/Core/Widgets/done_alert.dart';
import 'package:dermabyte/Core/Widgets/failed_alert.dart';
import 'package:dermabyte/Core/Widgets/loading_indicator.dart';
import 'package:dermabyte/Core/utils/colors.dart';
import 'package:dermabyte/Features/Lab/Presentation/View/Widget/lab_profile/e_lab_listview_items.dart';
import 'package:dermabyte/Features/Lab/Presentation/View/Widget/lab_profile/profile_header_section.dart';
import 'package:dermabyte/Features/Lab/Presentation/View_Model/Update%20Lab%20Profile/update_lab_profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class ElabProfile extends StatelessWidget {
  const ElabProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UpdateLabProfileCubit, UpdateLabProfileState>(
      listener: (context, state) {
        if (state is UpdateLabProfileSuccess) {
          showDoneAlert(context);
        }
        if (state is UpdateLabProfileFailure) {
          failedAlert(context, state.errMessage);
        }
       
      },
      builder: (context, state) {
        if (state is UpdateLabProfileLoading) {
          return const Center(
            child: LoadingIndicator(color: AppColors.kPrimaryColor),
          );
        } else {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              children: [
                const SizedBox(height: 64),
                const ElabProfileHeaderSection(),
                SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                const ElabItemsListView(),
              ],
            ),
          );
        }
      },
    );
  }
}
