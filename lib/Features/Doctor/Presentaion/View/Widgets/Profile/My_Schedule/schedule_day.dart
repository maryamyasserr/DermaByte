import 'package:dermabyte/Core/utils/colors.dart';
import 'package:dermabyte/Core/utils/font_styels.dart';
import 'package:dermabyte/Features/Doctor/Presentaion/View/Widgets/Profile/My_Schedule/text_field_editing.dart';
import 'package:flutter/material.dart';

class ScheduleDay extends StatelessWidget {
  const ScheduleDay(
      {Key? key,
      required this.day,
      required this.startTime,
      required this.endTime,
      required this.updateStartTime,
      required this.updateEndTime,
      required this.deleteDay,
      required this.hintText,
      required this.hintText2,
      required this.startTimeController,
      required this.endTimeController,
      required this.onChanged,
      required this.startTimingTitle,
      required this.startTimeEdit,
      required this.endTimeEdit,
      required this.enablEditEndTime,
      required this.endTimingTitles,
      required this.enableEditStartTime,
      required this.onChanged2,
      required this.labelStartTime,
      required this.labelEndTime})
      : super(key: key);

  final String day,
      startTime,
      endTime,
      hintText,
      hintText2,
      startTimingTitle,
      endTimingTitles,
      labelStartTime,
      labelEndTime;
  final void Function() updateStartTime,
      updateEndTime,
      deleteDay,
      enableEditStartTime,
      enablEditEndTime;

  final void Function(String?) onChanged, onChanged2;
  final bool startTimeEdit, endTimeEdit;
  final TextEditingController startTimeController, endTimeController;

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
                  color: AppColors.kPrimaryColor, size: 30),
            ),
          ],
        ),
        startTimeEdit != true
            ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Start Time : $startTime",
                      style: Styels.textStyle18_300(context)),
                  IconButton(
                    onPressed: enableEditStartTime,
                    icon: const Icon(Icons.edit,
                        color: AppColors.kPrimaryColor, size: 24),
                  ),
                ],
              )
            : Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: TextFieldEditing(
                  labelText: labelStartTime,
                  controller: startTimeController,
                  hintText: hintText,
                  timingTitle: startTimingTitle,
                  onChanged: onChanged,
                  onTap: updateStartTime,
                ),
              ),
        endTimeEdit != true
            ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("End Time : $endTime",
                      style: Styels.textStyle18_300(context)),
                  IconButton(
                    onPressed: enablEditEndTime,
                    icon: const Icon(Icons.edit,
                        color: AppColors.kPrimaryColor, size: 24),
                  ),
                ],
              )
            : TextFieldEditing(
                labelText: labelEndTime,
                controller: endTimeController,
                hintText: hintText2,
                timingTitle: endTimingTitles,
                onChanged: onChanged2,
                onTap: updateEndTime,
              ),
        const Divider(
          height: 20,
          color: AppColors.kPrimaryColor,
        ),
      ],
    );
  }
}
