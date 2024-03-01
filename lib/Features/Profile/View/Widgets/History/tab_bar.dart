import 'package:dermabyte/Core/Widgets/err_widget.dart';
import 'package:dermabyte/Core/Widgets/loading_indicator.dart';
import 'package:dermabyte/Core/utils/assets.dart';
import 'package:dermabyte/Core/utils/colors.dart';
import 'package:dermabyte/Core/utils/font_styels.dart';
import 'package:dermabyte/Core/utils/routes.dart';
import 'package:dermabyte/Features/Profile/View/Widgets/History/scan_card.dart';
import 'package:dermabyte/Features/Scan/Presentaion/View%20Model/Scan%20Cubit/scan_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class CustomTabBar extends StatefulWidget {
  const CustomTabBar({super.key});

  @override
  State<CustomTabBar> createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar>
    with TickerProviderStateMixin {
  TabController? tabController;
  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);
    BlocProvider.of<ScanCubit>(context)
        .getPatientScan(id: "65dc8e92feeacbd13e5da2b6");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.08,
          width: MediaQuery.of(context).size.width,
          child: TabBar(
            controller: tabController,
            labelColor: Colors.black,
            labelStyle: Styels.textStyle20_700(context),
            indicatorColor: AppColors.kPrimaryColor,
            unselectedLabelColor: Colors.grey,
            tabs: const [
              Tab(text: "Scans"),
              Tab(text: "Tests"),
              Tab(text: "Consults"),
            ],
          ),
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.03),
        Expanded(
          child: TabBarView(controller: tabController, children: [
            BlocBuilder<ScanCubit, ScanState>(builder: (context, state) {
              if (state is ScanSuccess) {
                return ListView.builder(
                    itemCount: state.scans.length,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: ScanCard(
                              iconCard: Assets.kDoctorAvatar,
                              cardTitle: state.scans[index].diseaseName,
                              cardSubTitle:
                                  "Scans taken on 11/10/2023 show......Lorem ipsum dolor sit amet,",
                              textButton: "View",
                              onPressed: () {
                                GoRouter.of(context).push(AppRoutes.kDisease);
                              },
                            ),
                          )
                        ],
                      );
                    });
              } else if (state is ScanFailure) {
                return ErrWidget(
                  errMessage: state.errMessage,
                );
              } else {
                return const LoadingIndicator(color: AppColors.kPrimaryColor);
              }
            }),
            ListView.builder(
                itemCount: 4,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 6),
                        child: ScanCard(
                          iconCard: Assets.kDoctorAvatar,
                          cardTitle: "Melanoma",
                          cardSubTitle:
                              "Scans taken on 11/10/2023 show......Lorem ipsum dolor sit amet,",
                          textButton: "View",
                          onPressed: () {},
                        ),
                      )
                    ],
                  );
                }),
            ListView.builder(
                itemCount: 4,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: ScanCard(
                          iconCard: Assets.kDoctorAvatar,
                          cardTitle: "Melanoma",
                          cardSubTitle:
                              "Scans taken on 11/10/2023 show......Lorem ipsum dolor sit amet,",
                          textButton: "View",
                          onPressed: () {
                            GoRouter.of(context).push(AppRoutes.kConsults);
                          },
                        ),
                      )
                    ],
                  );
                }),
          ]),
        )
      ],
    );
  }
}
