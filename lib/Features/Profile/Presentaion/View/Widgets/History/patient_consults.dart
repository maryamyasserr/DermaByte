import 'package:dermabyte/Core/Widgets/err_widget.dart';
import 'package:dermabyte/Core/Widgets/loading_indicator.dart';
import 'package:dermabyte/Core/utils/assets.dart';
import 'package:dermabyte/Core/utils/colors.dart';
import 'package:dermabyte/Core/utils/routes.dart';
import 'package:dermabyte/Features/Profile/Presentaion/View/Widgets/History/history_card.dart';
import 'package:dermabyte/Features/Profile/Presentaion/View_Model/Cubits/Consults%20Cubit/consults_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class PatientConsults extends StatelessWidget {
  const PatientConsults({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ConsultsCubit, ConsultsState>(
      builder: (context, state) {
        if (state is ConsultsSuccess) {
          return ListView.builder(
              itemCount: state.consults.length,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: HistoryCard(
                        iconCard: Assets.kDoctorAvatar,
                        cardTitle:
                            state.consults[index].dermatologist.firstName ?? "",
                        cardSubTitle:
                            "Scans taken on 11/10/2023 show......Lorem ipsum dolor sit amet,",
                        textButton: "View",
                        onPressed: () {
                          BlocProvider.of<ConsultsCubit>(context).setId =
                              state.consults[index].id!;
                          GoRouter.of(context).push(AppRoutes.kConsults);
                        },
                      ),
                    )
                  ],
                );
              });
        } else if (state is ConsultsFailure) {
          return ErrWidget(errMessage: state.errMessage);
        } else {
          return const LoadingIndicator(color: AppColors.kPrimaryColor);
        }
      },
    );
  }
}
