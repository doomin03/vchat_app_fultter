import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:riverpod/riverpod.dart';
import 'package:vchat_app_fultter/ui/screen/home/home_screen.dart';

part 'app_router.gr.dart';

final appRouterProvider = Provider<AppRouter>((ref) => AppRouter(ref));

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends RootStackRouter {
  AppRouter(this.ref);

  final Ref ref;

  final RouteType transitionRoute = RouteType.custom(
    duration: const Duration(milliseconds: 200),
    transitionsBuilder: (context, animation, secondary, child) {
      return FadeTransition(opacity: animation, child: child);
    },
  );

  @override
  RouteType get defaultRouteType => transitionRoute;

  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: HomeRoute.page, initial: true),
  ];
}
