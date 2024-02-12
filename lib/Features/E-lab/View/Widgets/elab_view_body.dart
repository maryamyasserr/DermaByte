import 'package:dermabyte/Core/Widgets/custom_appbar.dart';
import 'package:dermabyte/Core/utils/assets.dart';
import 'package:dermabyte/Core/utils/font_styels.dart';
import 'package:dermabyte/Features/E-lab/View/Widgets/lab_item.dart';
import 'package:flutter/material.dart';

class ElabViewBody extends StatelessWidget {
  ElabViewBody({super.key});
  
 final List<LabItem> labs = [
      LabItem(
        iconCard: Assets.kAlphaScan,
        labTitle: 'Alpha Scan',
        labSubTitle: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
        onPressed: () {

        },
        textButton: 'Reserve',
      ),
      LabItem(
        iconCard: Assets.kMokhtabarIcon,
        labTitle: 'Al Mokhtabar',
        labSubTitle: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
        onPressed: () {

        },
        textButton: 'Reserve',
      ),
      LabItem(
        iconCard: Assets.kSpeedlabIcon,
        labTitle: 'Speed lab',
        labSubTitle: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
        onPressed: () {

        },
        textButton: 'Reserve',
      ),
      LabItem(
        iconCard: Assets.kAlphaScan,
        labTitle: 'Sedra lab',
        labSubTitle: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
        onPressed: () {
          
        },
        textButton: 'Reserve',
      ),
    ];

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
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
            Expanded(
              child: ListView.builder(
                itemCount: labs.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      labs[index],
                      SizedBox(height: mediaQuery.height * 0.02),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}