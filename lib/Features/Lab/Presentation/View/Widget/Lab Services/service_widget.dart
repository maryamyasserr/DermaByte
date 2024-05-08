import 'package:dermabyte/Core/utils/font_styels.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ServiceWidget extends StatelessWidget {
  ServiceWidget({super.key, required this.serviceName});
  String serviceName;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(0.0, 2.6),
              blurRadius: 6.0,
            )
          ]),
      child: Text(
        serviceName,
        style: Styels.textStyle18_300(context),
        textAlign: TextAlign.center,
      ),
    );
  }
}
