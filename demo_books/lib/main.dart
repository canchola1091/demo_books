
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:demo_books/src/routes/routes.dart';
import 'package:demo_books/src/theme/theme.dart';
import 'package:get/route_manager.dart';
import 'package:demo_books/src/data/global_preferences.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  final GlobalPreferences _globalPrefs = GlobalPreferences();
  await _globalPrefs.initVarsPermanentes();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      locale: const Locale('es', 'ES'),
      theme: theme,
      title: 'Demo Books',
      initialRoute: '/books_page',
      getPages: Routes.routes,
    );
  }
}