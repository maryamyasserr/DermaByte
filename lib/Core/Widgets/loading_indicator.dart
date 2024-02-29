import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({super.key, required this.color});
  final Color color;

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: CircularProgressIndicator(
        color:color ,
      ),
    );
  }
}
