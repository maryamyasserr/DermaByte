import 'package:dermabyte/Core/Widgets/err_widget.dart';
import 'package:dermabyte/Core/Widgets/loading_indicator.dart';
import 'package:dermabyte/Core/utils/colors.dart';
import 'package:dermabyte/Core/utils/font_styels.dart';
import 'package:dermabyte/Features/Authentication/Presentation/View%20Model/Auth%20Cubit/auth_cubit.dart';
import 'package:dermabyte/Features/Scan/Presentaion/View%20Model/Create%20Scan%20Cubit/create_scan_cubit.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http_parser/http_parser.dart';

class ResutlContainer extends StatelessWidget {
  const ResutlContainer({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: AppColors.kWhiteColor,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20)),
      ),
      child: BlocBuilder<CreateScanCubit, CreateScanState>(
        builder: (context, state) {
          if (state is CreateScanSuccess) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Flexible(child: SizedBox(height: 32)),
                  Text(
                    'We think it’s: ( ${state.scanResult.diseaseName!} )',
                    style:
                        Styels.textStyle18_600(context).copyWith(fontSize: 22),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    state.scanResult.description!,
                    style:
                        Styels.textStyle20_300(context).copyWith(fontSize: 16),
                    maxLines: 6,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.start,
                  ),
                  const Divider(
                    color: Color.fromRGBO(0, 0, 0, 0.4),
                    endIndent: 5,
                    indent: 5,
                    thickness: 1,
                    height: 40,
                  ),
                  AspectRatio(
                    aspectRatio: 350 / 120,
                    child: Container(
                      padding:
                          const EdgeInsets.only(left: 15, right: 15, top: 10),
                      decoration: BoxDecoration(
                          color: AppColors.kPrimaryColor,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.grey,
                              offset: Offset(0.0, 2.6),
                              blurRadius: 8.0,
                            )
                          ]),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Reminder!',
                            style: Styels.textStyle20_700(context).copyWith(
                                fontSize: 20, color: AppColors.kWhiteColor),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'our diagnoses should not be treated as a professional examination, it’s always better to consult a doctor and make sure of your condition.',
                            maxLines: 4,
                            style: Styels.textStyle18_300(context).copyWith(
                                fontSize: 14, color: AppColors.kWhiteColor),
                          ),
                          const SizedBox(height: 8),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else if (state is CreateScanFailuer) {
            // BlocProvider.of<CreateScanCubit>(context).takePhotoPath = null;
            return ErrWidget(
              errMessage: state.errMessage,
              onTap: () async {
                FormData formData = FormData();
                formData.files.add(MapEntry(
                    'diseasePhoto',
                    await MultipartFile.fromFile(
                        BlocProvider.of<CreateScanCubit>(context)
                            .takePhotoPath!,
                        filename: 'profilePic.jpg',
                        contentType: MediaType('image', 'jpeg'))));
                await BlocProvider.of<CreateScanCubit>(context).createScan(
                    data: formData,
                    token: BlocProvider.of<AuthCubit>(context).patient!.token);
              },
            );
          } else {
            return const LoadingIndicator(color: AppColors.kPrimaryColor);
          }
        },
      ),
    );
  }
}
