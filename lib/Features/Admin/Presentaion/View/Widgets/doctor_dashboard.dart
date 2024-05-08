import 'package:dermabyte/Core/Widgets/empty.dart';
import 'package:dermabyte/Core/Widgets/err_widget.dart';
import 'package:dermabyte/Core/utils/assets.dart';
import 'package:dermabyte/Core/utils/font_styels.dart';
import 'package:dermabyte/Features/Admin/Data/Models/doctor_dash.dart';
import 'package:dermabyte/Features/Admin/Presentaion/View%20Model/cubit/admin_cubit.dart';
import 'package:dermabyte/Features/Admin/Presentaion/View/Widgets/green_button.dart';
import 'package:dermabyte/Features/Admin/Presentaion/View/Widgets/header_dashboard.dart';
import 'package:dermabyte/Features/Admin/Presentaion/View/Widgets/red_button.dart';
import 'package:dermabyte/Features/Authentication/Presentation/View%20Model/Auth%20Cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DoctorDashBoardBody extends StatelessWidget {
  const DoctorDashBoardBody({super.key});

  @override
  Widget build(BuildContext context) {
    List<DoctorDash> requests =
        BlocProvider.of<AdminCubit>(context).doctorsRequests;
    List<DoctorDash> doctors = BlocProvider.of<AdminCubit>(context).allDoctors;
    return Container(
      color: const Color(0xffE7E0E0),
      child: Column(
        children: [
          const DashBoardHeader(
            title: 'Seif Tariq',
            subTitle: '01027870171',
            headerTitle: "Doctors",
            photo: Assets.kBackground,
          ),
          BlocBuilder<AdminCubit, AdminState>(
            builder: (context, state) {
              if (state is AdminSuccess) {
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "All Doctors",
                        style: Styels.textStyle16_400(context),
                      ),
                      const SizedBox(height: 10),
                      AspectRatio(
                        aspectRatio: 1086 / 250,
                        child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20)),
                            child: SingleChildScrollView(
                              child: DataTable(
                                columns: const [
                                  DataColumn(label: Text("Photo")),
                                  DataColumn(label: Text("Name")),
                                  DataColumn(label: Text("Email")),
                                  DataColumn(label: Text("License")),
                                  DataColumn(label: Text("Mobile")),
                                  // DataColumn(label: Text("Working days")),

                                  DataColumn(label: Text("")),
                                ],
                                rows: List<DataRow>.generate(
                                  doctors.length,
                                  (index) => DataRow(
                                    cells: <DataCell>[
                                      DataCell(
                                        doctors[index].profilePic != null
                                            ? CircleAvatar(
                                                backgroundImage: NetworkImage(
                                                    doctors[index].profilePic!),
                                              )
                                            : const Icon(Icons.error),
                                      ),
                                      DataCell(
                                          Text("${doctors[index].firstName} "
                                              "${doctors[index].lastName}")),
                                      DataCell(Text(doctors[index].email!)),
                                      DataCell(
                                        doctors[index].license != null
                                            ? CircleAvatar(
                                                backgroundImage: NetworkImage(
                                                    doctors[index].license![0]),
                                              )
                                            : const Icon(Icons.error),
                                      ),
                                      DataCell(Text(doctors[index].phone!)),
                                      // DataCell(Text(requests[index]
                                      //       .schedules!
                                      //       .length
                                      //       .toString())),
                                      DataCell(RedButton(
                                          title: 'Delete',
                                          onPressed: () async {
                                            await BlocProvider.of<AdminCubit>(
                                                    context)
                                                .deleteDoctor(
                                                    id: doctors[index].id!,
                                                    token:
                                                        BlocProvider.of<AuthCubit>(context).adminModel!.token);

                                            await BlocProvider.of<AdminCubit>(
                                                    context)
                                                .getAllDashDoctor(
                                                    token:
                                                        BlocProvider.of<AuthCubit>(context).adminModel!.token);
                                          }))
                                    ],
                                  ),
                                ),
                              ),
                            )),
                      ),
                      SizedBox(
                          height: MediaQuery.sizeOf(context).height * 0.03),
                      Text(
                        "Doctors Requets",
                        style: Styels.textStyle16_400(context),
                      ),
                      const SizedBox(height: 10),
                      AspectRatio(
                        aspectRatio: 1086 / 250,
                        child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20)),
                            child: requests.isEmpty
                                ? const EmptyWidget(
                                    text: "No Doctores Requests")
                                : SingleChildScrollView(
                                    child: DataTable(
                                      columns: const [
                                        DataColumn(label: Text("Photo")),
                                        DataColumn(label: Text("Name")),
                                        DataColumn(label: Text("Email")),
                                        DataColumn(label: Text("License")),
                                        DataColumn(label: Text("")),
                                        DataColumn(label: Text("")),
                                        DataColumn(label: Text("")),
                                      ],
                                      rows: List<DataRow>.generate(
                                        requests.length,
                                        (index) => DataRow(
                                          cells: <DataCell>[
                                            DataCell(
                                              requests[index].profilePic != null
                                                  ? CircleAvatar(
                                                      backgroundImage:
                                                          NetworkImage(
                                                              requests[index]
                                                                  .profilePic!),
                                                    )
                                                  : const Icon(Icons.error),
                                            ),
                                            DataCell(Text(
                                                "${requests[index].firstName} "
                                                "${requests[index].lastName}")),
                                            DataCell(
                                                Text(requests[index].email!)),
                                            DataCell(
                                              requests[index].license != null
                                                  ? CircleAvatar(
                                                      backgroundImage:
                                                          NetworkImage(
                                                              requests[index]
                                                                  .license![0]),
                                                    )
                                                  : const Icon(Icons.error),
                                            ),
                                            DataCell(
                                                Text(requests[index].phone!)),
                                            DataCell(GreenButton(
                                                title: 'Approve',
                                                onPressed: () async {
                                                  await BlocProvider.of<
                                                          AdminCubit>(context)
                                                      .approve(
                                                          token:
                                                             BlocProvider.of<AuthCubit>(context).adminModel!.token,
                                                          body: {
                                                        "id": requests[index].id
                                                      });
                                                  await BlocProvider.of<
                                                          AdminCubit>(context)
                                                      .getAllDashDoctor(
                                                          token:
                                                              BlocProvider.of<AuthCubit>(context).adminModel!.token);
                                                })),
                                            DataCell(RedButton(
                                                title: 'Decline',
                                                onPressed: () async {
                                                  await BlocProvider.of<
                                                          AdminCubit>(context)
                                                      .dcline(
                                                          token:
                                                              BlocProvider.of<AuthCubit>(context).adminModel!.token,
                                                          body: {
                                                        "id": requests[index].id
                                                      });
                                                  await BlocProvider.of<
                                                          AdminCubit>(context)
                                                      .getAllDashDoctor(
                                                          token:
                                                             BlocProvider.of<AuthCubit>(context).adminModel!.token);
                                                })),
                                          ],
                                        ),
                                      ),
                                    ),
                                  )),
                      )
                    ],
                  ),
                );
              } else {
                return const ErrWidget(errMessage: 'tap to retry');
              }
            },
          )
        ],
      ),
    );
  }
}
