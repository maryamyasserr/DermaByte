import 'package:dermabyte/Core/Widgets/loading_indicator.dart';
import 'package:dermabyte/Core/utils/assets.dart';
import 'package:dermabyte/Core/utils/colors.dart';
import 'package:dermabyte/Core/utils/font_styels.dart';
import 'package:dermabyte/Features/E-lab/Data/lab_service_data.dart';
import 'package:dermabyte/Features/E-lab/Presentation/View/Widgets/lab_service_item.dart';
import 'package:dermabyte/Features/E-lab/Presentation/View_model/Lab%20Details%20Cubit/lab_details_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class ScanViewBody extends StatelessWidget {
  var serviceList = LabServiceData.labServices();
  ScanViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(Assets.kBackground),
          fit: BoxFit.cover,
        ),
      ),
      child: BlocBuilder<LabDetailsCubit, LabDetailsState>(
          builder: (context, state) {
        if (state is LabDetailsFailure) {
          return Center(
            child: Text(state.errMessage),
          );
        } else if (state is LabDetailsSuccess) {
          return Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 8,
            ),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 80),
                  Text(
                    state.labDetails.name!,
                    style:
                        Styels.textStyle20_700(context).copyWith(fontSize: 28),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 32),
                  Text(
                    'Services',
                    style:
                        Styels.textStyle20_700(context).copyWith(fontSize: 24),
                    textAlign: TextAlign.left,
                  ),
                  Expanded(
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 30,
                              crossAxisSpacing: 10,
                              childAspectRatio: 0.8),
                      itemBuilder: (context, index) {
                        return LabServiceItem(
                            labServiceData: serviceList[index]);
                      },
                      itemCount: serviceList.length,
                    ),
                  )
                ]),
          );
        } else {
          return const LoadingIndicator(color: AppColors.kPrimaryColor);
        }
      }),
    );
  }
}
