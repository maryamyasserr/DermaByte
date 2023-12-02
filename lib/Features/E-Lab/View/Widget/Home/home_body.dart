import 'package:dermabyte/Core/utils/assets.dart';
import 'package:dermabyte/Core/utils/font_styels.dart';
import 'package:dermabyte/Core/utils/routes.dart';
import 'package:dermabyte/Features/E-Lab/View/Widget/Home/request_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).size.height * 0.08,
          horizontal: MediaQuery.of(context).size.width * 0.025),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Requests",
                  style: Styels.textStyle24_600.copyWith(fontSize: 30)),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(FontAwesomeIcons.magnifyingGlass,size: 30,))
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.03,
          ),
          SizedBox(
              height: MediaQuery.of(context).size.height * 0.57,
              child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: 20,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 7),
                      child: RequestCard(
                        iconCard: Assets.kDoctorAvatar,
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
