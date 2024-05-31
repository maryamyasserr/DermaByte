import 'package:dermabyte/Core/utils/colors.dart';
import 'package:dermabyte/Core/utils/font_styels.dart';
import 'package:flutter/material.dart';

class ScheduleDay extends StatelessWidget {
  const ScheduleDay({
    super.key,
    required this.day,
    required this.startTime,
    required this.endTime,
    required this.updateStartTime,
    required this.updateEndTime,
    required this.deleteDay,
  });
  final String day, startTime, endTime;
  final void Function() updateStartTime, updateEndTime, deleteDay;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(day, style: Styels.textStyle24_600(context)),
            IconButton(
                onPressed: deleteDay,
                padding: EdgeInsets.zero,
                icon: const Icon(Icons.delete,
                    color: AppColors.kPrimaryColor, size: 30))
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Start Time : $startTime",
                style: Styels.textStyle18_300(context)),
            IconButton(
                onPressed: updateStartTime,
                icon: const Icon(Icons.edit,
                    color: AppColors.kPrimaryColor, size: 24))
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("End Time : $endTime", style: Styels.textStyle18_300(context)),
            IconButton(
                onPressed: updateEndTime,
                icon: const Icon(Icons.edit,
                    color: AppColors.kPrimaryColor, size: 24))
          ],
        ),
        const Divider(
          height: 20,
          color: AppColors.kPrimaryColor,
        )
      ],
    );
  }
}
