import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs_cubits/scroll_listener/scroll_listener_cubit.dart';
import '../../utils/color_utils.dart';
import 'widgets/section.dart';
import 'widgets/side_bar.dart';

class HomePage extends StatefulWidget {
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
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = ScrollController();
  final _scrollCubit = ScrollListenerCubit();

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      _scrollCubit.onUpdateScrollPosition(_controller.offset);
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
    _scrollCubit.close();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return LayoutBuilder(
      builder: (context, constaints) {
        final sideBarWidth =
            constaints.maxWidth > 800 ? 300.0 : constaints.maxWidth * .35;
        final isMobileSize = constaints.maxWidth < 600;
        return Scaffold(
          drawer: isMobileSize
              ? SideBar(
                  width: 300.0,
                  items: HomePage._sections,
                )
              : null,
          body: Row(
            children: [
              if (!isMobileSize)
                SideBar(
                  width: sideBarWidth,
                  items: HomePage._sections,
                ),
              Expanded(
                child: Stack(
                  children: [
                    SingleChildScrollView(
                      controller: _controller,
                      child: Padding(
                        padding:
                            EdgeInsets.only(top: isMobileSize ? 18.0 : 0.0),
                        child: const HomeBody(),
                      ),
                    ),
                    if (isMobileSize)
                      PreferredSize(
                        preferredSize: const Size.fromHeight(kToolbarHeight),
                        child: BlocBuilder<ScrollListenerCubit,
                            ScrollListenerState>(
                          bloc: _scrollCubit,
                          builder: (context, state) {
                            final transformation =
                                (state.offset / 25).clamp(0, 1).toDouble();
                            return Container(
                              height: kToolbarHeight,
                              width: double.infinity,
                              color: sideBarColor(context)
                                  .withOpacity(transformation),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: IconButton(
                                  onPressed: () =>
                                      Scaffold.of(context).openDrawer(),
                                  icon: Icon(
                                    Icons.menu,
                                    color: ColorTween(
                                      begin: null,
                                      end: Colors.white,
                                    ).transform(transformation),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      )
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
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 38.0),
      child: Column(
        children: HomePage._sections
            .map((e) => Section(
                  title: e.label,
                  children: [
                    Text(
                      'Lorem ipsum dolor sit amet',
                      style: theme.textTheme.subtitle2,
                    ),
                    Text(
                      'Lorem ipsum dolor sit amet',
                      style: theme.textTheme.subtitle2,
                    ),
                    Text(
                      'Lorem ipsum dolor sit amet',
                      style: theme.textTheme.subtitle2,
                    ),
                    Text(
                      'Lorem ipsum dolor sit amet',
                      style: theme.textTheme.subtitle2,
                    ),
                    const SizedBox(height: 24.0),
                  ],
                ))
            .toList(),
      ),
    );
  }
}
