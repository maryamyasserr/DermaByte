import 'package:dermabyte/Core/Widgets/empty.dart';
import 'package:dermabyte/Core/Widgets/failed_alert.dart';
import 'package:dermabyte/Core/Widgets/loading_indicator.dart';
import 'package:dermabyte/Core/utils/colors.dart';
import 'package:dermabyte/Core/utils/font_styels.dart';
import 'package:dermabyte/Core/utils/routes.dart';
import 'package:dermabyte/Features/Authentication/Presentation/View%20Model/Auth%20Cubit/auth_cubit.dart';
import 'package:dermabyte/Features/Lab/Presentation/View/Widget/Home/request_card.dart';
import 'package:dermabyte/Features/Lab/Presentation/View_Model/Lab%20Reservaions%20Cubit/lab_reservations_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<LabReservationsCubit>(context).getLabRequests(
        token: BlocProvider.of<AuthCubit>(context).labModel!.token);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        children: [
          const SizedBox(height: 32),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Requests",
                  style:
                      Styels.textStyle24_600(context).copyWith(fontSize: 30)),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  FontAwesomeIcons.magnifyingGlass,
                  size: 30,
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          BlocBuilder<LabReservationsCubit, LabReservationsState>(
              builder: (context, state) {
            if (state is LabReservaionsFailure) {
              return Center(
                child: Text(state.errMessage),
              );
            } else if (state is LabReservaionsSuccess) {
              if (state.labRequests.isEmpty) {
                return const Expanded(
                    child: EmptyWidget(text: "No Reservaions Yet"));
              } else {
                return Expanded(
                    child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemCount: state.labRequests.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: RequestCard(
                              imageCard:
                                  state.labRequests[index].patient!.profilePic,
                              cardSubTitle:
                                  "The ${state.labRequests[index].patient!.firstName} was requested ${state.labRequests[index].test!.length} tests on ${state.labRequests[index].date!.day}/${state.labRequests[index].date!.month}/${state.labRequests[index].date!.year} at ${state.labRequests[index].date!.hour}:${state.labRequests[index].date!.minute.toString().padLeft(2, '0')}",
                              cardTitle:
                                  state.labRequests[index].patient!.firstName ??
                                      'No Patient Name',
                              onPressed: () {
                                BlocProvider.of<LabReservationsCubit>(context)
                                    .setId = state.labRequests[index].id!;
                                if (BlocProvider.of<LabReservationsCubit>(
                                            context)
                                        .currentReservation ==
                                    null) {
                                  failedAlert(context, "Something is wrong");
                                } else {
                                  GoRouter.of(context)
                                      .push(AppRoutes.kRequestBody);
                                }
                              },
                              textButton: "View",
                            ),
                          );
                        }));
              }
            } else {
              return const Expanded(
                  child: Center(
                      child: LoadingIndicator(color: AppColors.kPrimaryColor)));
            }
          })
        ],
      ),
    );
  }
}
