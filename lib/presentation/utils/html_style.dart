import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart' show Style;

class HtmlStyle {
  const HtmlStyle._();

  static Map<String, Style> getEffectiveTextStyle({
    TextStyle? h1TextStyle,
    TextStyle? h2TextStyle,
    TextStyle? h3TextStyle,
    TextStyle? h4TextStyle,
    TextStyle? h5TextStyle,
    TextStyle? h6TextStyle,
    TextStyle? textStyle,
    Color? textColor,
  }) {
    final isH1 = h1TextStyle != null;
    final isH2 = h2TextStyle != null;
    final isH3 = h3TextStyle != null;
    final isH4 = h4TextStyle != null;
    final isH5 = h5TextStyle != null;
    final isH6 = h6TextStyle != null;
    final isP = textStyle != null;

    Style? h1, h2, h3, h4, h5, h6, p, li;
    if (textColor != null) {
      final coloredStyle = Style(color: textColor);
      h1 = h2 = h3 = h4 = h5 = h6 = p = li = coloredStyle;
    }
    if (isH1) {
      final h1Style = Style.fromTextStyle(h1TextStyle);
      h1 = h1?.merge(h1Style) ?? h1Style;
    }
    if (isH2) {
      final h2Style = Style.fromTextStyle(h2TextStyle);
      h2 = h2?.merge(h2Style) ?? h2Style;
    }
    if (isH3) {
      final h3Style = Style.fromTextStyle(h3TextStyle);
      h3 = h3?.merge(h3Style) ?? h3Style;
    }
    if (isH4) {
      final h4Style = Style.fromTextStyle(h4TextStyle);
      h4 = h4?.merge(h4Style) ?? h4Style;
    }
    if (isH5) {
      final h5Style = Style.fromTextStyle(h5TextStyle);
      h5 = h5?.merge(h5Style) ?? h5Style;
    }
    if (isH6) {
      final h6Style = Style.fromTextStyle(h6TextStyle);
      h6 = h6?.merge(h6Style) ?? h6Style;
    }
    if (isP) {
      final style = Style.fromTextStyle(textStyle);
      p = p?.merge(style) ?? style;
      li = li?.merge(style) ?? style;
    }
    return {
      if (h1 != null) 'h1': h1,
      if (h2 != null) 'h2': h2,
      if (h3 != null) 'h3': h3,
      if (h4 != null) 'h4': h4,
      if (h5 != null) 'h5': h5,
      if (h6 != null) 'h6': h6,
      if (p != null) 'p': p,
      if (li != null) 'li': li,
    };
  }
}
