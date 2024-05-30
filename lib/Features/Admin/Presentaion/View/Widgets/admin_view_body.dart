import 'package:dermabyte/Core/Widgets/err_widget.dart';
import 'package:dermabyte/Core/Widgets/loading_indicator.dart';
import 'package:dermabyte/Core/utils/colors.dart';
import 'package:dermabyte/Features/Admin/Presentaion/View%20Model/cubit/admin_cubit.dart';
import 'package:dermabyte/Features/Admin/Presentaion/View/Widgets/Drawer/custom_drawer.dart';
import 'package:dermabyte/Features/Admin/Presentaion/View/Widgets/doctor_dashboard.dart';
import 'package:dermabyte/Features/Admin/Presentaion/View/Widgets/lab_dashboard.dart';
import 'package:dermabyte/Features/Admin/Presentaion/View/Widgets/patient_body.dart';
import 'package:dermabyte/Features/Authentication/Presentation/View%20Model/Auth%20Cubit/auth_cubit.dart';
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
        token: BlocProvider.of<AuthCubit>(context).adminModel!.token);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String token = BlocProvider.of<AuthCubit>(context).adminModel!.token;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: const Color(0xffE7E0E0),
          ),
          Row(
            children: [
              const Expanded(
                flex: 1,
                child: CustomDrawer(),
              ),
              Expanded(
                flex: 5,
                child: Column(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
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
                                        .getAllPatientsDash(token: token);
                                  } else if (BlocProvider.of<AdminCubit>(context).role == 'd') {
                                    await BlocProvider.of<AdminCubit>(context).getAllDashDoctor(
                                        token: token);
                                  } else {
                                    await BlocProvider.of<AdminCubit>(context).getAllDashLabs(
                                        token: token);
                                  }
                                },
                              );
                            } else {
                              return const Padding(
                                padding: EdgeInsets.only(top: 400),
                                child: LoadingIndicator(color: AppColors.kPrimaryColor));
                            }
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}


// import 'package:dermabyte/Core/Widgets/err_widget.dart';
// import 'package:dermabyte/Core/Widgets/loading_indicator.dart';
// import 'package:dermabyte/Core/utils/colors.dart';

// import 'package:dermabyte/Features/Admin/Presentaion/View%20Model/cubit/admin_cubit.dart';
// import 'package:dermabyte/Features/Admin/Presentaion/View/Widgets/Drawer/custom_drawer.dart';
// import 'package:dermabyte/Features/Admin/Presentaion/View/Widgets/doctor_dashboard.dart';
// import 'package:dermabyte/Features/Admin/Presentaion/View/Widgets/lab_dashboard.dart';
// import 'package:dermabyte/Features/Admin/Presentaion/View/Widgets/patient_body.dart';
// import 'package:dermabyte/Features/Authentication/Presentation/View%20Model/Auth%20Cubit/auth_cubit.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class AdminViewBody extends StatefulWidget {
//   const AdminViewBody({super.key});

//   @override
//   State<AdminViewBody> createState() => _AdminViewBodyState();
// }

// class _AdminViewBodyState extends State<AdminViewBody> {
//   @override
//   void initState() {
//     BlocProvider.of<AdminCubit>(context).getAllPatientsDash(
//         token:
//             BlocProvider.of<AuthCubit>(context).adminModel!.token);
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     String token = BlocProvider.of<AuthCubit>(context).adminModel!.token;
//     return Stack(
//       children: [
//         Container(
//              color: const Color(0xffE7E0E0),
//         ),
//         Row(
//           children: [
//             const Expanded(flex: 1, child: CustomDrawer()),
//             Expanded(
//                 flex: 5,
//                 child: SingleChildScrollView(
//                   child: BlocBuilder<AdminCubit, AdminState>(
//                     builder: (context, state) {
//                       if (state is AdminSuccess) {
//                         if (BlocProvider.of<AdminCubit>(context).role == 'p') {
//                           return const PatientDashBoardBody();
//                         } else if (BlocProvider.of<AdminCubit>(context).role == 'd') {
//                           return const DoctorDashBoardBody();
//                         } else {
//                           return const LabDashBoardBody();
//                         }
//                       } else if (state is AdminFailure) {
//                         return ErrWidget(
//                           errMessage: state.errMessage,
//                           onTap: () async {
//                             if (BlocProvider.of<AdminCubit>(context).role == 'p') {
//                               await BlocProvider.of<AdminCubit>(context)
//                                   .getAllPatientsDash(token: token);
//                             } else if (BlocProvider.of<AdminCubit>(context).role ==
//                                 'd') {
//                               await BlocProvider.of<AdminCubit>(context).getAllDashDoctor(
//                                   token:
//                                       token);
//                             } else {
//                               await BlocProvider.of<AdminCubit>(context).getAllDashLabs(
//                                   token:
//                                      token);
//                             }
//                           },
//                         );
//                       } else {
//                         return const Center(
//                             child: LoadingIndicator(color: AppColors.kPrimaryColor));
//                       }
//                     },
//                   ),
//                 )),
     
          
//           ],
//         ),
//       ],
//     );
//   }
// }
