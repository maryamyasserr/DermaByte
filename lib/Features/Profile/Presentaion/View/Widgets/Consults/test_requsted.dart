import 'package:dermabyte/Core/utils/font_styels.dart';
import 'package:flutter/material.dart';

class TestRequested extends StatelessWidget {
  const TestRequested({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
        return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            "Test requested.",
            style: Styels.textStyle24_600(context),
          ),
          const SizedBox(height: 10),
          ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 4,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Text(
                    "- Melanoma Test",
                    style: Styels.textStyle15_300(context),
                  ),
                );
              }),
        ]);
      
  }
}
