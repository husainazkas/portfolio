import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/url_strategy.dart';

import 'presentation/app.dart';

void main() {
  usePathUrlStrategy();
  runApp(const App());
}
