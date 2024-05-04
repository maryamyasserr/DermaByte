import 'package:dermabyte/Core/Widgets/custom_appBar.dart';
import 'package:dermabyte/Core/utils/assets.dart';
import 'package:dermabyte/Features/Profile/Data/Models/report_model/report_model.dart';
import 'package:dermabyte/Features/Profile/Presentaion/View/Widgets/Consults/consults_body_section.dart';
import 'package:dermabyte/Features/Profile/Presentaion/View/Widgets/Consults/consults_header_section.dart';
import 'package:dermabyte/Features/Profile/Presentaion/View/Widgets/Consults/dots_indicator.dart';
import 'package:dermabyte/Features/Profile/Presentaion/View_Model/Cubits/Reports%20Cubit/reports_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ConsultsBody extends StatefulWidget {
  const ConsultsBody({super.key});

  @override
  State<ConsultsBody> createState() => _ConsultsBodyState();
}

class _ConsultsBodyState extends State<ConsultsBody> {
  late PageController pageController;
  int currentIndex = 0;

  @override
  void initState() {
    pageController = PageController();
    pageController.addListener(() {
      currentIndex = pageController.page!.round();
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
        ReportModel consultaion =
        BlocProvider.of<ReportCubit>(context).currentConsultation!;
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                Assets.kBackground,
              ),
              fit: BoxFit.fill)),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            const CustomAppBar(title: "History"),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
             ConsutlsHeaderSection(
              pageController:pageController,
            ),
            DotsIndicator(
              currentPageIndex: currentIndex,
              count: consultaion.scan!.length,
              ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.014,
            ),
               const Divider(
          thickness: 0.7,
          color: Colors.black,
        ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.014,
            ),
            const ConsultsBodySection(),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
