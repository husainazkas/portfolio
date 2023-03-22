import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/url_strategy.dart';

import 'injector.dart';
import 'presentation/app.dart';

Future<void> main() async {
  usePathUrlStrategy();

  WidgetsFlutterBinding.ensureInitialized();

  await initApp();
  runApp(const App());
}
