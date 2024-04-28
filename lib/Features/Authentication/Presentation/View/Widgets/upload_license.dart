import 'package:dermabyte/Core/utils/font_styels.dart';
import 'package:dermabyte/Features/Authentication/Presentation/View%20Model/Auth%20Helper/auth_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class UploadLicense extends StatelessWidget {
  const UploadLicense({
    super.key,
    required this.license,
    required this.role,
  });

  final List<XFile>? license;
  final String role;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthHelperCubit, AuthHeplerState>(
        builder: (context, state) {
      if (license == null || license!.isEmpty) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text(
                  'Scan your work license',
                  style: Styels.textStyle20_200(context),
                ),
              ],
            ),
            GestureDetector(
                onTap: () async {
                  await BlocProvider.of<AuthHelperCubit>(context)
                      .uploadLicense(role: role);
                },
                child: Image.asset(
                  'assets/images/upload_icon.png',
                ))
          ],
        );
      } else {
        return Column(
          children: [
            Column(
                children: license!
                    .map((e) => Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    e.name,
                                    style: Styels.textStyle20_200(context),
                                  ),
                                  const SizedBox(width: 8),
                                  const Icon(
                                    Icons.cloud_done_rounded,
                                    color: Colors.green,
                                    size: 27,
                                  )
                                ],
                              ),
                              GestureDetector(
                                  onTap: () async {
                                    await BlocProvider.of<AuthHelperCubit>(
                                            context)
                                        .uploadLicense(role: role);
                                  },
                                  child: GestureDetector(
                                      onTap: () {
                                        BlocProvider.of<AuthHelperCubit>(
                                                context)
                                            .removeLicense(e,role);
                                      },
                                      child: const Icon(
                                        Icons.cancel,
                                        color: Colors.red,
                                        size: 27,
                                      )))
                            ],
                          ),
                        ))
                    .toList()),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      'Scan your work license',
                      style: Styels.textStyle20_200(context),
                    ),
                  ],
                ),
                GestureDetector(
                    onTap: () async {
                      await BlocProvider.of<AuthHelperCubit>(context)
                          .uploadLicense(role: role);
                    },
                    child: Image.asset(
                      'assets/images/upload_icon.png',
                    ))
              ],
            )
          ],
        );
      }
    });
  }
}
