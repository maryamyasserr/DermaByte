import 'dart:io';
import 'package:dermabyte/Core/utils/assets.dart';
import 'package:dermabyte/Core/utils/colors.dart';
import 'package:dermabyte/Core/utils/font_styels.dart';
import 'package:dermabyte/Core/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

class ProfilePicture extends StatelessWidget {
  const ProfilePicture({super.key});
  Future<void> uploadPicture(BuildContext context) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      // ignore: use_build_context_synchronously
      GoRouter.of(context)
          .go('${AppRoutes.kSignUpDoctor}?imagePath=${pickedFile.path}');
    }
  }

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    final Map<String, dynamic>? args =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;

    String? imagePath = args?['imagePath'];
    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                  color: AppColors.kWhiteColor,
                  shape: BoxShape.circle),
              child: CircleAvatar(
                backgroundColor: const Color(0xffB9EEE8),
                radius: 50,
                child: ClipOval(
                  child: SizedBox(
                    width: mediaQuery.width * 0.25, // Adjust the size as needed
                    height: mediaQuery.height * 0.12,
                    child: imagePath != null
                        ? Image.file(
                            File(imagePath),
                            fit: BoxFit.cover,
                          )
                        : SvgPicture.asset(Assets.kProfileAvatar),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: GestureDetector(
                onTap: () {
                  uploadPicture(context);
                },
                child: const ImageIcon(
                  AssetImage('assets/images/upload_icon.png'),
                  size: 30,
                ),
              
              ),
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'add a picture',
              style: Styels.textStyle20_200
                  .copyWith(decoration: TextDecoration.underline),
            ),
            SizedBox(
              width: mediaQuery.width * 0.02,
            ),
            SvgPicture.asset(Assets.kRequiredIcon,
                height: mediaQuery.height * 0.01),
          ],
        ),
      ],
    );
  }
}
