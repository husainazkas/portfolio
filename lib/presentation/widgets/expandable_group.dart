import 'package:flutter/material.dart';

class ExpandableGroup extends StatefulWidget {
  const ExpandableGroup({super.key, required this.items, this.onExpanded});

  final List<ExpandableItem> items;
  final ValueChanged<int>? onExpanded;

  @override
  State<ExpandableGroup> createState() => _ExpandableGroupState();
}

class _ExpandableGroupState extends State<ExpandableGroup> {
  late final List<bool> _isItemsExpanded = List.filled(
    widget.items.length,
    false,
  );

  @override
  Widget build(BuildContext context) {
    final direction = Directionality.of(context);
    return ExpansionPanelList(
      elevation: 0.0,
      dividerColor: Colors.white54,
      expandedHeaderPadding: EdgeInsets.zero,
      expansionCallback: (index, isExpanded) {
        for (int i = 0; i < _isItemsExpanded.length; i++) {
          if (i == index) {
            _isItemsExpanded[index] = isExpanded;
            if (isExpanded) widget.onExpanded?.call(index);
          } else {
            _isItemsExpanded[i] = false;
          }
        }
        setState(() {});
      },
      children: List.generate(widget.items.length, (index) {
        final item = widget.items[index];
        return ExpansionPanel(
          canTapOnHeader: true,
          isExpanded: _isItemsExpanded[index],
          headerBuilder:
              (context, isExpanded) => Padding(
                key: item.key,
                padding: item.headerPadding
                    .resolve(direction)
                    .copyWith(right: 0.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: DefaultTextStyle.merge(
                    style: const TextStyle(color: Colors.white),
                    child: item.headerBuilder(isExpanded),
                  ),
                ),
              ),
          body: Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              border: Border(bottom: BorderSide(color: Colors.white54)),
            ),
            child: DefaultTextStyle.merge(
              style: const TextStyle(color: Colors.white),
              child: item.content,
            ),
          ),
          backgroundColor: Colors.transparent,
        );
      }),
    );
  }
}

class ExpandableItem {
  final Key? key;
  final EdgeInsetsGeometry headerPadding;
  final Widget Function(bool isExpanded) headerBuilder;
  final Widget content;

  const ExpandableItem({
    this.key,
    this.headerPadding = const EdgeInsets.all(16.0),
    required this.headerBuilder,
    required this.content,
  });
}
