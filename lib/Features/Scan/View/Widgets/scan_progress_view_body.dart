import 'dart:io';
import 'package:dermabyte/Core/utils/colors.dart';
import 'package:dermabyte/Core/utils/font_styels.dart';
import 'package:flutter/material.dart';

class ScanProgressViewBody extends StatefulWidget {
  const ScanProgressViewBody({Key? key, required this.imagePath})
      : super(key: key);
  final String imagePath;

  @override
  State<ScanProgressViewBody> createState() => _ScanProgressViewBodyState();
}

class _ScanProgressViewBodyState extends State<ScanProgressViewBody> {
  bool resultsContainer = false;

  @override
  void initState() {
    super.initState();

    // Delay for 3 seconds before showing the empty container
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        setState(() {
          resultsContainer = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: FileImage(File(widget
                    .imagePath)), // Use FileImage to load image from file path
                fit: BoxFit.fill,
              ),
            ),
          ),
          Positioned(
              bottom: 0,
              child: resultsContainer
                  ? Container(
                      height: mediaQuery.height * 0.7,
                      width: mediaQuery.width,
                      decoration: BoxDecoration(
                        color: AppColors.kWhiteColor,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 25, horizontal: 15),
                        child: SingleChildScrollView(
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'We think it’s:',
                                  style: Styels.textStyle18_600
                                      .copyWith(fontSize: 22),
                                ),
                                SizedBox(height: mediaQuery.height * 0.020),
                                Text(
                                  'Melanoma',
                                  style: Styels.textStyle20_300
                                      .copyWith(fontSize: 24),
                                ),
                                SizedBox(height: mediaQuery.height * 0.020),
                                Text(
                                  'Which is a type of skin cancer. We advise\nyou to see a doctor and discuss\npossible treatments.',
                                  style: Styels.textStyle20_300
                                      .copyWith(fontSize: 16),
                                ),
                                SizedBox(height: mediaQuery.height * 0.020),
                                Container(
                                    height: mediaQuery.height * 0.19,
                                    width: double.infinity,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15, vertical: 10),
                                    decoration: BoxDecoration(
                                        color: AppColors.kPrimaryColor,
                                        borderRadius: BorderRadius.circular(20),
                                        boxShadow: const [
                                          BoxShadow(
                                            color: Colors.grey,
                                            offset: Offset(0.0, 2.6),
                                            blurRadius: 8.0,
                                          )
                                        ]),
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Reminder!',
                                            style: Styels.textStyle20_700
                                                .copyWith(
                                                    fontSize: 20,
                                                    color: AppColors.kWhiteColor),
                                          ),
                                          SizedBox(height: mediaQuery.height * 0.005),
                                          Text(
                                            'our diagnoses should not be treated as a professional examination, it’s always better to consult a doctor and make sure of your condition.',
                                           maxLines: 4,
                                            style: Styels.textStyle18_300
                                                .copyWith(
                                                    fontSize: 16,
                                                    color: AppColors.kWhiteColor),
                                          ),
                                        ])),
                                        SizedBox(height: mediaQuery.height * 0.020),
                                const Divider(
                                  color: Color.fromRGBO(0, 0, 0, 0.4),
                                  endIndent: 5,
                                  indent: 5,
                                  thickness: 1,
                                ),
                                SizedBox(height: mediaQuery.height * 0.020),
                                Text(
                                  'What is Melanoma?',
                                  style: Styels.textStyle20_300,
                                ),
                                SizedBox(height: mediaQuery.height * 0.01),
                                Text(
                                  'Lorem ipsum dolor sit amet, consectetur\nadipiscing elit. Sed vehicula porttitor\neros, ut sagittis augue gravida eu\nDonec dictum, elit mollis lobortis elei',
                                  style: Styels.textStyle20_300
                                      .copyWith(fontSize: 16),
                                ),
                              ]),
                        ),
                      ),
                    )
                  : Container(
                      height: mediaQuery.height * 0.2,
                      width: mediaQuery.width,
                      decoration: BoxDecoration(
                        color: AppColors.kWhiteColor,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 25),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  Text(
                                    'Scan in progress',
                                    textAlign: TextAlign.center,
                                    style: Styels.textStyle18_600
                                        .copyWith(fontSize: 25),
                                  ),
                                  SizedBox(height: mediaQuery.height * 0.020),
                                  const CircularProgressIndicator(
                                    color: AppColors.kPrimaryColor,
                                  )
                                ],
                              ),
                            ]),
                      ),
                    ))
        ],
      ),
    );
  }
}
