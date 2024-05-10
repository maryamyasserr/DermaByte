import 'package:dermabyte/Core/Widgets/empty.dart';
import 'package:dermabyte/Core/Widgets/err_widget.dart';
import 'package:dermabyte/Core/utils/font_styels.dart';
import 'package:dermabyte/Features/Admin/Data/Models/lab_dash/lab_dash.dart';
import 'package:dermabyte/Features/Admin/Presentaion/View%20Model/cubit/admin_cubit.dart';
import 'package:dermabyte/Features/Admin/Presentaion/View/Widgets/green_button.dart';
import 'package:dermabyte/Features/Admin/Presentaion/View/Widgets/header_dashboard.dart';
import 'package:dermabyte/Features/Admin/Presentaion/View/Widgets/red_button.dart';
import 'package:dermabyte/Features/Admin/Presentaion/View/Widgets/show_licesnse_widget.dart';
import 'package:dermabyte/Features/Authentication/Presentation/View%20Model/Auth%20Cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LabDashBoardBody extends StatelessWidget {
  const LabDashBoardBody({super.key});

  @override
  Widget build(BuildContext context) {
    List<LabDash> requests = BlocProvider.of<AdminCubit>(context).labRequests;
    List<LabDash> labs = BlocProvider.of<AdminCubit>(context).allLabs;
    return Container(
      color: const Color(0xffE7E0E0),
      child: Column(
        children: [
          const DashBoardHeader(
       
            headerTitle: "Labs",
           
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
                        "All Labs : ${labs.length}",
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
                                  DataColumn(label: Text("location")),
                                  DataColumn(label: Text("")),
                                ],
                                rows: List<DataRow>.generate(
                                  labs.length,
                                  (index) => DataRow(
                                    cells: <DataCell>[
                                      DataCell(
                                        labs[index].profilePic != null
                                            ? CircleAvatar(
                                                backgroundImage: NetworkImage(
                                                    labs[index].profilePic!),
                                              )
                                            : const Icon(Icons.error),
                                      ),
                                      DataCell(
                                          Text("${labs[index].firstName} ")),
                                      DataCell(Text(labs[index].email!)),
                                       DataCell(
                                              TextButton(
                                                style: TextButton.styleFrom(
                                                  padding: EdgeInsets.zero
                                                ),
                                                onPressed: () {
                                                  showLicenseImagesDialog(
                                                      context,
                                                      labs[index].license);
                                                },
                                                child:
                                                    const Text('View Licenses'),
                                              ),
                                            ),
                                    
                                      DataCell(Text(labs[index].location!)),
                                      DataCell(RedButton(
                                          title: 'Delete',
                                          onPressed: () async {
                                            await BlocProvider.of<AdminCubit>(
                                                    context)
                                                .deleteLab(
                                                    id: labs[index].id!,
                                                    token:
                                                        BlocProvider.of<AuthCubit>(context).adminModel!.token);

                                            await BlocProvider.of<AdminCubit>(
                                                    context)
                                                .getAllDashLabs(
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
                        "Labs Requests : ${requests.length}",
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
                                    text: "No Labs Requests")
                                : SingleChildScrollView(
                                    child: DataTable(
                                      columns: const [
                                        DataColumn(label: Text("Photo")),
                                        DataColumn(label: Text("Name")),
                                        DataColumn(label: Text("Email")),
                                        DataColumn(label: Text("License")),
                                        DataColumn(label: Text("Location")),
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
                                                "${requests[index].firstName} ")),
                                            DataCell(
                                                Text(requests[index].email!)),
                                             DataCell(
                                              TextButton(
                                                style: TextButton.styleFrom(
                                                  padding: EdgeInsets.zero
                                                ),
                                                onPressed: () {
                                                  showLicenseImagesDialog(
                                                      context,
                                                      requests[index].license);
                                                },
                                                child:
                                                    const Text('View Licenses'),
                                              ),
                                            ),
                                          
                                            DataCell(Text(
                                                requests[index].location!)),
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
                                                      .getAllDashLabs(
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
                                                      .getAllDashLabs(
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
