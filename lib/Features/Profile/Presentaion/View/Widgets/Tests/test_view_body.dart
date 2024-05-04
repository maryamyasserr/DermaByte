import 'package:cached_network_image/cached_network_image.dart';
import 'package:dermabyte/Core/Widgets/empty.dart';
import 'package:dermabyte/Core/utils/assets.dart';
import 'package:dermabyte/Core/utils/font_styels.dart';
import 'package:dermabyte/Features/Profile/Data/Models/test_model/test_model.dart';
import 'package:dermabyte/Features/Profile/Presentaion/View/Widgets/Tests/lab_info.dart';
import 'package:dermabyte/Features/Profile/Presentaion/View_Model/Cubits/Tests%20Cubit/tests_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TestViewBody extends StatelessWidget {
  const TestViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    TestModel test = BlocProvider.of<TestsCubit>(context).currentTest!;
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(Assets.kBackground), fit: BoxFit.fill)),
      child: Padding(
        padding: const EdgeInsets.only(right: 12, left: 12, top: 50),
        child: ListView(
          children: [
            // const TestLabPhoto(),
            Align(
                alignment: Alignment.topCenter,
                child: Text("Your Result", style: Styels.textStyle40(context))),
            const SizedBox(height: 30),
            LabInfo(info: "Test Name : ", data: test.testName!),
            LabInfo(info: 'Lab Name : ', data: test.lab.name ?? ""),
            LabInfo(info: 'Lab Loacation : ', data: test.lab.location ?? ""),
            LabInfo(
                info: 'Date : ',
                data:
                    "${test.testDate?.year ?? "2024"}/${test.testDate?.month ?? "3"}/${test.testDate?.day ?? "27"}"),
            const Divider(
              thickness: 0.3,
              color: Colors.black,
              height: 50,
            ),
            test.testResult!.isEmpty
                ? const Center(
                    child: EmptyWidget(
                    text: "No Test Results",
                  ))
                : ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: test.testResult!.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 30),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: AspectRatio(
                              aspectRatio: 0.85,
                              child: CachedNetworkImage(
                                imageUrl: test.testResult![index],
                                fit: BoxFit.fill,
                              ),
                            )),
                      );
                    })
          ],
        ),
      ),
    );
  }
}
