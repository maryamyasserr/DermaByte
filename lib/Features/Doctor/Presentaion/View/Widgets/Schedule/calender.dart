import 'package:dermabyte/Core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:weekly_calendar/weekly_calendar.dart';

class WeekCalender extends StatelessWidget {
  const WeekCalender({
    super.key, required this.onChangedSelectedDate,
  });

  final dynamic Function(DateTime) onChangedSelectedDate;
  @override
  Widget build(BuildContext context) {
    return WeeklyCalendar(
      calendarStyle: const CalendarStyle(
        locale: "en_US",
        padding: EdgeInsets.symmetric(vertical: 14, horizontal: 15),
        margin: EdgeInsets.all(14),
        decoration: BoxDecoration(
            color: AppColors.kPrimaryColor,
            borderRadius: BorderRadius.all(Radius.circular(14))),
        headerDateTextColor: Colors.white,
        headerDateTextAlign: Alignment.center,
        isShowHeaderDateText: false,
        footerDateTextColor: Colors.white,
        footerDateTextAlign: Alignment.center,
        isShowFooterDateText: false,
        selectedCircleColor: Colors.white,
        todaySelectedCircleColor: Colors.white,
        dayTextColor: Colors.white,
        todayDayTextColor: Colors.greenAccent,
        selectedDayTextColor: Colors.black,
        weekendDayTextColor: Colors.grey,
        dayOfWeekTextColor: Colors.white,
        weekendDayOfWeekTextColor: Colors.grey,
      ),
      isAutoSelect: true,
      onChangedSelectedDate: onChangedSelectedDate,
      onChangedPage: (date, state) {
        debugPrint("onChangedPage: $date ${state.name}");
      },
    );
  }
}
