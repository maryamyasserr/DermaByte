import 'package:dermabyte/Core/utils/font_styels.dart';
import 'package:dermabyte/Features/E-doctor%20Reservation/Data/Models/free_time_model.dart';
import 'package:dermabyte/Features/E-doctor%20Reservation/Presentaion/View/Widgets/time_widget.dart';
import 'package:dermabyte/Features/E-doctor%20Reservation/Presentaion/View_Model/FreeTimes/free_times_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class MyFreeTimes extends StatefulWidget {
  const MyFreeTimes({Key? key}) : super(key: key);
  @override
  State<MyFreeTimes> createState() => _AllFreeTimeState();
}

class _AllFreeTimeState extends State<MyFreeTimes> {
  String? selectedTime;

  void selectTime(String time) {
    setState(() {
      if (selectedTime == time) {
        selectedTime = null;
      } else {
        selectedTime = time;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    FreeTimeModel? freetimes =
        BlocProvider.of<FreeTimesCubit>(context).currentFreeTime;
    return BlocBuilder<FreeTimesCubit, FreeTimesState>(
      builder: (context, state) {
        if (state is FreeTimesSuccess || state is FreeTimesLoading) {
          if (freetimes == null) {
            return Center(
              child: Text(
                "No Appoinments for this day",
                style: Styels.textStyle20_700(context),
              ),
            );
          } else {
            return GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: freetimes.freeTime!.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 24,
                    childAspectRatio: 2 / 1.1),
                itemBuilder: (context, index) {
                  return TimeWidget(
                    title:
                        "${freetimes.freeTime![index].hour.toString()}:${freetimes.freeTime![index].minute.toString().padLeft(2, '0')}",
                    isSelected: false,
                    onSelect: () {},
                  );
                });
          }
        } else {
          return Center(
            child: Text(
              "",
              style: Styels.textStyle20_700(context),
            ),
          );
        }
      },
    );
  }
}
