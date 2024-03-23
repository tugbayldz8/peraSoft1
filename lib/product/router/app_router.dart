import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pera_soft1/feature/bottom_nav/view/custom_bottom_nav_page.dart';
import 'package:pera_soft1/feature/home/presentation/view/home_page.dart';

import 'package:pera_soft1/feature/list/presentation/view/list_page.dart';
import 'package:pera_soft1/feature/landing/presentation/view/landing_page.dart';
import 'package:pera_soft1/feature/topList/presentation/view/topl_list_page.dart';

final class AppRouter {
  static final GlobalKey<NavigatorState> rootNavigatorKey =
      GlobalKey<NavigatorState>(debugLabel: 'root');
  static final GlobalKey<NavigatorState> shellNavigatorKey =
      GlobalKey<NavigatorState>(debugLabel: 'shell');
  static final GlobalKey<NavigatorState> shellNavigatorAKey =
      GlobalKey<NavigatorState>(debugLabel: 'shellA');
  static final GlobalKey<NavigatorState> shellNavigatorBKey =
      GlobalKey<NavigatorState>(debugLabel: 'shellB');
  static final GlobalKey<NavigatorState> shellNavigatorCKey =
      GlobalKey<NavigatorState>(debugLabel: 'shellC');
  static final GlobalKey<NavigatorState> shellNavigatorDKey =
      GlobalKey<NavigatorState>(debugLabel: 'shellD');

  GoRouter router = GoRouter(
    navigatorKey: rootNavigatorKey,
    initialLocation: "/",
    routes: [
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) =>
            const LandingPage(),
      ),
      StatefulShellRoute.indexedStack(
        builder: (context, state, child) {
          return CustomBottomNav(child: child);
        },
        branches: [
          StatefulShellBranch(
            navigatorKey: shellNavigatorDKey,
            routes: [
              GoRoute(
                path: '/home_page',
                pageBuilder: (context, state) {
                  return CustomTransitionPage(
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) {
                      return PageTransition<Widget>(
                        child: child,
                        type: PageTransitionType.fade,
                      ).child;
                    },
                    child: HomePage(),
                  );
                },
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: shellNavigatorBKey,
            routes: [
              GoRoute(
                path: '/list_page',
                pageBuilder: (context, state) {
                  return CustomTransitionPage(
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) {
                      return PageTransition<Widget>(
                        child: child,
                        type: PageTransitionType.fade,
                      ).child;
                    },
                    child:  ListPage(),
                  );
                },
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: shellNavigatorCKey,
            routes: [
              GoRoute(
                path: '/top_list_page',
                pageBuilder: (context, state) {
                  return CustomTransitionPage(
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) {
                      return PageTransition<Widget>(
                        child: child,
                        type: PageTransitionType.fade,
                      ).child;
                    },
                    child: const TopListPage(),
                  );
                },
              ),
            ],
          ),
        ],
      )
    ],
  );
}
