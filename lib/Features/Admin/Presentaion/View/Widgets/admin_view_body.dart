import 'package:dermabyte/Core/Widgets/err_widget.dart';
import 'package:dermabyte/Core/Widgets/loading_indicator.dart';
import 'package:dermabyte/Core/utils/colors.dart';

import 'package:dermabyte/Features/Admin/Presentaion/View%20Model/cubit/admin_cubit.dart';
import 'package:dermabyte/Features/Admin/Presentaion/View/Widgets/Drawer/custom_drawer.dart';
import 'package:dermabyte/Features/Admin/Presentaion/View/Widgets/doctor_dashboard.dart';
import 'package:dermabyte/Features/Admin/Presentaion/View/Widgets/lab_dashboard.dart';
import 'package:dermabyte/Features/Admin/Presentaion/View/Widgets/patient_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AdminViewBody extends StatefulWidget {
  const AdminViewBody({super.key});

  @override
  State<AdminViewBody> createState() => _AdminViewBodyState();
}

class _AdminViewBodyState extends State<AdminViewBody> {
  @override
  void initState() {
    BlocProvider.of<AdminCubit>(context).getAllPatientsDash(
        token:
            "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI2NWViZGM2YTU4MDJiMDI1ZDNhNjg2MjAiLCJpYXQiOjE3MTUxMjc2NDMsImV4cCI6MTcyMjkwMzY0M30.19ukRsSGbJdcKbk8CHB9w-TMnH07OX6Tlod7l4oE1-U");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(flex: 1, child: CustomDrawer()),
        Expanded(
            flex: 5,
            child: BlocBuilder<AdminCubit, AdminState>(
              builder: (context, state) {
                if (state is AdminSuccess) {
                  if (BlocProvider.of<AdminCubit>(context).role == 'p') {
                    return const PatientDashBoardBody();
                  } else if (BlocProvider.of<AdminCubit>(context).role == 'd') {
                    return const DoctorDashBoardBody();
                  } else {
                    return const LabDashBoardBody();
                  }
                } else if (state is AdminFailure) {
                  return ErrWidget(
                    errMessage: state.errMessage,
                    onTap: () async {
                      if (BlocProvider.of<AdminCubit>(context).role == 'p') {
                        await BlocProvider.of<AdminCubit>(context)
                            .getAllPatientsDash(
                                token:
                                    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI2NWViZGM2YTU4MDJiMDI1ZDNhNjg2MjAiLCJpYXQiOjE3MTUxMjc2NDMsImV4cCI6MTcyMjkwMzY0M30.19ukRsSGbJdcKbk8CHB9w-TMnH07OX6Tlod7l4oE1-U');
                      } else if (BlocProvider.of<AdminCubit>(context).role ==
                          'd') {
                        await BlocProvider.of<AdminCubit>(context).getAllDashDoctor(
                            token:
                                'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI2NWViZGM2YTU4MDJiMDI1ZDNhNjg2MjAiLCJpYXQiOjE3MTUxMjc2NDMsImV4cCI6MTcyMjkwMzY0M30.19ukRsSGbJdcKbk8CHB9w-TMnH07OX6Tlod7l4oE1-U');
                      } else {
                        await BlocProvider.of<AdminCubit>(context).getAllDashLabs(
                            token:
                                'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI2NWViZGM2YTU4MDJiMDI1ZDNhNjg2MjAiLCJpYXQiOjE3MTUxMjc2NDMsImV4cCI6MTcyMjkwMzY0M30.19ukRsSGbJdcKbk8CHB9w-TMnH07OX6Tlod7l4oE1-U');
                      }
                    },
                  );
                } else {
                  return const Center(
                      child: LoadingIndicator(color: AppColors.kPrimaryColor));
                }
              },
            )),
        // Expanded(
        //   flex: 5,
        //   child: DoctorDashBoardBody())
      ],
    );
  }
}
