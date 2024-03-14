import 'package:dermabyte/Features/E-doctor%20Reservation/Presentaion/View/Widgets/time_widget.dart';
import 'package:flutter/material.dart';

class AllFreeTime extends StatefulWidget {
  AllFreeTime({Key? key}) : super(key: key);

  @override
  State<AllFreeTime> createState() => _AllFreeTimeState();
}

class _AllFreeTimeState extends State<AllFreeTime> {
  String? selectedTime;

  void selectTime(String time) {
    setState(() {
      if (selectedTime == time) {
        selectedTime = null; // Allow deselecting the current selection.
      } else {
        selectedTime = time;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // Example times, replace with your actual time data.
    List<String> times = [
    "08:00",
    "08:30",
    "09:00",
    "09:30",
    "10:00",
    "10:30",
    "11:00",
    "11:30",
    "12:00",
    "12:30",
    "01:00",
    "01:30",
  ];

    return Wrap(
      verticalDirection: VerticalDirection.down,
      spacing: 16,
      runSpacing: 12,
      children: times.map((e) => SizedBox(
        height: 47,
        child: TimeWidget(
          title: e,
          isSelected: selectedTime == e,
          onSelect: () => selectTime(e),
        ),
      )).toList(),
    );
  }
}