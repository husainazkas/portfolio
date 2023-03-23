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
  });

  final TimelineExperience timelineExperience;
  final bool showStartLine;
  final bool showEndLine;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Align(
      heightFactor: 1.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ConstrainedBox(
            constraints: const BoxConstraints(minWidth: 8.0),
            child: TimelineNode(
              indicator: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 8.0,
                ),
                child: Indicator.dot(
                  size: 8.0,
                  color: theme.colorScheme.onBackground.withOpacity(.8),
                ),
              ),
              indicatorPosition: 0.0,
              startConnector: showStartLine
                  ? Connector.solidLine(
                      color: theme.colorScheme.onBackground.withOpacity(.35),
                    )
                  : null,
              endConnector: showEndLine
                  ? Connector.solidLine(
                      color: theme.colorScheme.onBackground.withOpacity(.35),
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
                        style: TextStyle(
                          fontWeight: FontWeight.w300,
                          color: Theme.of(context)
                              .colorScheme
                              .onBackground
                              .withOpacity(.75),
                        ),
                        textScaleFactor: .95,
                      ),
                      const SizedBox(height: 4.0),
                      Html(data: timelineExperience.description),
                      const SizedBox(height: 20.0)
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
