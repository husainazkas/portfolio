import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:timelines/timelines.dart';

import '../../domain/shared/entities/timeline_data.dart';
import '../../presentation/utils/html_style.dart';

class TimelineItemView extends StatelessWidget {
  const TimelineItemView(
    this.data, {
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

  final TimelineData data;
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

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return DefaultTextStyle.merge(
      style:
          textStyle?.copyWith(color: textColor) ?? TextStyle(color: textColor),
      child: Align(
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
                          Text(data.title),
                          if (data.subtitle != null)
                            Text(
                              data.subtitle!,
                              style:
                                  const TextStyle(fontWeight: FontWeight.w300),
                              textScaleFactor: .95,
                            ),
                          if (data.description != null) ...[
                            const SizedBox(height: 4.0),
                            Html(
                              data: data.description,
                              style: {
                                'body': Style(
                                  margin: Margins.symmetric(vertical: 8.0),
                                  padding: HtmlPaddings.zero,
                                ),
                                ...HtmlStyle.getEffectiveTextStyle(
                                  h1TextStyle: h1TextStyle,
                                  h2TextStyle: h2TextStyle,
                                  h3TextStyle: h3TextStyle,
                                  h4TextStyle: h4TextStyle,
                                  h5TextStyle: h5TextStyle,
                                  h6TextStyle: h6TextStyle,
                                  textStyle: textStyle,
                                  textColor: textColor,
                                ),
                              },
                            ),
                          ],
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
      ),
    );
  }
}
