import 'package:dermabyte/Core/utils/assets.dart';
import 'package:dermabyte/Core/utils/font_styels.dart';
import 'package:dermabyte/Core/utils/routes.dart';
import 'package:dermabyte/Features/Scan/View/Widgets/custom_scan_widget.dart';
import 'package:dermabyte/Features/Scan/View/Widgets/scan_progress_view_body.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

class ScanWaysViewBody extends StatefulWidget {
  const ScanWaysViewBody({super.key});

  @override
  State<ScanWaysViewBody> createState() => _ScanWaysViewBodyState();
}

class _ScanWaysViewBodyState extends State<ScanWaysViewBody> {
  Future<void> uploadPicture() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      // ignore: use_build_context_synchronously
      Navigator.push(context,MaterialPageRoute(
          builder: (context) => ScanProgressViewBody(imagePath: pickedFile.path),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(Assets.kBackground),
          fit: BoxFit.fill,
        ),
      ),
      child: Column(children: [
        SizedBox(height: mediaQuery.height * 0.12),
        Text(
          'How do you want your',
          style: Styels.textStyle20_700(context),
        ),
        Text(
          'Scan Taken ?',
          style: Styels.textStyle20_700(context),
        ),
        SizedBox(height: mediaQuery.height * 0.033),
        GestureDetector(
          onTap: (){
            GoRouter.of(context).push(AppRoutes.kCameraView);
          },
          child: CustomScanWidget(
            image: Assets.kTakePhoto,
            title: 'Take a photo',
            subTitle: 'take a picture of the\nskin change you want\nto check.',
          ),
        ),
        SizedBox(height: mediaQuery.height * 0.01),
        GestureDetector(
          onTap: uploadPicture,
          child: CustomScanWidget(
            image: Assets.kUploadPhoto,
            title: 'Upload picture',
            subTitle:
                'upload an existing\npicture of the skin\nchange you want\nto check.',
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Container(
            height: mediaQuery.height * 0.2089,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.black),
            ),
            child: Row(children: [
              SizedBox(width: mediaQuery.width * 0.07),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: mediaQuery.height * 0.025),
                  Text(
                    'What are the possibilities?',
                    style: Styels.textStyle20_700(context),
                  ),
                  SizedBox(height: mediaQuery.height * 0.025),
                  Text(
                    'learn about all the possible cases of\nskin changes we cover in our app\nand how to avoid them.',
                    style: Styels.textStyle18_400(context),
                  ),
                ],
              )
            ]),
          ),
        )
      ]),
    );
  }
}
