import 'package:dermabyte/Core/Widgets/loading_indicator.dart';
import 'package:dermabyte/Core/utils/assets.dart';
import 'package:dermabyte/Core/utils/colors.dart';
import 'package:dermabyte/Core/utils/font_styels.dart';
import 'package:dermabyte/Features/Authentication/Presentation/View%20Model/Auth%20Cubit/auth_cubit.dart';
import 'package:dermabyte/Features/E-doctor%20Reservation/Presentaion/View/Widgets/selected_scan.dart';
import 'package:dermabyte/Features/E-doctor%20Reservation/Presentaion/View_Model/DoctorReservaion/doctor_reservation_cubit.dart';
import 'package:dermabyte/Features/Profile/Presentaion/View_Model/Cubits/Scan%20Cubit/scan_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AllPatientScans extends StatefulWidget {
  const AllPatientScans({
    super.key,
  });

  @override
  State<AllPatientScans> createState() => _AllPatientScansState();
}

class _AllPatientScansState extends State<AllPatientScans> {
  @override
  void initState() {
    BlocProvider.of<ScanCubit>(context).getPatientScan(
        token: BlocProvider.of<AuthCubit>(context).patient!.token);
    super.initState();
  }

  List<String> ids = [];
  List<String> scans = [];
  @override
  Widget build(BuildContext context) {
    List<int> indices =
        BlocProvider.of<DoctorReservationCubit>(context).indices;
    return BlocBuilder<ScanCubit, ScanState>(builder: (context, state) {
      if (state is ScanSuccess) {
        return Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(Assets.kBackground), fit: BoxFit.fill)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Your Scans",
                          style: Styels.textStyle20_700(context)),
                    ),
                    GestureDetector(
                      onTap: () {
                        GoRouter.of(context).pop();
                      },
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Icon(Icons.done, size: 30, color: Colors.green),
                            Text(
                              'Confirm',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Expanded(
                    child: ListView.builder(
                        itemCount: state.scans.length,
                        itemBuilder: (context, index) {
                          bool isSelectd = indices.contains(index);
                          return Column(
                            children: [
                              SelectedScan(
                                selected: isSelectd,
                                aspectRatio: 330 / 100,
                                imageCard: state.scans[index].diseasePhoto,
                                title: state.scans[index].diseaseName,
                                subTitle:
                                    "Scans taken on ${state.scans[index].scanDate.day}/${state.scans[index].scanDate.month}/${state.scans[index].scanDate.year}",
                                onPressed: () {
                                  setState(() {
                                    if (isSelectd) {
                                      indices.remove(index);
                                      ids.remove(state.scans[index].id);
                                      scans.remove(
                                          state.scans[index].diseaseName);
                                    } else {
                                      indices.add(index);
                                      ids.add(state.scans[index].id!);
                                      scans.add(state.scans[index].diseaseName);
                                    }
                                  });
                                  BlocProvider.of<DoctorReservationCubit>(
                                          context)
                                      .selectScan(ids, scans);
                                },
                              ),
                              const SizedBox(
                                height: 12,
                              )
                            ],
                          );
                        })),
              ],
            ),
          ),
        );
      } else if (state is ScanFailure) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                state.errMessage,
                style: Styels.textStyle20_300(context)
                    .copyWith(fontWeight: FontWeight.w600),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              ElevatedButton(
                  onPressed: () {
                    BlocProvider.of<ScanCubit>(context).getPatientScan(
                        token:
                            BlocProvider.of<AuthCubit>(context).patient!.token);
                  },
                  child: Text(
                    "Refresh",
                    style: Styels.textStyle20_700(context),
                  ))
            ],
          ),
        );
      } else {
        return const LoadingIndicator(color: AppColors.kPrimaryColor);
      }
    });
  }
}
