import 'package:dermabyte/Core/utils/assets.dart';
import 'package:dermabyte/Core/utils/colors.dart';
import 'package:dermabyte/Core/utils/font_styels.dart';
import 'package:dermabyte/Core/utils/routes.dart';
import 'package:dermabyte/Features/Profile/View/Widgets/custom_card.dart';
import 'package:flutter/material.dart';
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
            labelStyle: Styels.textStyle20_700,
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
          child: TabBarView(
            controller: tabController,
            children: [
            ListView.builder(
                itemCount: 6,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: FeatureCard(
                          iconCard: Assets.kDoctorAvatar,
                          cardTitle: "Melanoma",
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
                }),
            ListView.builder(
                itemCount: 4,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 6),
                        child: FeatureCard(
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
                        padding: const EdgeInsets.only(bottom: 6),
                        child: FeatureCard(
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
