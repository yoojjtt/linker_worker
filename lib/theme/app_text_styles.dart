import 'package:flutter/material.dart';

import 'app_colors.dart';

/// LINKER 앱 공통 텍스트 스타일
class AppTextStyles {
  AppTextStyles._();

  // ─── Heading ─────────────────────────────────
  static const heading1 = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.w800,
    color: AppColors.navy,
    letterSpacing: 3,
  );

  static const heading2 = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w700,
    color: AppColors.navy,
    height: 1.4,
  );

  static const heading3 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w700,
    color: AppColors.navy,
  );

  // ─── Body ────────────────────────────────────
  static const bodyLarge = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: AppColors.textSecondary,
  );

  static const bodyMedium = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.textMuted,
    height: 1.5,
  );

  static const bodySmall = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: AppColors.textHint,
  );

  // ─── Label ───────────────────────────────────
  static const labelLarge = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );

  static const labelMedium = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: AppColors.navy,
  );

  static const labelSmall = TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.w600,
    color: AppColors.textSecondary,
  );

  // ─── Caption / Badge ─────────────────────────
  static const caption = TextStyle(
    fontSize: 11,
    fontWeight: FontWeight.w600,
    color: AppColors.primaryBlue,
    letterSpacing: 1.5,
  );

  static const badge = TextStyle(
    fontSize: 11,
    fontWeight: FontWeight.w700,
    color: AppColors.navy,
    letterSpacing: 1,
  );

  // ─── Input ───────────────────────────────────
  static const inputText = TextStyle(
    fontSize: 14,
    color: AppColors.textPrimary,
  );

  static const inputHint = TextStyle(
    fontSize: 14,
    color: AppColors.textHint,
  );

  // ─── Brand ───────────────────────────────────
  static const logoTitle = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w800,
    color: AppColors.navy,
    letterSpacing: 2,
  );

  static const copyright = TextStyle(
    fontSize: 11,
    color: AppColors.textDisabled,
  );
}
