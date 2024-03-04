import 'package:flutter/material.dart';

class CustomDayBottomSheet extends StatefulWidget {
  final List<String> days;
  const CustomDayBottomSheet({
    super.key,
    required this.days,
  });

  @override
  State<CustomDayBottomSheet> createState() => _CustomScanBottomSheetState();
}

class _CustomScanBottomSheetState extends State<CustomDayBottomSheet> {
  final List<String> selectedDays = [];
  void changeSelect(String selectedValue, bool isSelected) {
    setState(() {
      if (isSelected) {
        selectedDays.add(selectedValue);
      } else {
        selectedDays.remove(selectedValue);
      }
    });
  }

  void cancel() {
    Navigator.pop(context);
  }

  void sumbit() {
    Navigator.pop(context, selectedDays);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Choose your Days.'),
      content: SingleChildScrollView(
        child: ListBody(
            children: widget.days
                .map((days) => CheckboxListTile(
                      value: selectedDays.contains(days),
                      title: Text(days),
                      controlAffinity: ListTileControlAffinity.leading,
                      onChanged: (isChecked) => changeSelect(days, isChecked!),
                    ))
                .toList()),
      ),
      actions: [
        TextButton(onPressed: cancel, child: const Text('Cancel')),
        TextButton(onPressed: sumbit, child: const Text('Submit')),
      ],
    );
  }
}
