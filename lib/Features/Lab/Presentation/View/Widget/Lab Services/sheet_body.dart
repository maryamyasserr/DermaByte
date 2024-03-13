import 'package:dermabyte/Core/utils/assets.dart';
import 'package:dermabyte/Core/utils/colors.dart';
import 'package:dermabyte/Core/utils/font_styels.dart';
import 'package:flutter/material.dart';

class SheetBody extends StatelessWidget {
  const SheetBody(
      {super.key,
      required this.testName,
      required this.cost,
      required this.onPressed});

  final TextEditingController testName;
  final TextEditingController cost;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Assets.kBackground),
            fit: BoxFit.fill
          )
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: testName,
                keyboardType: TextInputType.name,
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(label: Text("Test Name")),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: cost,
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(label: Text("Cost")),
              ),
              const SizedBox(height: 42),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 50, vertical: 10),
                      backgroundColor: AppColors.kPrimaryColor),
                  onPressed: onPressed,
                  child: Text(
                    "Add",
                    style: Styels.textStyle20_700(context)
                        .copyWith(color: Colors.white),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
