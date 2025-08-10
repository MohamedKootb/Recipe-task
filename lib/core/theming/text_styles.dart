import 'package:flutter/material.dart';

import '../widgets/app_text_style.dart';
import 'app_colors.dart';

class FontConstants {
  const FontConstants._();

  static const fontFamily = 'inter';
}

class FontWeightHelper {
  const FontWeightHelper._();

  static const light = FontWeight.w300;
  static const regular = FontWeight.w400;
  static const medium = FontWeight.w500;
  static const semiBold = FontWeight.w600;
  static const bold = FontWeight.w700;
  static const extraBold = FontWeight.w800;
  static const black = FontWeight.w900;
}

class TextStyles {
  const TextStyles._();

  // Order: font size asc -> weight asc -> color name alphabetical
  static final font10MediumDarkGray = appTextStyle(
    fontSize: 10,
    color: AppColors.darkGray,
    fontWeight: FontWeightHelper.medium,
  );
  static final font11RegularBlack = appTextStyle(
    fontSize: 11,
    color: AppColors.black,
    fontWeight: FontWeightHelper.regular,
  );
  static final font11RegularDarkGray = appTextStyle(
    fontSize: 11,
    color: AppColors.darkGray,
    fontWeight: FontWeightHelper.regular,
  );
  static final font12SemiBoldBlack = appTextStyle(
    fontSize: 12,
    color: AppColors.black,
    fontWeight: FontWeightHelper.semiBold,
  );
  static final font12SemiBoldDarkGreen = appTextStyle(
    fontSize: 12,
    color: AppColors.darkGreen,
    fontWeight: FontWeightHelper.semiBold,
  );
  static final font12ExtraBoldDarkGreen = appTextStyle(
    fontSize: 12,
    color: AppColors.darkGreen,
    fontWeight: FontWeightHelper.extraBold,
  );
  static final font13RegularBlack = appTextStyle(
    fontSize: 13,
    color: AppColors.black,
    fontWeight: FontWeightHelper.regular,
  );
  static final font13SemiBoldBlack = appTextStyle(
    fontSize: 13,
    color: AppColors.black,
    fontWeight: FontWeightHelper.semiBold,
  );
  static final font13SemiBoldDarkGreen = appTextStyle(
    fontSize: 13,
    color: AppColors.darkGreen,
    fontWeight: FontWeightHelper.semiBold,
  );
  static final font14RegularDarkGray = appTextStyle(
    fontSize: 14,
    color: AppColors.darkGray,
    fontWeight: FontWeightHelper.regular,
  );
  static final font14MediumBlack = appTextStyle(
    fontSize: 14,
    color: AppColors.black,
    fontWeight: FontWeightHelper.medium,
  );
  static final font14MediumDarkGray = appTextStyle(
    fontSize: 14,
    color: AppColors.darkGray,
    fontWeight: FontWeightHelper.medium,
  );
  static final font14ExtraBoldBlack = appTextStyle(
    fontSize: 14,
    color: AppColors.black,
    fontWeight: FontWeightHelper.extraBold,
  );
  static final font16MediumBlack = appTextStyle(
    fontSize: 16,
    color: AppColors.black,
    fontWeight: FontWeightHelper.medium,
  );
  static final font16SemiBoldBlack = appTextStyle(
    fontSize: 16,
    color: AppColors.black,
    fontWeight: FontWeightHelper.semiBold,
  );
  static final font16BoldBlack = appTextStyle(
    fontSize: 16,
    color: AppColors.black,
    fontWeight: FontWeightHelper.bold,
  );
  static final font18SemiBoldBlack = appTextStyle(
    fontSize: 18,
    color: AppColors.black,
    fontWeight: FontWeightHelper.semiBold,
  );
  static final font20BoldBlack = appTextStyle(
    fontSize: 20,
    color: AppColors.black,
    fontWeight: FontWeightHelper.bold,
  );

  static final font24BlackDarkGreen = appTextStyle(
    fontSize: 24,
    color: AppColors.darkGreen,
    fontWeight: FontWeightHelper.black,
  );
}
