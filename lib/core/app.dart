import 'package:flutter/material.dart';
import 'package:prog4_avaliacao2/pages/result_page/result_page.dart';

import '../consts/colors.dart';
import '../pages/game_page/game_page.dart';
import '../pages/home_page/home_page.dart';
import 'app_routes.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(scaffoldBackgroundColor: kBackgroundColor),
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.homePage,
      routes: {
        AppRoutes.homePage: (_) => const HomePage(),
        AppRoutes.gamePage: (_) => const GamePage(),
        AppRoutes.resultPage: (_) => const ResultPage(),
      },
    );
  }
}
