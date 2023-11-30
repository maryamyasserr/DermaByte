import 'package:dermabyte/Core/utils/assets.dart';
import 'package:dermabyte/Core/utils/font_styels.dart';
import 'package:dermabyte/Features/E-lab/Data/lab_service_data.dart';
import 'package:dermabyte/Features/E-lab/View/Widgets/lab_service_item.dart';
import 'package:flutter/material.dart';

class ScanViewBody extends StatelessWidget {
  var serviceList = LabServiceData.labServices();
  ScanViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(Assets.kBackground),
          fit: BoxFit.cover,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: mediaQuery.height *0.09),
          Text(
            'Alpha Scan',
            style: Styels.textStyle20_700.copyWith(
              fontSize: 28
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: mediaQuery.height *0.05),
          Text(
            'Services',
            style: Styels.textStyle20_700.copyWith(
              fontSize: 24
            ),
            textAlign: TextAlign.left,
          ),
          SizedBox(
            height: 500,
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 20,
                crossAxisSpacing: 5 ,
              ),
              itemBuilder: (context, index) {
                return LabServiceItem(labServiceData: serviceList[index]);
              },
              itemCount: serviceList.length,
            ),
          )
        ]),
      ),
    );
  }
}
