import 'package:flutter/material.dart';

import 'widgets/section.dart';
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
                    const HomeBody(),
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

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 38.0),
      child: Column(
        children: HomePage._sections
            .map((e) => Section(
                  title: e.label,
                  children: const [
                    Text('Lorem ipsum dolor sit amet'),
                    Text('Lorem ipsum dolor sit amet'),
                    Text('Lorem ipsum dolor sit amet'),
                    Text('Lorem ipsum dolor sit amet'),
                    SizedBox(height: 24.0),
                  ],
                ))
            .toList(),
      ),
    );
  }
}
