import 'package:dermabyte/Core/Widgets/empty.dart';
import 'package:dermabyte/Core/Widgets/failed_alert.dart';
import 'package:dermabyte/Core/Widgets/custom_appbar.dart';
import 'package:dermabyte/Core/Widgets/err_widget.dart';
import 'package:dermabyte/Core/Widgets/loading_indicator.dart';
import 'package:dermabyte/Core/utils/assets.dart';
import 'package:dermabyte/Core/utils/colors.dart';
import 'package:dermabyte/Core/utils/font_styels.dart';
import 'package:dermabyte/Core/utils/routes.dart';
import 'package:dermabyte/Features/Authentication/Presentation/View%20Model/Auth%20Cubit/auth_cubit.dart';
import 'package:dermabyte/Features/E-lab/Presentation/View/Widgets/lab_item.dart';
import 'package:dermabyte/Features/E-lab/Presentation/View_model/Elab%20Cubit/elab_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ElabViewBody extends StatefulWidget {
  const ElabViewBody({super.key});

  @override
  State<ElabViewBody> createState() => _ElabViewBodyState();
}

class _ElabViewBodyState extends State<ElabViewBody> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<ELabCubit>(context)
        .getAllLabs(token: BlocProvider.of<AuthCubit>(context).patient!.token);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(Assets.kBackground),
          fit: BoxFit.cover,
        ),
     
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomAppBar(title: 'Laboratories'),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'A list of the best laboratories in your era.',
              style: Styels.textStyle15_300(context),
            ),
          ),
          BlocBuilder<ELabCubit, LabState>(builder: (context, state) {
            if (state is LabFailure) {
              return Expanded(
                  child: ErrWidget(
                      onTap: () {
                        BlocProvider.of<ELabCubit>(context).getAllLabs(
                            token: BlocProvider.of<AuthCubit>(context)
                                .patient!
                                .token);
                      },
                      errMessage: state.errMessage));
            } else if (state is LabSuccess) {
              if (state.labs.isEmpty) {
                return const EmptyWidget(
                    text: "There are no Labs available now");
              } else {
                return Expanded(
                  child: ListView.builder(
                    itemCount: state.labs.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 10),
                        child: LabItem(
                          imageCard: state.labs[index].profilePic,
                          labTitle: state.labs[index].firstName ?? "",
                          labSubTitle:
                              '${state.labs[index].firstName} laboratory in Giza that provides ${state.labs[index].services!.length} services',
                          onTap: () {
                            BlocProvider.of<ELabCubit>(context).setId =
                                state.labs[index].id!;
                            GoRouter.of(context).push(AppRoutes.kLabDetails);
                          },
                          onButtonPressed: () {
                            BlocProvider.of<ELabCubit>(context).setId =
                                state.labs[index].id!;
                            if (BlocProvider.of<ELabCubit>(context)
                                    .currentLab ==
                                null) {
                              failedAlert(context,
                                  "Something is Wrong Reserve With Another Lab");
                            } else {
                              GoRouter.of(context)
                                  .push(AppRoutes.kLabReservationView);
                            }
                          },
                          textButton: 'Reserve',
                        ),
                      );
                    },
                  ),
                );
              }
            } else {
              return const Expanded(
                  child: Center(
                      child:
                          LoadingIndicator(color: AppColors.kPrimaryColor)));
            }
          })
        ],
      ),
    );
  }
}
