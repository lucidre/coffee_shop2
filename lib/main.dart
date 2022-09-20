import 'package:coffee_shop_updated/constants/strings.dart';
import 'package:coffee_shop_updated/constants/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import 'routing/app_router.gr.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));

  await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final _appRouter = AppRouter();
  @override
  Widget build(BuildContext context) {
    final theme = ThemeData(
        scaffoldBackgroundColor: lightColor,
        colorScheme: ColorScheme.fromSwatch().copyWith(primary: lightColor),
        canvasColor: lightColor,
        dialogBackgroundColor: lightColor,
        floatingActionButtonTheme: ThemeData.light()
            .floatingActionButtonTheme
            .copyWith(backgroundColor: darkColor),
        cardColor: lightColor,
        iconTheme: ThemeData.light().iconTheme.copyWith(color: lightColor),
        textTheme: GoogleFonts.pacificoTextTheme(
          Theme.of(context).textTheme.copyWith(
                bodyText1: const TextStyle(
                  fontSize: 16,
                  color: lightColor,
                  fontWeight: FontWeight.w500,
                ),
                bodyText2: const TextStyle(
                  fontSize: 12,
                  color: lightColor,
                ),
              ),
        ).apply(
          bodyColor: lightColor,
        ));

    return MaterialApp.router(
      routerDelegate: _appRouter.delegate(),
      routeInformationParser: _appRouter.defaultRouteParser(),
      debugShowCheckedModeBanner: false,
      title: appName,
      theme: theme,
    );
  }
}
