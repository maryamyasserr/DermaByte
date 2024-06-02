import 'package:cached_network_image/cached_network_image.dart';
import 'package:dermabyte/Core/utils/assets.dart';
import 'package:dermabyte/Core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProfilePhoto extends StatelessWidget {
  const ProfilePhoto({super.key, required this.radius, required this.photo});
  final double radius;
  final String? photo;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(2),
        decoration: const BoxDecoration(
            color: AppColors.kPrimaryColor, shape: BoxShape.circle),
        child: photo == null
            ? CircleAvatar(
                backgroundColor: const Color(0xffB9EEE8),
                radius: radius,
                child: SvgPicture.asset(Assets.kProfileAvatar),
              )
            : ClipOval(
                child: SizedBox(
                    width: MediaQuery.sizeOf(context).width * 0.25, // Adjust the size as needed
                    height: MediaQuery.sizeOf(context).height * 0.12,
                    child:CachedNetworkImage(imageUrl: photo!,fit: BoxFit.fill,)),
              ));
  }
}
