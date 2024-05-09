import 'package:dermabyte/Core/utils/font_styels.dart';
import 'package:flutter/material.dart';

class DashBoardHeader extends StatelessWidget {
  const DashBoardHeader({
    super.key,
    required this.title,
    required this.subTitle,
    required this.photo,
    required this.headerTitle,
  });

  final String title, subTitle, photo, headerTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(bottomRight: Radius.circular(25))),
      height: MediaQuery.sizeOf(context).height * 0.09,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage(
                          photo,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            title,
                            style: Styels.textStyle14_300(context)
                                .copyWith(fontWeight: FontWeight.w600),
                          ),
                          Text(subTitle),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(width: MediaQuery.sizeOf(context).width * 0.64),
                  Text(
                    headerTitle,
                    style: Styels.textStyle20_700(context),
                  ),
                ]),
          ),
        ],
      ),
    );
  }
}
