import 'dart:io';
import 'package:dermabyte/Core/utils/assets.dart';
import 'package:dermabyte/Core/utils/colors.dart';
import 'package:dermabyte/Core/utils/font_styels.dart';
import 'package:dermabyte/Features/Authentication/Presentation/View%20Model/Auth%20Helper/auth_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class LabPic extends StatelessWidget {
  const LabPic({super.key});

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
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
                      child: BlocBuilder<AuthHelperCubit, AuthHeplerState>(
                        builder: (context, state) {
                          if (state is AuthHelperSuccess) {
                            if (BlocProvider.of<AuthHelperCubit>(context)
                                    .profileLab
                                    ?.path !=
                                null) {
                              return ClipOval(
                                child: SizedBox(
                                    width: mediaQuery.width *
                                        0.25, // Adjust the size as needed
                                    height: mediaQuery.height * 0.12,
                                    child: Image.file(
                                      File(BlocProvider.of<AuthHelperCubit>(
                                              context)
                                          .profileLab!
                                          .path),
                                      fit: BoxFit.cover,
                                    )),
                              );
                            }else{
                               return ClipOval(
                                child: SizedBox(
                                    width: mediaQuery.width *
                                        0.25, // Adjust the size as needed
                                    height: mediaQuery.height * 0.12,
                                    child: SvgPicture.asset(Assets.kProfileAvatar)),
                              );
                            }
                          }else{
                             return ClipOval(
                                child: SizedBox(
                                    width: mediaQuery.width *
                                        0.25, // Adjust the size as needed
                                    height: mediaQuery.height * 0.12,
                                    child: SvgPicture.asset(Assets.kProfileAvatar)),
                              );
                          }
                        }
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: GestureDetector(
                      onTap: () async {
                        await BlocProvider.of<AuthHelperCubit>(context)
                            .uploadPicture(role: 'l');
                        // BlocProvider.of<AuthHelperCubit>(context).convertoFile();
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
                    style: Styels.textStyle20_200(context)
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
