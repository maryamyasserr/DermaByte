import 'package:dermabyte/Core/utils/font_styels.dart';
import 'package:dermabyte/Features/E-doctor%20Reservation/Presentaion/View/Widgets/time_widget.dart';
import 'package:dermabyte/Features/E-doctor%20Reservation/Presentaion/View_Model/FreeTimes/free_times_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class AllFreeTime extends StatefulWidget {
  const AllFreeTime({Key? key}) : super(key: key);
  @override
  State<AllFreeTime> createState() => _AllFreeTimeState();
}

class _AllFreeTimeState extends State<AllFreeTime> {
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
    return BlocBuilder<FreeTimesCubit, FreeTimesState>(
      builder: (context, state) {
        if (state is FreeTimesSuccess) {
          if (state.freeTime == null) {
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
                itemCount: state.freeTime!.freeTime!.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 24,
                    childAspectRatio: 2.1 / 1.2),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    child: TimeWidget(
                      title:
                          "${timeTitle(state.freeTime!.freeTime![index].hour)}:${state.freeTime!.freeTime![index].minute.toString().padLeft(2, '0')}"
                          " ${night(state.freeTime!.freeTime![index].hour)}",
                      isSelected:
                          selectedTime == state.freeTime!.freeTime![index].toString(),
                      onSelect: () {
                        selectTime(state.freeTime!.freeTime![index].toString());
                        if (selectedTime ==
                            state.freeTime!.freeTime![index].toString()) {
                          BlocProvider.of<FreeTimesCubit>(context)
                              .selectedDate = state.freeTime!.freeTime?[index];
                        } else {
                          BlocProvider.of<FreeTimesCubit>(context)
                              .selectedDate = null;
                        }
                      },
                    ),
                  );
                });
          }
        } else if(state is FreeTimesEmpty){
          return Center(
              child: Text(
                "No Appoinments for this day",
                style: Styels.textStyle20_700(context),
              ),
            );
        }
        
        else {
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

String timeTitle(int hour) {
  if (hour > 12) {
    int newHour = hour - 12;
    return newHour.toString();
  } else {
    return hour.toString();
  }
}

String night(int hour) {
  if (hour >= 12) {
    return 'PM';
  } else {
    return 'AM';
  }
}
