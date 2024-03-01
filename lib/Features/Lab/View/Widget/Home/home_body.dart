import 'package:dermabyte/Core/utils/assets.dart';
import 'package:dermabyte/Core/utils/font_styels.dart';
import 'package:dermabyte/Core/utils/routes.dart';
import 'package:dermabyte/Features/Lab/View/Widget/Home/request_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

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
          Expanded(
              child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: 20,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: RequestCard(
                        iconCard: Assets.kAvatar,
                        cardSubTitle:
                            "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
                        cardTitle: "Seif Tariq",
                        onPressed: () {
                          GoRouter.of(context).push(AppRoutes.kRequestBody);
                        },
                        textButton: "View",
                      ),
                    );
                  }))
        ],
      ),
    );
  }
}
