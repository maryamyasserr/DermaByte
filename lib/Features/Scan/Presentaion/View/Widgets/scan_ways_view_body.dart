import 'package:dermabyte/Core/Widgets/failed_alert.dart';
import 'package:dermabyte/Core/utils/assets.dart';
import 'package:dermabyte/Core/utils/font_styels.dart';
import 'package:dermabyte/Core/utils/routes.dart';
import 'package:dermabyte/Features/Authentication/Presentation/View%20Model/Auth%20Cubit/auth_cubit.dart';
import 'package:dermabyte/Features/Scan/Presentaion/View%20Model/Create%20Scan%20Cubit/create_scan_cubit.dart';
import 'package:dermabyte/Features/Scan/Presentaion/View/Widgets/custom_scan_widget.dart';
import 'package:dermabyte/Features/Scan/Presentaion/View/Widgets/possibilities.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:http_parser/http_parser.dart';

class ScanWaysViewBody extends StatelessWidget {
  const ScanWaysViewBody({super.key});

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
                  onTap: () async {
                    await BlocProvider.of<CreateScanCubit>(context)
                        .uploadPicture(context);
                    if (BlocProvider.of<CreateScanCubit>(context)
                            .takePhotoPath ==
                        null) {
                      failedAlert(context, "No Photo is Uploaded");
                    } else {
                      FormData formData = FormData();
                      formData.files.add(MapEntry(
                          'diseasePhoto',
                          await MultipartFile.fromFile(
                              BlocProvider.of<CreateScanCubit>(context)
                                  .takePhotoPath!,
                              filename: 'profilePic.jpg',
                              contentType: MediaType('image', 'jpeg'))));
                      formData.fields
                          .addAll([const MapEntry('diseaseName', "Eczema")]);
                      await BlocProvider.of<CreateScanCubit>(context)
                          .createScan(
                              data: formData,
                              token: BlocProvider.of<AuthCubit>(context)
                                  .patient!
                                  .token);
                    }
                  },
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
