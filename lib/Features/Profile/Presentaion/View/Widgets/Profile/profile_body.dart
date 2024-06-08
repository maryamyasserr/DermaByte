import 'package:dermabyte/Core/Widgets/custom_appBar.dart';
import 'package:dermabyte/Core/Widgets/done_alert.dart';
import 'package:dermabyte/Core/Widgets/failed_alert.dart';
import 'package:dermabyte/Core/Widgets/loading_indicator.dart';
import 'package:dermabyte/Core/utils/assets.dart';
import 'package:dermabyte/Core/utils/colors.dart';
import 'package:dermabyte/Core/utils/font_styels.dart';
import 'package:dermabyte/Core/utils/routes.dart';
import 'package:dermabyte/Features/Authentication/Presentation/View%20Model/Auth%20Cubit/auth_cubit.dart';
import 'package:dermabyte/Features/Profile/Presentaion/View/Widgets/Profile/items_list_view.dart';
import 'package:dermabyte/Features/Profile/Presentaion/View/Widgets/Profile/profile_header_section.dart';
import 'package:dermabyte/Features/Profile/Presentaion/View_Model/Cubits/Update%20Patient%20Profile/update_patient_profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UpdatePatientProfileCubit, UpdatePatientProfileState>(
      listener: (context, state) async {
        if (state is UpdatePatientProfileSuccess) {
          showDoneAlert(context);
        }
        if (state is UpdatePatinetPasswordSuccess) {
          GoRouter.of(context).pushReplacement(AppRoutes.kSignIn);
          await BlocProvider.of<AuthCubit>(context).logOut(
              token: BlocProvider.of<AuthCubit>(context).patient!.token);
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
            child:  ListView(
              children:  [
                const CustomAppBar(title: "Profile"),
                const SizedBox(height: 32),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: ProfileHeaderSection(),
                ),
                const SizedBox(
                  height: 32,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: ItemsListView(),
                ),
                const SizedBox(height: 7),
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
