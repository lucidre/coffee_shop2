import 'package:auto_route/auto_route.dart';
import 'package:coffee_shop_updated/presentation/details/details.dart';
import 'package:coffee_shop_updated/presentation/home/home_page.dart';
import 'package:coffee_shop_updated/presentation/onboarding/onboarding.dart';
import 'package:coffee_shop_updated/presentation/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';

Route<T> fadePageBuilder<T>(
    BuildContext context, Widget child, CustomPage page) {
  return PageRouteBuilder(
    transitionDuration: const Duration(milliseconds: 800),
    reverseTransitionDuration: const Duration(milliseconds: 900),
    settings: page,
    pageBuilder: (_, __, ___) => child,
    transitionsBuilder: (_, anim1, __, child) => FadeTransition(
      opacity: Tween<double>(begin: 0.0, end: 1.0).animate(anim1),
      child: child,
    ),
  );
}

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(
      page: SplashScreen,
      initial: true,
    ),
    AutoRoute(
      page: HomePage,
    ),
    AutoRoute(
      page: OnboardingScreen,
    ),
    AutoRoute(
      page: DetailsScreen,
    ),
  ],
)
class $AppRouter {}
