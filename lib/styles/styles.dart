import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final $styles = AppStyle();

class AppStyle {
  final Insets insets = Insets();
  final Corners corners = Corners();
  final TextStyles text = TextStyles();

  final Color primaryThemeColor = const Color(0xFFEB5124);
  final Color cardColor = const Color(0xFF393939);
}

class Corners {
  final double sm = 4;
  final double md = 8;
  final double lg = 32;
}

class Insets {
  final double xxs = 4;
  final double xs = 8;
  final double sm = 16;
  final double md = 24;
  final double lg = 32;
  final double xl = 48;
  final double xxl = 56;
  final double offset = 80;
}

class TextStyles {
  TextStyle get titleFont => GoogleFonts.roboto();
  TextStyle get titleFontCondensed =>
      const TextStyle(fontFamily: "AllotropeCond");

  TextStyle get h1 => copy(titleFont, sizePx: 64);
  TextStyle get h2 => copy(titleFont, sizePx: 32, heightPx: 46);
  TextStyle get h2Condensed => copy(titleFontCondensed, sizePx: 32);

  TextStyle get h3 =>
      copy(titleFont, sizePx: 24, heightPx: 36, weight: FontWeight.w600);
  TextStyle get h3Condensed =>
      copy(titleFontCondensed, sizePx: 24, heightPx: 36);

  TextStyle get h4 => copy(titleFont,
      sizePx: 14, heightPx: 23, spacingPc: 5, weight: FontWeight.w600);

  TextStyle get title1 =>
      copy(titleFont, sizePx: 16, heightPx: 26, spacingPc: 5);
  TextStyle get title2 => copy(titleFont, sizePx: 14, heightPx: 16.38);

  TextStyle get body => copy(titleFont, sizePx: 16, heightPx: 27);
  TextStyle get bodyBold =>
      copy(titleFont, sizePx: 16, heightPx: 26, weight: FontWeight.w600);
  TextStyle get bodySmall => copy(titleFont, sizePx: 14, heightPx: 23);
  TextStyle get bodySmallBold => copy(titleFontCondensed,
      sizePx: 14, heightPx: 23, weight: FontWeight.w600);

  TextStyle get quote1 => copy(titleFont,
      sizePx: 32, heightPx: 40, weight: FontWeight.w600, spacingPc: -3);
  TextStyle get quote2 =>
      copy(titleFont, sizePx: 21, heightPx: 32, weight: FontWeight.w400);
  TextStyle get quote2Sub =>
      copy(body, sizePx: 16, heightPx: 40, weight: FontWeight.w400);

  TextStyle get caption =>
      copy(titleFont, sizePx: 10, heightPx: 0, weight: FontWeight.w500);

  TextStyle copy(
    TextStyle style, {
    required double sizePx,
    double? heightPx,
    double? spacingPc,
    FontWeight? weight,
  }) {
    return style.copyWith(
      fontSize: sizePx,
      height: heightPx != null ? (heightPx / sizePx) : style.height,
      letterSpacing:
          spacingPc != null ? sizePx * spacingPc * 0.01 : style.letterSpacing,
      fontWeight: weight,
    );
  }
}
