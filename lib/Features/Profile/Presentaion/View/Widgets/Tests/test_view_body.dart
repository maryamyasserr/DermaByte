import 'package:dermabyte/Core/Widgets/err_widget.dart';
import 'package:dermabyte/Core/utils/assets.dart';
import 'package:dermabyte/Features/Profile/Data/Models/test_model/test_model.dart';
import 'package:dermabyte/Features/Profile/Presentaion/View/Widgets/Tests/lab_info.dart';
import 'package:dermabyte/Features/Profile/Presentaion/View/Widgets/Tests/lab_photo.dart';
import 'package:dermabyte/Features/Profile/Presentaion/View_Model/Cubits/Tests%20Cubit/tests_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TestViewBody extends StatelessWidget {
  const TestViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    TestModel? test = BlocProvider.of<TestsCubit>(context).currentTest;
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(Assets.kBackground), fit: BoxFit.fill)),
      child: test==null?
      const ErrWidget(errMessage: "Something is wrong")
      :
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 50),
        child: ListView(
          children: [
            const TestLabPhoto(),
            const SizedBox(height: 30),
            LabInfo(info: "Test Name : ", data: test.testName![0] ?? ""),
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
            AspectRatio(
              aspectRatio: 230 / 250,
              child: Image.asset(Assets.test),
            )
          ],
        ),
      ),
    );
  }
}
