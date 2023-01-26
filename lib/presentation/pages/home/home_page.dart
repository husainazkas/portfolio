import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs_cubits/scroll_listener/scroll_listener_cubit.dart';
import '../../resources/colors.dart';
import '../../utils/color_utils.dart';
import 'widgets/side_bar.dart';
import 'widgets/skills_section.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  static const _sections = <SideBarMenuItem>[
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
                          HomeHeader(isMobileSize),
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
  const HomeHeader(this.isMobileSize, {super.key});

  final bool isMobileSize;

  double _rightPadding(double parent) {
    if (parent >= 1024) return .25 * parent;
    if (parent >= 700) return .1 * parent;
    return 36.0;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final width = MediaQuery.of(context).size.width;

    return Container(
      width: double.infinity,
      color: isMobileSize ? sideBarColor(context) : headerColor(context),
      padding: isMobileSize
          ? const EdgeInsets.fromLTRB(40.0, 20.0, 20.0, 20.0)
          : EdgeInsets.fromLTRB(36.0, 20.0, _rightPadding(width), 20.0),
      child: DefaultTextStyle.merge(
        style: TextStyle(color: theme.colorScheme.onSurface),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hello \u{01f44b}',
              style: isMobileSize
                  ? null
                  : theme.textTheme.headlineMedium?.copyWith(
                      fontFamily: theme.textTheme.titleSmall?.fontFamily,
                      fontWeight: FontWeight.w700,
                      color: ColorPalette.darkPrimaryColor,
                    ),
            ),
            SizedBox(height: isMobileSize ? 12.0 : 20.0),
            const Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text:
                        'I\'m Husain Fadhilah Azka Syamlan, usually called "Husain". I\'m currently working as a ',
                  ),
                  TextSpan(
                    text: 'Mobile Apps Developer',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  TextSpan(text: ' at Startup Company specialized in '),
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
            SizedBox(height: isMobileSize ? 12.0 : 20.0),
            const Text.rich(
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
    return Padding(
      padding: EdgeInsets.only(
        top: isMobileSize ? 20.0 : 38.0,
        bottom: 38.0,
      ),
      child: Column(
        children: [
          SkillsSection(HomePage._sections.first.label),
        ],
      ),
    );
  }
}
