import 'package:dermabyte/Core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class Styels {
  static TextStyle textStyle40(BuildContext context) {
    return GoogleFonts.lexend(
        fontSize: getResponsiveFontSize(context, 40),
        fontWeight: FontWeight.w700,
        color: AppColors.kPrimaryColor);
  }

  static TextStyle textStyle20_700(BuildContext context) {
    return GoogleFonts.lexend(
        fontSize: getResponsiveFontSize(context, 20),
        fontWeight: FontWeight.w700,
        color: AppColors.kPrimaryColor);
  }

  static TextStyle textStyle20_200(BuildContext context) {
    return GoogleFonts.lexend(
        fontSize: getResponsiveFontSize(context, 20),
        fontWeight: FontWeight.w200,
        color: AppColors.kPrimaryColor);
  }

  static TextStyle textStyle20_300(BuildContext context) {
    return GoogleFonts.lexend(
        fontSize: getResponsiveFontSize(context, 20),
        fontWeight: FontWeight.w300,
        color: AppColors.kPrimaryColor);
  }

  static TextStyle textStyle15_300(BuildContext context) {
    return GoogleFonts.lexend(
        fontSize: getResponsiveFontSize(context, 15),
        fontWeight: FontWeight.w300,
        color: AppColors.kPrimaryColor);
  }

  static TextStyle textStyle18_400(BuildContext context) {
    return GoogleFonts.lexend(
        fontSize: getResponsiveFontSize(context, 18),
        fontWeight: FontWeight.w400,
        color: AppColors.kPrimaryColor);
  }

  static TextStyle textStyle24_600(BuildContext context) {
    return GoogleFonts.lexend(
        fontSize: getResponsiveFontSize(context, 24),
        fontWeight: FontWeight.w600,
        color: AppColors.kPrimaryColor);
  }

  static TextStyle textStyle18_600(BuildContext context) {
    return GoogleFonts.lexend(
        fontSize: getResponsiveFontSize(context, 18),
        fontWeight: FontWeight.w600,
        color: AppColors.kPrimaryColor);
  }

  static TextStyle textStylee20_700(BuildContext context) {
    return GoogleFonts.roboto(
        fontSize: getResponsiveFontSize(context, 20),
        fontWeight: FontWeight.w700,
        color: AppColors.kWhiteColor);
  }

  static TextStyle textStyle12_200(BuildContext context) {
    return GoogleFonts.lexend(
        fontSize: getResponsiveFontSize(context, 12),
        fontWeight: FontWeight.w200,
        color: AppColors.kPrimaryColor);
  }

  static TextStyle textStyle14_300(BuildContext context) {
    return GoogleFonts.lexend(
        fontSize: getResponsiveFontSize(context, 14),
        fontWeight: FontWeight.w300,
        color: AppColors.kPrimaryColor);
  }

  static TextStyle textStyle12_700(BuildContext context) {
    return GoogleFonts.lexend(
        fontSize: getResponsiveFontSize(context, 12),
        fontWeight: FontWeight.w700,
        color: AppColors.kPrimaryColor);
  }

  static TextStyle textStyle16_400(BuildContext context) {
    return GoogleFonts.lexend(
        fontSize: getResponsiveFontSize(context, 16),
        fontWeight: FontWeight.w400,
        color: AppColors.kPrimaryColor);
  }

  static TextStyle textStyle18_300(BuildContext context) {
    return GoogleFonts.lexend(
        fontSize: getResponsiveFontSize(context, 18),
        fontWeight: FontWeight.w300,
        color: AppColors.kPrimaryColor);
  }

  static TextStyle textStyle15_400(BuildContext context) {
    return GoogleFonts.lexend(
        fontSize: getResponsiveFontSize(context, 15),
        fontWeight: FontWeight.w400,
        color: AppColors.kPrimaryColor);
  }

  // static final textStyle40 = GoogleFonts.lexend(
  //     fontSize: 40,
  //     fontWeight: FontWeight.w700,
  //     color: AppColors.kPrimaryColor);

  // static final textStyle20_700 = GoogleFonts.lexend(
  //     fontSize: 20,
  //     fontWeight: FontWeight.w700,
  //     color: AppColors.kPrimaryColor);

  // static final textStyle20_200 = GoogleFonts.lexend(
  //     fontSize: 20,
  //     fontWeight: FontWeight.w200,
  //     color: AppColors.kPrimaryColor);

//   static final textStyle20_300 = GoogleFonts.lexend(
//       fontSize: 20,
//       fontWeight: FontWeight.w300,
//       color: AppColors.kPrimaryColor);
//   static final textStyle15_300 = GoogleFonts.lexend(
//       fontSize: 15,
//       fontWeight: FontWeight.w300,
//       color: AppColors.kPrimaryColor);
//   static final textStyle18_400 = GoogleFonts.lexend(
//       fontSize: 18,
//       fontWeight: FontWeight.w400,
//       color: AppColors.kPrimaryColor);

//   static final textStyle24_600 = GoogleFonts.lexend(
//       fontSize: 24,
//       fontWeight: FontWeight.w600,
//       color: AppColors.kPrimaryColor);
//   static final textStyle18_600 = GoogleFonts.lexend(
//       fontSize: 18,
//       fontWeight: FontWeight.w600,
//       color: AppColors.kPrimaryColor);
//   static final textStylee20_700 = GoogleFonts.roboto(
//       fontSize: 20, fontWeight: FontWeight.w700, color: AppColors.kWhiteColor);
//   static final textStyle12_200 = GoogleFonts.lexend(
//       fontSize: 12,
//       fontWeight: FontWeight.w200,
//       color: AppColors.kPrimaryColor);
//   static final textStyle14_300 = GoogleFonts.lexend(
//       fontSize: 14,
//       fontWeight: FontWeight.w300,
//       color: AppColors.kPrimaryColor);
//   static final textStyle12_700 = GoogleFonts.lexend(
//       fontSize: 12,
//       fontWeight: FontWeight.w700,
//       color: AppColors.kPrimaryColor);
//   static final textStyle16_400 = GoogleFonts.lexend(
//       fontSize: 16,
//       fontWeight: FontWeight.w400,
//       color: AppColors.kPrimaryColor);
//   static final textStyle18_300 = GoogleFonts.lexend(
//       fontSize: 18,
//       fontWeight: FontWeight.w300,
//       color: AppColors.kPrimaryColor);
//   static final textStyle15_400 = GoogleFonts.lexend(
//       fontSize: 15,
//       fontWeight: FontWeight.w400,
//       color: AppColors.kPrimaryColor);
// }
}

double getResponsiveFontSize(BuildContext context, double fontsize) {
  double scaleFactor = getScaleFactor(context);

  double responsiveFontSize = scaleFactor * fontsize;

  double lowerLimit = fontsize * 0.75;
  double upperLimit = fontsize * 1.25;
  return responsiveFontSize.clamp(lowerLimit, upperLimit);
}

double getScaleFactor(BuildContext context) {
  double width = MediaQuery.sizeOf(context).width;
  return width / 400;
}
