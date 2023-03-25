import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:timelines/timelines.dart';

import '../../domain/work_experience/entities/timeline_experience.dart';

class TimelineItemView extends StatelessWidget {
  const TimelineItemView(
    this.timelineExperience, {
    super.key,
    this.showStartLine = false,
    this.showEndLine = false,
    this.h1TextStyle,
    this.h2TextStyle,
    this.h3TextStyle,
    this.h4TextStyle,
    this.h5TextStyle,
    this.h6TextStyle,
    this.textStyle,
    this.textColor,
  });

  final TimelineExperience timelineExperience;
  final bool showStartLine;
  final bool showEndLine;

  final TextStyle? h1TextStyle;
  final TextStyle? h2TextStyle;
  final TextStyle? h3TextStyle;
  final TextStyle? h4TextStyle;
  final TextStyle? h5TextStyle;
  final TextStyle? h6TextStyle;
  final TextStyle? textStyle;
  final Color? textColor;

  Map<String, Style> _getEffectiveTextStyle() {
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
      final h1Style = Style.fromTextStyle(h1TextStyle!);
      h1 = h1?.merge(h1Style) ?? h1Style;
    }
    if (isH2) {
      final h2Style = Style.fromTextStyle(h2TextStyle!);
      h2 = h2?.merge(h2Style) ?? h2Style;
    }
    if (isH3) {
      final h3Style = Style.fromTextStyle(h3TextStyle!);
      h3 = h3?.merge(h3Style) ?? h3Style;
    }
    if (isH4) {
      final h4Style = Style.fromTextStyle(h4TextStyle!);
      h4 = h4?.merge(h4Style) ?? h4Style;
    }
    if (isH5) {
      final h5Style = Style.fromTextStyle(h5TextStyle!);
      h5 = h5?.merge(h5Style) ?? h5Style;
    }
    if (isH6) {
      final h6Style = Style.fromTextStyle(h6TextStyle!);
      h6 = h6?.merge(h6Style) ?? h6Style;
    }
    if (isP) {
      final style = Style.fromTextStyle(textStyle!);
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

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Align(
      child: IntrinsicHeight(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ConstrainedBox(
              constraints: const BoxConstraints(minWidth: 8.0),
              child: TimelineNode(
                direction: Axis.vertical,
                indicator: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 8.0,
                  ),
                  child: Indicator.dot(
                    size: 8.0,
                    color: textColor ??
                        theme.colorScheme.onBackground.withOpacity(.8),
                  ),
                ),
                indicatorPosition: 0.0,
                startConnector: showStartLine
                    ? Connector.solidLine(
                        color: textColor ??
                            theme.colorScheme.onBackground.withOpacity(.35),
                      )
                    : null,
                endConnector: showEndLine
                    ? Connector.solidLine(
                        color: textColor ??
                            theme.colorScheme.onBackground.withOpacity(.35),
                      )
                    : null,
              ),
            ),
            Expanded(
              child: Align(
                alignment: AlignmentDirectional.centerStart,
                child: SizedBox(
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0, top: 4.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(timelineExperience.title),
                        Text(
                          '${timelineExperience.period} (${timelineExperience.type})',
                          style: const TextStyle(fontWeight: FontWeight.w300),
                          textScaleFactor: .95,
                        ),
                        const SizedBox(height: 4.0),
                        Html(
                          data: timelineExperience.description,
                          shrinkWrap: true,
                          style: {
                            'body': Style(
                              margin: Margins.symmetric(vertical: 8.0),
                              padding: EdgeInsets.zero,
                            ),
                            ..._getEffectiveTextStyle(),
                          },
                        ),
                        const SizedBox(height: 20.0)
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
