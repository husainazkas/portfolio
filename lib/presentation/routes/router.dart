import 'package:go_router/go_router.dart';

import '../pages/home/home_page.dart';

final router = GoRouter(
  routes: [GoRoute(path: '/', builder: (context, state) => const HomePage())],
);
