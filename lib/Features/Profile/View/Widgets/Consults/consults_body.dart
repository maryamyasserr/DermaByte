import 'package:dermabyte/Core/Widgets/custom_appBar.dart';
import 'package:dermabyte/Core/utils/assets.dart';
import 'package:dermabyte/Features/Profile/View/Widgets/Consults/consults_body_section.dart';
import 'package:dermabyte/Features/Profile/View/Widgets/Consults/consults_header_section.dart';
import 'package:flutter/material.dart';

class ConsultsBody extends StatelessWidget {
  const ConsultsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  Assets.kBackground,
                ),
                fit: BoxFit.fill)),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              const CustomAppBar(title: "History"),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              const ConsutlsHeaderSection(),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.014,
              ),
              const ConsultsBodySection(),
              const SizedBox(height: 8)
            ],
          ),
        ),
      ),
    );
  }
}
