import 'package:dermabyte/Core/Widgets/custom_appbar.dart';
import 'package:dermabyte/Core/Widgets/loading_indicator.dart';
import 'package:dermabyte/Core/utils/assets.dart';
import 'package:dermabyte/Core/utils/colors.dart';
import 'package:dermabyte/Core/utils/font_styels.dart';
import 'package:dermabyte/Core/utils/routes.dart';
import 'package:dermabyte/Features/Authentication/Presentation/View%20Model/Auth%20Cubit/auth_cubit.dart';
import 'package:dermabyte/Features/E-lab/Presentation/View/Widgets/lab_item.dart';
import 'package:dermabyte/Features/E-lab/Presentation/View_model/Lab%20Cubit/lab_cubit.dart';
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
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomAppBar(title: 'Laboratories'),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'A list of the best laboratories in your era.',
                style: Styels.textStyle15_300(context),
              ),
            ),
            BlocBuilder<ELabCubit, LabState>(builder: (context, state) {
              if (state is LabFailure) {
                return Center(
                  child: Text(state.errMessage),
                );
              } else if (state is LabSuccess) {
                return Expanded(
                  child: ListView.builder(
                    itemCount: state.labs.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 24.0),
                        child: LabItem(
                          iconCard: Assets.kAlphaScan,
                          labTitle: state.labs[index].name!,
                          labSubTitle:
                              'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                          onTap: () {
                            BlocProvider.of<ELabCubit>(context).setId =
                                state.labs[index].id!;
                            GoRouter.of(context).push(AppRoutes.kLabDetails);
                          },
                          onButtonPressed: () {
                            BlocProvider.of<ELabCubit>(context).setId =
                                state.labs[index].id!;
                            GoRouter.of(context)
                                .push(AppRoutes.kLabReservationView);
                          },
                          textButton: 'Reserve',
                        ),
                      );
                    },
                  ),
                );
              } else {
                return const LoadingIndicator(color: AppColors.kPrimaryColor);
              }
            })
          ],
        ),
      ),
    );
  }
}
