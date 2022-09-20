// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:flutter/material.dart' as _i6;

import '../models/coffee.dart' as _i7;
import '../presentation/details/details.dart' as _i4;
import '../presentation/home/home_page.dart' as _i2;
import '../presentation/onboarding/onboarding.dart' as _i3;
import '../presentation/splash_screen/splash_screen.dart' as _i1;

class AppRouter extends _i5.RootStackRouter {
  AppRouter([_i6.GlobalKey<_i6.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    SplashScreen.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.SplashScreen(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.HomePage(),
      );
    },
    OnboardingScreen.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.OnboardingScreen(),
      );
    },
    DetailsScreen.name: (routeData) {
      final args = routeData.argsAs<DetailsScreenArgs>();
      return _i5.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i4.DetailsScreen(
          key: args.key,
          coffee: args.coffee,
        ),
      );
    },
  };

  @override
  List<_i5.RouteConfig> get routes => [
        _i5.RouteConfig(
          SplashScreen.name,
          path: '/',
        ),
        _i5.RouteConfig(
          HomeRoute.name,
          path: '/home-page',
        ),
        _i5.RouteConfig(
          OnboardingScreen.name,
          path: '/onboarding-screen',
        ),
        _i5.RouteConfig(
          DetailsScreen.name,
          path: '/details-screen',
        ),
      ];
}

/// generated route for
/// [_i1.SplashScreen]
class SplashScreen extends _i5.PageRouteInfo<void> {
  const SplashScreen()
      : super(
          SplashScreen.name,
          path: '/',
        );

  static const String name = 'SplashScreen';
}

/// generated route for
/// [_i2.HomePage]
class HomeRoute extends _i5.PageRouteInfo<void> {
  const HomeRoute()
      : super(
          HomeRoute.name,
          path: '/home-page',
        );

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i3.OnboardingScreen]
class OnboardingScreen extends _i5.PageRouteInfo<void> {
  const OnboardingScreen()
      : super(
          OnboardingScreen.name,
          path: '/onboarding-screen',
        );

  static const String name = 'OnboardingScreen';
}

/// generated route for
/// [_i4.DetailsScreen]
class DetailsScreen extends _i5.PageRouteInfo<DetailsScreenArgs> {
  DetailsScreen({
    _i6.Key? key,
    required _i7.Coffee coffee,
  }) : super(
          DetailsScreen.name,
          path: '/details-screen',
          args: DetailsScreenArgs(
            key: key,
            coffee: coffee,
          ),
        );

  static const String name = 'DetailsScreen';
}

class DetailsScreenArgs {
  const DetailsScreenArgs({
    this.key,
    required this.coffee,
  });

  final _i6.Key? key;

  final _i7.Coffee coffee;

  @override
  String toString() {
    return 'DetailsScreenArgs{key: $key, coffee: $coffee}';
  }
}
