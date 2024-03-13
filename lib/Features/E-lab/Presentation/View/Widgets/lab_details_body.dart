import 'package:dermabyte/Core/utils/assets.dart';

import 'package:dermabyte/Core/utils/font_styels.dart';
import 'package:dermabyte/Features/Authentication/Data/Models/lab_model/lab_model.dart';
import 'package:dermabyte/Features/E-lab/Presentation/View_model/Elab%20Cubit/elab_cubit.dart';
import 'package:dermabyte/Features/Lab/Presentation/View/Widget/Lab%20Services/service_item.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class LabDetailsViewBody extends StatelessWidget {
  const LabDetailsViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    LabModel lab = BlocProvider.of<ELabCubit>(context).currentLab;
    return Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Assets.kBackground),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 8,
          ),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            const SizedBox(height: 80),
            Text(
              lab.firstName!,
              style: Styels.textStyle20_700(context).copyWith(fontSize: 28),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
            Text(
              'Services',
              style: Styels.textStyle20_700(context).copyWith(fontSize: 24),
              textAlign: TextAlign.left,
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 30,
                    crossAxisSpacing: 10,
                    childAspectRatio: 1),
                itemCount: lab.services!.length,
                itemBuilder: (context, index) {
                  return ServiceItem(
                    testName: lab.services![index].name!,
                    cost: lab.services![index].cost!.toString(),
                    
                  );
                },
              ),
            )
          ]),
        ));
  }
}
