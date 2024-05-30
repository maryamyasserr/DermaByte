import 'package:dermabyte/Core/Widgets/err_widget.dart';
import 'package:dermabyte/Core/Widgets/loading_indicator.dart';
import 'package:dermabyte/Core/utils/assets.dart';
import 'package:dermabyte/Core/utils/colors.dart';
import 'package:dermabyte/Core/utils/font_styels.dart';
import 'package:dermabyte/Features/Admin/Data/Models/patient_dash.dart';
import 'package:dermabyte/Features/Admin/Presentaion/View%20Model/cubit/admin_cubit.dart';
import 'package:dermabyte/Features/Admin/Presentaion/View/Widgets/red_button.dart';
import 'package:dermabyte/Features/Admin/Presentaion/View/Widgets/header_dashboard.dart';
import 'package:dermabyte/Features/Authentication/Presentation/View%20Model/Auth%20Cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PatientDashBoardBody extends StatelessWidget {
  const PatientDashBoardBody({super.key});

  @override
  Widget build(BuildContext context) {
    List<PatientDash> patients =
        BlocProvider.of<AdminCubit>(context).allPatients;
    return Column(
      children: [
        const DashBoardHeader(
          headerTitle: 'Patients',
        ),
        BlocBuilder<AdminCubit, AdminState>(
          builder: (context, state) {
            if (state is AdminSuccess) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "All Patients : ${patients.length}",
                      style: Styels.textStyle16_400(context),
                    ),
                    const SizedBox(height: 20),
                    AspectRatio(
                      aspectRatio: 1086 / 500,
                      child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20)),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            child: DataTable(
                              columns: const [
                                DataColumn(label: Text("Photo")),
                                DataColumn(label: Text("Name")),
                                DataColumn(label: Text("Email")),
                                DataColumn(label: Text("Mobile")),
                                DataColumn(label: Text("")),
                              ],
                              rows: List<DataRow>.generate(
                                patients.length,
                                (index) => DataRow(
                                  cells: <DataCell>[
                                    DataCell(
                                      patients[index].profilePic != null
                                          ? CircleAvatar(
                                              backgroundImage: NetworkImage(
                                                  patients[index].profilePic!),
                                            )
                                          : SvgPicture.asset(
                                              Assets.kProfileIcon),
                                    ),
                                    DataCell(
                                        Text("${patients[index].firstName} "
                                            "${patients[index].lastName}")),
                                    DataCell(Text(patients[index].email!)),
                                    DataCell(Text(patients[index].phone!)),
                                    DataCell(RedButton(
                                      title: 'Delete',
                                      onPressed: () async {
                                        await BlocProvider.of<AdminCubit>(
                                                context)
                                            .deletePatinet(
                                                token:
                                                    BlocProvider.of<AuthCubit>(
                                                            context)
                                                        .adminModel!
                                                        .token,
                                                id: patients[index].id!);
                                        await BlocProvider.of<AdminCubit>(
                                                context)
                                            .getAllPatientsDash(
                                          token: BlocProvider.of<AuthCubit>(
                                                  context)
                                              .adminModel!
                                              .token,
                                        );
                                      },
                                    ))
                                  ],
                                ),
                              ),
                            ),
                          )),
                    ),
                  ],
                ),
              );
            } else if (state is AdminFailure) {
              return ErrWidget(errMessage: state.errMessage);
            } else {
              return const Center(
                  child: LoadingIndicator(color: AppColors.kPrimaryColor));
            }
          },
        )
      ],
    );
  }
}
