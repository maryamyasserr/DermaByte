import 'package:flutter/material.dart';

class CustomScanBottomSheet extends StatefulWidget {
  const CustomScanBottomSheet(
      {super.key, required this.tests, required this.onTap});
  final List<String> tests;
  final void Function() onTap;

  @override
  State<CustomScanBottomSheet> createState() => _CustomScanBottomSheetState();
}

class _CustomScanBottomSheetState extends State<CustomScanBottomSheet> {
  final List<String> selectedTests = [];
  void changeSelect(String selectedValue, bool isSelected) {
    setState(() {
      if (isSelected) {
        selectedTests.add(selectedValue);
      } else {
        selectedTests.remove(selectedValue);
      }
    });
  }

  void cancel() {
    Navigator.pop(context);
  }

  void sumbit() {
    Navigator.pop(context, selectedTests);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Choose your required tests.'),
      content: SingleChildScrollView(
        child: ListBody(
            children: widget.tests
                .map((tests) => GestureDetector(
                      onTap: widget.onTap,
                      child: CheckboxListTile(
                        value: selectedTests.contains(tests),
                        title: Text(tests),
                        controlAffinity: ListTileControlAffinity.leading,
                        onChanged: (isChecked) =>
                            changeSelect(tests, isChecked!),
                      ),
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
