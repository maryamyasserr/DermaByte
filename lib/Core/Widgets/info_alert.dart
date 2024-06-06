import 'package:dermabyte/Core/utils/assets.dart';
import 'package:dermabyte/Core/utils/colors.dart';
import 'package:dermabyte/Core/utils/font_styels.dart';
import 'package:dermabyte/Features/Patient_Reservaions/Data/Models/lab_reseervation_model/lab_reseervation_model.dart';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


void infoAlert(
    {required BuildContext context,
    required String location,
    required PLabReservationModel tests}) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true, // Enable scrolling
    builder: (context) {
      return SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(Assets.kBackground),
              fit: BoxFit.fill,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Lab Reservation Details",
                      style: Styels.textStyle40(context)
                          .copyWith(fontSize: 27, decoration: TextDecoration.underline),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    const Icon(Icons.location_on_rounded, color: AppColors.kPrimaryColor),
                    const SizedBox(width: 4),
                    Text("Location : ", style: Styels.textStyle20_700(context)),
                    Text(location, style: Styels.textStyle20_700(context)),
                  ],
                ),
                const SizedBox(height: 15),
                Row(
                  children: [
                    const Icon(
                      FontAwesomeIcons.prescriptionBottle,
                      color: AppColors.kPrimaryColor,
                      size: 20,
                    ),
                    const SizedBox(width: 6),
                    Text(
                      "Tests",
                      style: Styels.textStyle40(context).copyWith(fontSize: 27, decoration: TextDecoration.underline),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                ListView.builder(
                  itemCount: tests.test!.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        "- ""${tests.test![index].name!}",
                        style: Styels.textStyle20_700(context)
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}

// void infoAlert(
//     {required BuildContext context,
//     required String location,
//     required PLabReservationModel tests}) {
//   showModalBottomSheet(
//       context: context,
//       builder: (context) {
//         return Container(
//           decoration: const BoxDecoration(
//               image: DecorationImage(
//                   image: AssetImage(Assets.kBackground), fit: BoxFit.fill)),
//           child: Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Column(
//               children: [
//                 const SizedBox(height: 12),
//               Text("Lab Reservation Details",style: Styels.textStyle40(context).copyWith(fontSize: 27,decoration: TextDecoration.underline)),
//               const SizedBox(height: 36),
//               Row(
//                 children: [

//                 const Icon(Icons.location_on_rounded,color: AppColors.kPrimaryColor,),
//                 const SizedBox(width: 4),
//                 Text("Location : ",style: Styels.textStyle20_700(context)),
                
//                  Text(location,style: Styels.textStyle20_700(context),)
//                  ],
//               ),
//               const SizedBox(height: 15),
//               Row(
//                 children: [
//                   const Icon(
//                     FontAwesomeIcons.prescriptionBottle,
//                     color: AppColors.kPrimaryColor,
//                     size: 20,
//                   ),
//                   const SizedBox(width: 6),
//                    Text("Tests",style: Styels.textStyle40(context).copyWith(fontSize: 27,decoration: TextDecoration.underline)),
//                 ],
//               ),
//               const SizedBox(height: 16),
//               ListView.builder(
//                   itemCount: tests.test!.length,
//                   shrinkWrap: true,
//                   physics: const NeverScrollableScrollPhysics(),
//                   itemBuilder: (context, index) {
//                     return Padding(
//                       padding: const EdgeInsets.symmetric(horizontal:  8.0),
//                       child: Text(
//                         "- ""${tests.test![index].name!}",style: Styels.textStyle20_300(context),),
//                     );
//                   })
//             ]),
//           ),
//         );
//       });
// }
