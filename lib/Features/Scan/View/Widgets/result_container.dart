import 'package:dermabyte/Core/utils/colors.dart';
import 'package:dermabyte/Core/utils/font_styels.dart';
import 'package:flutter/material.dart';

class ResutlContainer extends StatelessWidget {
  const ResutlContainer({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.kWhiteColor,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Flexible(child: SizedBox(height: 32)),
          Text(
            'We think it’s:',
            style: Styels.textStyle18_600(context).copyWith(fontSize: 22),
          ),
          const SizedBox(height: 8),
          Text(
            'Melanoma',
            style: Styels.textStyle20_300(context).copyWith(fontSize: 24),
          ),
          const SizedBox(height: 6),
          Text(
            'Which is a type of skin cancer. We advise\nyou to see a doctor and discuss\npossible treatments.',
            style: Styels.textStyle20_300(context).copyWith(fontSize: 16),
          ),
          const Flexible(
            child: SizedBox(
              height: 32,
            ),
          ),
          AspectRatio(
            aspectRatio: 340 / 140,
            child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Reminder!',
                        style: Styels.textStyle20_700(context).copyWith(
                            fontSize: 20, color: AppColors.kWhiteColor),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'our diagnoses should not be treated as a professional examination, it’s always better to consult a doctor and make sure of your condition.',
                        maxLines: 4,
                        style: Styels.textStyle18_300(context).copyWith(
                            fontSize: 16, color: AppColors.kWhiteColor),
                      ),
                    ])),
          ),
          const Divider(
            color: Color.fromRGBO(0, 0, 0, 0.4),
            endIndent: 5,
            indent: 5,
            thickness: 1,
            height: 50,
          ),
          Text(
            'What is Melanoma?',
            style: Styels.textStyle20_300(context),
          ),
          const SizedBox(height: 8),
          Text(
            'Lorem ipsum dolor sit amet, consectetur\nadipiscing elit. Sed vehicula porttitor\neros, ut sagittis augue gravida eu\nDonec dictum, elit mollis lobortis elei',
            style: Styels.textStyle20_300(context).copyWith(fontSize: 16),
          ),
        ]),
      ),
    );
  }
}
