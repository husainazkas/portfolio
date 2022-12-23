import 'package:flutter/material.dart';

import 'widgets/side_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const _sections = <SideBarMenuItem>[
    SideBarMenuItem(label: 'About'),
    SideBarMenuItem(label: 'Skills'),
    SideBarMenuItem(label: 'Projects'),
    SideBarMenuItem(label: 'Work Experience'),
    SideBarMenuItem(label: 'Education'),
    SideBarMenuItem(label: 'Contact'),
  ];

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constaints) {
        final sideBarWidth =
            constaints.maxWidth > 800 ? 300.0 : constaints.maxWidth * .35;
        final isMobileSize = constaints.maxWidth < 600;
        return Scaffold(
          drawer: isMobileSize
              ? SideBar(
                  width: 300.0,
                  items: _sections,
                )
              : null,
          body: Row(
            children: [
              if (!isMobileSize)
                SideBar(
                  width: sideBarWidth,
                  items: _sections,
                ),
              Expanded(
                child: Stack(
                  children: [
                    const Center(
                      child: Text('Hello World'),
                    ),
                    if (isMobileSize)
                      Builder(
                        builder: (context) => IconButton(
                          onPressed: () => Scaffold.of(context).openDrawer(),
                          icon: const Icon(Icons.menu),
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
