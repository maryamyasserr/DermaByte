import 'package:dermabyte/Core/utils/font_styels.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class UpdateProfileOne extends StatelessWidget {
  const UpdateProfileOne({
    super.key,
    required this.hintText,
    required this.title,
    required this.onPressed,
    required this.controller,
  });

  final TextEditingController controller;

  final String hintText, title;

  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Center(
          child: Text(
        'Update $title',
        style: Styels.textStyle24_600(context),
      )),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextField(
            controller: controller,
            decoration: InputDecoration(
                hintText: hintText, hintStyle: const TextStyle(fontSize: 18)),
          ),
        ],
      ),
      actions: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              child: Text('Cancel', style: Styels.textStyle18_600(context)),
              onPressed: () {
                GoRouter.of(context).pop();
              },
            ),
            const SizedBox(width: 7),
            TextButton(
              onPressed: onPressed,
              child: Text('Update', style: Styels.textStyle18_600(context)),
            ),
          ],
        ),
      ],
    );
  }
}


//  import 'package:dermabyte/Core/utils/font_styels.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';

// Future<void> updateDialog({
//   required BuildContext context,
//   required String title,
//   required String hintText,
//   required String labelText,
//   required void Function()? onPressed

// }) async {
//     TextEditingController controller = TextEditingController();

//     return showModalBottomSheet<void>(
//       context: context, 
//       builder: (BuildContext context) {
//         return Material(
//           child: CupertinoAlertDialog(
//             title: Text('Update $title'),
//             content: SingleChildScrollView(
//               child: ListBody(
//                 children: <Widget>[
//                   const Text('Enter new text:'),
//                   TextField(
//                     controller: controller,
//                     decoration: InputDecoration(
//                       labelText: labelText,
//                       hintText: hintText
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             actions: <Widget>[
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   TextButton(
//                     child: Text('Cancel',style: Styels.textStyle16_400(context),),
//                     onPressed: () {
//                       Navigator.of(context).pop();
//                     },
//                   ),
//                   TextButton(
//                     onPressed: onPressed,
//                     child: Text('Update',style: Styels.textStyle16_400(context))
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }