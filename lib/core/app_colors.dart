import 'package:flutter/material.dart';

/// ملف الألوان الأساسية للتطبيق
/// App Colors - Primary Color Scheme
class AppColors {
  AppColors._(); // Private constructor to prevent instantiation

  // الألوان الأساسية من لوحة الألوان
  // Primary Colors from Color Palette

  /// الأزرق الداكن - اللون الأساسي
  /// Deep Blue - Primary Color
  static const Color primary = Color(0xFF145CDB);

  static const Color primary2 = Color(0xFF145CDB); // Duplicate of primary color
  /// الأزرق المتوسط - اللون الثانوي
  /// Medium Blue - Secondary Color
  static const Color secondary = Color(0xFF848AFF);

  /// الأزرق السماوي - لون التمييز
  /// Cyan Blue - Accent Color
  static const Color accent = Color(0xFF34D7E9);

  /// الأزرق الفاتح - للخلفيات الفاتحة
  /// Light Blue - For Light Backgrounds
  static const Color light = Color(0xFFB0DAFF);

  /// الأزرق الفاتح جداً - للخلفيات
  /// Very Light Blue - For Backgrounds
  static const Color background = Color(0xFFEFF7FF);

  // ألوان إضافية شائعة الاستخدام
  // Additional Common Colors

  /// الأبيض
  /// White
  static const Color white = Color(0xFFFFFFFF);

  /// الأسود
  /// Black
  static const Color black = Color(0xFF000000);

  /// الرمادي الداكن
  /// Dark Gray
  static const Color darkGray = Color(0xFF333333);

  /// الرمادي المتوسط
  /// Medium Gray
  static const Color mediumGray = Color(0xFF666666);

  /// الرمادي الفاتح
  /// Light Gray
  static const Color lightGray = Color(0xFFCCCCCC);

  /// الرمادي الفاتح جداً
  /// Very Light Gray
  static const Color veryLightGray = Color(0xFFF5F5F5);

  /// الأخضر - للنجاح
  /// Green - For Success
  static const Color success = Color(0xFF4CAF50);

  /// الأحمر - للخطأ
  /// Red - For Error
  static const Color error = Color(0xFFE53935);

  /// البرتقالي - للتحذير
  /// Orange - For Warning
  static const Color warning = Color(0xFFFF9800);

  /// الأصفر - للمعلومات
  /// Yellow - For Info
  static const Color info = Color(0xFF2196F3);
}

