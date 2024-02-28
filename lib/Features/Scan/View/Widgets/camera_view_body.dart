import 'package:dermabyte/Core/utils/assets.dart';
import 'package:dermabyte/Core/utils/colors.dart';
import 'package:dermabyte/Core/utils/font_styels.dart';
import 'package:dermabyte/Features/Scan/View/Widgets/scan_progress_view_body.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';

class CameraViewBody extends StatefulWidget {
  const CameraViewBody({super.key});

  @override
  State<CameraViewBody> createState() => _CameraViewBodyState();
}

class _CameraViewBodyState extends State<CameraViewBody> {
  bool switchValue = true;
  Color buttonColor = AppColors.kPrimaryColor;
  onChanged(bool newValue) {
    setState(() {
      switchValue = newValue;
    });
  }

  Future<void> takePhoto() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

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
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(Assets.kBackground),
          fit: BoxFit.fill,
        ),
      ),
      child: Column(
        children: [
          Expanded(
            child: Column(children: [
              const Flexible(
                child: SizedBox(height: 180),
              ),
              SvgPicture.asset(Assets.kCameraIcon),
              const SizedBox(
                height: 56,
              ),
              Text(
                'Let’s take your',
                style: Styels.textStyle20_700(context).copyWith(
                    fontSize: 36, color: const Color.fromRGBO(15, 9, 82, 1)),
              ),
              Text(
                'first scan!',
                style: Styels.textStyle20_700(context).copyWith(
                    fontSize: 36, color: const Color.fromRGBO(15, 9, 82, 1)),
              ),
              const SizedBox(height: 48),
              Text(
                ' Please give us access to your',
                style: Styels.textStyle18_400(context)
                    .copyWith(color: const Color.fromRGBO(31, 24, 112, 1)),
              ),
              Text(
                'camera',
                style: Styels.textStyle18_400(context)
                    .copyWith(color: const Color.fromRGBO(31, 24, 112, 1)),
              ),
              const SizedBox(height: 32),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Allow Camera access',
                      style: Styels.textStyle20_700(context).copyWith(
                          fontWeight: FontWeight.w500,
                          color: const Color.fromRGBO(15, 9, 82, 0.8)),
                    ),
                    customSwitch(switchValue, (newValue) {
                      setState(() {
                        switchValue = newValue;
                        buttonColor =
                            switchValue ? AppColors.kPrimaryColor : Colors.grey;
                      });
                    })
                  ],
                ),
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              backgroundColor: buttonColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              )),
                          onPressed: buttonColor == AppColors.kPrimaryColor
                              ? () {
                                  takePhoto();
                                }
                              : null,
                          child: Text('Start scanning',
                              style: Styels.textStyle20_700(context)
                                  .copyWith(color: AppColors.kWhiteColor))),
                    ),
                  ),
                ],
              ),
              const Flexible(child: SizedBox(height: 12))
            ]),
          ),
        ],
      ),
    );
  }

  Widget customSwitch(bool value, Function onChanged) {
    return CupertinoSwitch(
        trackColor: Colors.grey,
        activeColor: AppColors.kPrimaryColor,
        value: value,
        onChanged: (newValue) {
          onChanged(newValue);
        });
  }
}
