import 'package:dmf_app/myApp.dart';
import 'package:dmf_app/screens/rosary/controller/rosary_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<RosaryScreenController>(
            create: (_) => RosaryScreenController()),
      ],
      child: const MyApp(),
    ),
  );
}
