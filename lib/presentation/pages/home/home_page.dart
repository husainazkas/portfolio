import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../blocs_cubits/contact_section/contact_section_bloc.dart';
import '../../blocs_cubits/scroll_listener/scroll_listener_cubit.dart';
import '../../resources/colors.dart';
import '../../utils/color_utils.dart';
import '../../widgets/social_button.dart';
import 'widgets/contact_section.dart';
import 'widgets/education_section.dart';
import 'widgets/projects_section.dart';
import 'widgets/side_bar.dart';
import 'widgets/skills_section.dart';
import 'widgets/work_experience_section.dart';

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
  late final _sectionKeys = HomePage._sections.map((e) => GlobalKey()).toList();

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

  double _getTransformation(double offset) {
    final bodyHasSize = _bodyBox != null && _bodyBox!.hasSize;
    final bodyOffset =
        (bodyHasSize ? _bodyBox : null)?.localToGlobal(Offset.zero) ??
            Offset.zero;
    final diff = bodyOffset.dy - kToolbarHeight;
    final transformation = bodyOffset.dy > kToolbarHeight || offset == 0.0
        ? 0.0
        : ((diff.isNegative ? diff.abs() : 0.0) / 50).clamp(0, 1).toDouble();
    return transformation;
  }

  void _handleScrollNavigation(int index, {double alignment = 0.0}) {
    if (!mounted) return;
    Scrollable.ensureVisible(
      _sectionKeys[index].currentContext!,
      alignment: alignment,
      duration: const Duration(milliseconds: 300),
    );
  }

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
                  onTap: (context, i) {
                    _handleScrollNavigation(i, alignment: .1);
                    Scaffold.of(context).closeDrawer();
                  },
                )
              : null,
          floatingActionButton: constraints.maxWidth >= 900
              ? null
              : BlocBuilder<ContactSectionBloc, ContactSectionState>(
                  builder: (context, state) => state.maybeWhen(
                    success: (contact) => Column(
                      mainAxisSize: MainAxisSize.min,
                      children: List.generate(
                        contact.externals.length * 2 - 1,
                        (index) {
                          if (index.isOdd) return const SizedBox(height: 12.0);
                          final link = contact.externals[index ~/ 2];
                          if (link.icon == null) return const SizedBox();
                          return Material(
                            type: MaterialType.button,
                            clipBehavior: Clip.antiAlias,
                            shape: const CircleBorder(),
                            color: Colors.white,
                            child: SizedBox.square(
                              dimension: 48.0,
                              child: SocialButton(
                                link.icon,
                                iconSize: 20.0,
                                onPressed: () {
                                  final url = link.url;
                                  if (url != null && url.isNotEmpty) {
                                    canLaunchUrlString(url).then((value) {
                                      if (value) launchUrlString(url);
                                    });
                                  }
                                },
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    orElse: () => const SizedBox(),
                  ),
                ),
          body: Row(
            children: [
              if (!isMobileSize)
                SideBar(
                  width: sideBarWidth,
                  items: HomePage._sections,
                  onTap: (_, i) => _handleScrollNavigation(i, alignment: .02),
                ),
              Expanded(
                child: Stack(
                  children: [
                    SingleChildScrollView(
                      controller: _controller,
                      child: Column(
                        children: [
                          HomeHeader(isMobileSize),
                          HomeBody(
                            isMobileSize,
                            key: _bodyKey,
                            sectionKeys: _sectionKeys,
                          ),
                          HomeFooter(constraints),
                        ],
                      ),
                    ),
                    if (isMobileSize)
                      PreferredSize(
                        preferredSize: const Size.fromHeight(kToolbarHeight),
                        child: BlocBuilder<ScrollListenerCubit,
                            ScrollListenerState>(
                          bloc: _scrollCubit,
                          builder: (context, state) => Container(
                            height: kToolbarHeight,
                            width: double.infinity,
                            color: sideBarColor(context)
                                .withOpacity(_getTransformation(state.offset)),
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
                          ),
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
                  TextSpan(text: ' and a programming enthusiast especially '),
                  TextSpan(
                    text: 'Flutter',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  TextSpan(
                    text:
                        '. I have experience of creating various needed app for startup and industry.',
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
  const HomeBody(
    this.isMobileSize, {
    super.key,
    required this.sectionKeys,
  }) : assert(sectionKeys.length > 0);

  final bool isMobileSize;
  final List<GlobalKey<State<StatefulWidget>>> sectionKeys;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: isMobileSize ? 20.0 : 38.0),
        SkillsSection(HomePage._sections[0].label, titleKey: sectionKeys[0]),
        const SizedBox(height: 24.0),
        ProjectSection(HomePage._sections[1].label, titleKey: sectionKeys[1]),
        const SizedBox(height: 24.0),
        WorkExperienceSection(HomePage._sections[2].label,
            titleKey: sectionKeys[2]),
        const SizedBox(height: 24.0),
        EducationSection(HomePage._sections[3].label, titleKey: sectionKeys[3]),
        const SizedBox(height: 24.0),
        ContactSection(HomePage._sections[4].label, titleKey: sectionKeys[4]),
        const SizedBox(height: 24.0),
      ],
    );
  }
}

class HomeFooter extends StatelessWidget {
  const HomeFooter(this.constraints, {super.key});

  final BoxConstraints constraints;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(36.0, 38.0, 36.0, 0.0),
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
      width: double.infinity,
      decoration: BoxDecoration(
        color: sideBarColor(context),
        borderRadius: const BorderRadius.vertical(top: Radius.circular(12.0)),
      ),
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          if (constraints.maxWidth >= 900)
            BlocBuilder<ContactSectionBloc, ContactSectionState>(
              builder: (context, state) => state.maybeWhen(
                success: (contact) => Row(
                  children:
                      List.generate(contact.externals.length * 2 - 1, (index) {
                    if (index.isOdd) return const SizedBox(width: 12.0);
                    final link = contact.externals[index ~/ 2];
                    if (link.icon == null) return const SizedBox();
                    return Material(
                      type: MaterialType.button,
                      clipBehavior: Clip.antiAlias,
                      shape: const CircleBorder(),
                      color: Colors.white,
                      child: SocialButton(
                        link.icon,
                        onPressed: () {
                          final url = link.url;
                          if (url != null && url.isNotEmpty) {
                            canLaunchUrlString(url).then((value) {
                              if (value) launchUrlString(url);
                            });
                          }
                        },
                      ),
                    );
                  }),
                ),
                orElse: () => const SizedBox(),
              ),
            ),
          DefaultTextStyle.merge(
            style: const TextStyle(color: Colors.white),
            child: Column(
              children: [
                const Text(
                  'Made with \u2665 by Me',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 12.0),
                ),
                Text.rich(
                  TextSpan(
                    text: 'Thanks to ',
                    children: [
                      TextSpan(
                        text: '@vinaysomawat',
                        style: const TextStyle(fontWeight: FontWeight.w700),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            const url = 'https://github.com/vinaysomawat';
                            canLaunchUrlString(url).then((value) {
                              if (value) launchUrlString(url);
                            });
                          },
                      ),
                      const TextSpan(text: ' for the reference')
                    ],
                  ),
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 11.0),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
