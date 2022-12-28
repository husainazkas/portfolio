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
  final _bodyKey = GlobalKey();
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

  RenderBox? get _bodyBox =>
      _bodyKey.currentContext?.findRenderObject() as RenderBox?;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return LayoutBuilder(
      builder: (context, constraints) {
        final sideBarWidth =
            constraints.maxWidth > 800 ? 300.0 : constraints.maxWidth * .35;
        final isMobileSize = constraints.maxWidth < 600;
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
                      child: Column(
                        children: [
                          if (isMobileSize) const HomeHeader(),
                          HomeBody(isMobileSize, key: _bodyKey),
                        ],
                      ),
                    ),
                    if (isMobileSize)
                      PreferredSize(
                        preferredSize: const Size.fromHeight(kToolbarHeight),
                        child: BlocBuilder<ScrollListenerCubit,
                            ScrollListenerState>(
                          bloc: _scrollCubit,
                          builder: (context, state) {
                            final bodyHasSize =
                                _bodyBox != null && _bodyBox!.hasSize;
                            final bodyOffset = (bodyHasSize ? _bodyBox : null)
                                    ?.localToGlobal(Offset.zero) ??
                                Offset.zero;
                            final diff = bodyOffset.dy - kToolbarHeight;
                            final transformation = bodyOffset.dy >
                                        kToolbarHeight ||
                                    state.offset == 0.0
                                ? 0.0
                                : ((diff.isNegative ? diff.abs() : 0.0) / 50)
                                    .clamp(0, 1)
                                    .toDouble();

                            return Container(
                              height: kToolbarHeight,
                              width: double.infinity,
                              color: sideBarColor(context)
                                  .withOpacity(transformation),
                              child: Material(
                                type: MaterialType.transparency,
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: IconButton(
                                    onPressed: () =>
                                        Scaffold.of(context).openDrawer(),
                                    icon: Icon(
                                      Icons.menu,
                                      color: theme.colorScheme.onSurface,
                                    ),
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

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: sideBarColor(context),
      padding: const EdgeInsets.fromLTRB(40.0, 20.0, 20.0, 20.0),
      child: DefaultTextStyle.merge(
        style: TextStyle(color: Theme.of(context).colorScheme.onSurface),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text('Hello \u{01f44b}'),
            SizedBox(height: 12.0),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text:
                        'I\'m Husain Fadhilah Azka Syamlan, usually called "Husain". I\'m currently working as a ',
                  ),
                  TextSpan(
                    text: 'Mobile Apps Developer at Startup Company',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  TextSpan(text: ' specialized in '),
                  TextSpan(
                    text: 'Flutter Applications',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  TextSpan(text: '.'),
                ],
              ),
            ),
            SizedBox(height: 12.0),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(text: 'I\'m a '),
                  TextSpan(
                    text: 'developer',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  TextSpan(
                    text:
                        ', geek and curious human besides being an OpenSource enthusiast. I have experience of delivering solutions for interesting problems from startup and industry space.',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HomeBody extends StatelessWidget {
  const HomeBody(this.isMobileSize, {super.key});

  final bool isMobileSize;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: EdgeInsets.only(
        top: isMobileSize ? 20.0 : 38.0,
        bottom: 38.0,
      ),
      child: Column(
        children: HomePage._sections
            .sublist(isMobileSize ? 1 : 0)
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
