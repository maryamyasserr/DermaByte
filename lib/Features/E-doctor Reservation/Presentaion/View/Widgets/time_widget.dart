import 'package:dermabyte/Core/utils/colors.dart';
import 'package:dermabyte/Core/utils/font_styels.dart';
import 'package:flutter/material.dart';

class TimeWidget extends StatefulWidget {
  const TimeWidget({
    Key? key,
    required this.title,
    required this.isSelected,
    required this.onSelect,
  }) : super(key: key);

  final String title;
  final bool isSelected;
  final VoidCallback onSelect;

  @override
  State<TimeWidget> createState() => _TimeState();
}

class _TimeState extends State<TimeWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onSelect,
      child: AspectRatio(
        aspectRatio: 100 / 42,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: widget.isSelected ? AppColors.kPrimaryColor : Colors.white,
            boxShadow: const [
              BoxShadow(
                color: Colors.grey,
                offset: Offset(0.0, 2.6),
                blurRadius: 6.0,
              ),
            ],
          ),
          child: Center(
            child: Text(
              widget.title,
              style: Styels.textStyle16_400(context).copyWith(
                  color: widget.isSelected
                      ? Colors.white
                      : AppColors.kPrimaryColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w600),
            ),
          ),
        ),
      ),
    );
  }
}
