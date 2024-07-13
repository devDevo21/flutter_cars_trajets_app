import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static Color black = Colors.black;
  static Color primaryColor = const Color(0xff0e76bd);
  static Color textColor = const Color(0xffffffff);
  static String appFont = 'Kanit';

  static TextStyle textStyle(
      {double? fontSize,
      Color? color,
      FontWeight fontWeight = FontWeight.normal}) {
    return GoogleFonts.getFont(appFont,
        fontWeight: fontWeight,
        fontSize: fontSize ?? TextSize.sm,
        color: color ?? AppTheme.black,
        height: 1);
  }
}

class TextSize {
  static final sm = 17.sp;
  static final md = 20.sp;
  static final lg = 25.sp;
  static final xl = 35.sp;
  static final xxl = 40.sp;
}
