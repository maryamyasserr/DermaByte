
import 'package:dermabyte/Core/utils/font_styels.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ServiceItem extends StatelessWidget {
  const ServiceItem({
    super.key,
    required this.testName,
    required this.cost,
  });
  final String testName, cost;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(20)),
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                offset: Offset(0.0, 2.6),
                blurRadius: 6.0,
              )
            ]),
        child: Padding(
          padding: const EdgeInsets.only(top: 10, left: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(
                Icons.medical_information,
                size: 40,
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                testName,
                style: Styels.textStyle18_600(context),
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                cost,
                style: Styels.textStyle15_400(context),
              )
            ],
          ),
        ),
      ),
    );
  }
}
