import 'package:flutter/material.dart';

/// LINKER 앱 공통 색상 토큰
/// 라이트/다크 모드 전환 시 이 파일만 수정하면 전체 반영됨
class AppColors {
  AppColors._();

  // ─── Brand ───────────────────────────────────
  static const primaryBlue = Color(0xFF2B5CE6);
  static const navy = Color(0xFF1B2B5A);

  // ─── Text ────────────────────────────────────
  static const textPrimary = Color(0xFF1B2B5A);
  static const textSecondary = Color(0xFF3A4A6B);
  static const textMuted = Color(0xFF6B7A99);
  static const textHint = Color(0xFFB0B8CC);
  static const textDisabled = Color(0xFFA0A8BC);

  // ─── Background ──────────────────────────────
  static const bgTop = Color(0xFFF8F9FC);
  static const bgBottom = Color(0xFFE8EAF0);
  static const bgCard = Colors.white;
  static const bgInput = Color(0x99FFFFFF); // white 60%

  // ─── Border ──────────────────────────────────
  static const border = Color(0xFFE0E4EC);
  static const borderLight = Color(0xFFD0D5E0);
  static const divider = Color(0xFFD8DCE6);

  // ─── Status ──────────────────────────────────
  static const success = Color(0xFF22C55E);
  static const warning = Color(0xFFF59E0B);
  static const error = Color(0xFFEF4444);
  static const info = Color(0xFF3B82F6);

  // ─── Gradient ────────────────────────────────
  static const backgroundGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [bgTop, bgBottom],
  );
}
