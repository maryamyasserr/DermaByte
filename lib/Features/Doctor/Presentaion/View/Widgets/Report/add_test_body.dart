import 'package:dermabyte/Core/utils/colors.dart';
import 'package:dermabyte/Core/utils/font_styels.dart';
import 'package:flutter/material.dart';

class AddTestBody extends StatefulWidget {
  const AddTestBody({super.key});

  @override
  _AddTestBodyState createState() => _AddTestBodyState();
}

class _AddTestBodyState extends State<AddTestBody> {
  final List<TextEditingController> _controllers = [];

  @override
  void initState() {
    super.initState();
    _controllers.add(TextEditingController());
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  void _addTextField() {
    setState(() {
      _controllers.add(TextEditingController());
    });
  }

  List<Map<String, String>> generateTestsJson() {
    List<Map<String, String>> tests = _controllers.map((controller) {
      return {'testName': controller.text};
    }).toList();
    // String jsonTests = jsonEncode({'tests': tests});

    return tests;
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                    flex: 2,
                    child: SizedBox(
                      child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            "Required tests",
                            style: Styels.textStyle24_600(context),
                          )),
                    )),
                Expanded(
                  flex: 11,
                  child: ListView.builder(
                    itemCount: _controllers.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 4),
                        child: TextField(
                          controller: _controllers[index],
                          keyboardType: TextInputType.name,
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                              suffixIcon: IconButton(
                                icon: const Icon(
                                  Icons.delete,
                                  color: AppColors.kPrimaryColor,
                                  size: 25,
                                ),
                                onPressed: () {
                                  setState(() {
                                    _controllers.removeAt(index);
                                  });
                                },
                              ),
                              label: Text("Test Name ${index + 1}")),
                        ),
                      );
                    },
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.sizeOf(context).width * 0.3,
                        vertical: 15),
                    backgroundColor: AppColors.kPrimaryColor,
                  ),
                  onPressed: () {
                    List<Map<String, String>> testsJson = generateTestsJson();
                    print(testsJson);
                    // GoRouter.of(context).pop();
                  },
                  child: Text("Confirm",
                      style: Styels.textStyle20_700(context)
                          .copyWith(color: Colors.white)),
                ),
                const Expanded(flex: 2, child: SizedBox())
              ],
            ),
            Positioned(
              bottom: 20,
              right: 6,
              child: FloatingActionButton(
                backgroundColor: AppColors.kPrimaryColor,
                onPressed: _addTextField,
                shape: const CircleBorder(),
                child: const Icon(Icons.add, size: 35, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
