import 'package:dermabyte/Core/utils/assets.dart';
import 'package:dermabyte/Core/utils/font_styels.dart';
import 'package:dermabyte/Core/utils/routes.dart';
import 'package:dermabyte/Features/Scan/View/Widgets/custom_scan_widget.dart';
import 'package:dermabyte/Features/Scan/View/Widgets/possibilities.dart';
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
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
              ScanProgressViewBody(imagePath: pickedFile.path),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return Column(
      children: [
        Expanded(
          child: Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(Assets.kBackground),
                fit: BoxFit.fill,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(children: [
                const Flexible(
                  child: SizedBox(
                    height: 62,
                  ),
                ),
                Text(
                  'How do you want your',
                  style: Styels.textStyle20_700(context).copyWith(fontSize: 22),
                ),
                Text(
                  'Scan Taken ?',
                  style: Styels.textStyle20_700(context).copyWith(fontSize: 22),
                ),
                const SizedBox(height: 24),
                GestureDetector(
                  onTap: () {
                    GoRouter.of(context).push(AppRoutes.kCameraView);
                  },
                  child: CustomScanWidget(
                    image: Assets.kTakePhoto,
                    title: 'Take a photo',
                    subTitle:
                        'take a picture of the\nskin change you want\nto check.',
                  ),
                ),
                SizedBox(height: mediaQuery.height * 0.05),
                GestureDetector(
                  onTap: uploadPicture,
                  child: CustomScanWidget(
                    image: Assets.kUploadPhoto,
                    title: 'Upload picture',
                    subTitle:
                        'upload an existing\npicture of the skin\nchange you want\nto check.',
                  ),
                ),
                const Divider(height: 50),
                Possibilities(mediaQuery: mediaQuery),
                const Flexible(child: SizedBox(height: 8))
              ]),
            ),
          ),
        ),
      ],
    );
  }
}
