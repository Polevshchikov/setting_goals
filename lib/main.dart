import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:setting_goals/services/services.dart';
import 'package:setting_goals/widgets/global/global_widget.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  getIt.registerSingletonAsync<Services>(() async {
    final _services = Services();
    await _services.init();
    return _services;
  });

  runApp(GlobalWidget());
}
