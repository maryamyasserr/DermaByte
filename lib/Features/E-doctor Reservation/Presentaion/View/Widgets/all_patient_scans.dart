import 'package:dermabyte/Core/Widgets/err_widget.dart';
import 'package:dermabyte/Core/Widgets/loading_indicator.dart';
import 'package:dermabyte/Core/utils/assets.dart';
import 'package:dermabyte/Core/utils/colors.dart';
import 'package:dermabyte/Core/utils/font_styels.dart';
import 'package:dermabyte/Features/Authentication/Presentation/View%20Model/Auth%20Cubit/auth_cubit.dart';
import 'package:dermabyte/Features/E-doctor%20Reservation/Presentaion/View/Widgets/doctor_item.dart';
import 'package:dermabyte/Features/E-doctor%20Reservation/Presentaion/View_Model/Cubits/DoctorReservaion/doctor_reservation_cubit.dart';
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

  @override
  Widget build(BuildContext context) {
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
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Your Scans",
                      style: Styels.textStyle20_700(context)),
                ),
                const SizedBox(height: 12),
                Expanded(
                    child: ListView.builder(
                        itemCount: state.scans.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              DoctorItem(
                                iconCard: Assets.kAlphaScan,
                                title: state.scans[index].diseaseName,
                                subTitle:
                                    "Scans taken on ${state.scans[index].scanDate.day}/${state.scans[index].scanDate.month}/${state.scans[index].scanDate.year}",
                                textButton: "Select",
                                onPressed: () {
                                  BlocProvider.of<DoctorReservationCubit>(
                                          context)
                                      .scanId = state.scans[index].id;
                                  GoRouter.of(context).pop();
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
              ErrWidget(errMessage: state.errMessage),
              const SizedBox(height: 16),
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
