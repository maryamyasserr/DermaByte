import 'package:dermabyte/Core/Widgets/err_widget.dart';
import 'package:dermabyte/Core/utils/font_styels.dart';
import 'package:dermabyte/Features/Lab/Data/Models/lab_reservations/lab_reservations.dart';
import 'package:dermabyte/Features/Lab/Presentation/View/Widget/Home/file_upload.dart';
import 'package:dermabyte/Features/Lab/Presentation/View_Model/Lab%20Reservaions%20Cubit/lab_reservations_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PatientTestRequestedLab extends StatelessWidget {
  const PatientTestRequestedLab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    LabReservations? reservatino =
        BlocProvider.of<LabReservationsCubit>(context).currentReservation;
    return reservatino == null
        ? const ErrWidget(errMessage: "Something is wrong")
        : Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              "Test requested.",
              style: Styels.textStyle24_600(context)
                  .copyWith(fontSize: 26, decoration: TextDecoration.underline),
            ),
            const SizedBox(height: 10),
            ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Text("testt",
                            // "- ${reservatino.test?[index].name ?? ""}",
                            style: Styels.textStyle24_600(context)),
                      ),
                      const SizedBox(height: 7),
                       FileUpload(
                        index: index,
                      ),
                      const SizedBox(
                        height: 12,
                      )
                    ],
                  );
                }),
          ]);
  }
}
