import 'package:flutter/material.dart';

class ErrWidget extends StatelessWidget {
  const ErrWidget({super.key, required this.errMessage});
  final String errMessage;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [const Icon(Icons.error), Text(errMessage)],
      ),
    );
  }
}
