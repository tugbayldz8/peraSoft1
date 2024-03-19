import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pera_soft1/feature/bottom_nav/view/custom_bottom_nav_page.dart';
import 'package:pera_soft1/feature/category/presentation/view/category_page.dart';
import 'package:pera_soft1/feature/home/presentation/view/home_page.dart';
import 'package:pera_soft1/feature/landing/presentation/view/landing_page.dart';
import 'package:pera_soft1/feature/topList/presentation/view/topl_list_page.dart';
import 'package:pera_soft1/product/router/error/route_error_page.dart';

final class AppRouter {
  static final GlobalKey<NavigatorState> rootNavigatorKey =
      GlobalKey<NavigatorState>(debugLabel: 'root');

  static final GlobalKey<NavigatorState> shellNavigatorKey =
      GlobalKey<NavigatorState>(debugLabel: 'shell');

  GoRouter router = GoRouter(
    navigatorKey: rootNavigatorKey,
    initialLocation: "/",
    routes: [
      ShellRoute(
          navigatorKey: shellNavigatorKey,
          pageBuilder: (context, state, child) {
            return CustomTransitionPage(
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                return PageTransition<Widget>(
                        child: child, type: PageTransitionType.fade)
                    .child;
              },
              child: CustomBottomNav(
                child: child,
              ),
            );
          },
          routes: [
            GoRoute(
              name: 'category_page',
              path: '/category_page',
              pageBuilder: (context, state) {
                return CustomTransitionPage(
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) {
                    return PageTransition<Widget>(
                      child: child,
                      type: PageTransitionType.fade,
                    ).child;
                  },
                  child: IndexedStack(
                    index: 1,
                    children: [const CategoryPage()]),
                );
              },
            ),
           
            GoRoute(
              name: 'top_list_page',
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
                  child: IndexedStack(
                    index: 2,
                    children: [const TopListPage()]),
                );
              },
            ),
          ]),
      GoRoute(
        name: "landing_page",
        path: "/",
        builder: (context, state) {
          return const LandingPage();
        },
      ),
      GoRoute(
        name: "home_page",
        path: '/home_page',
        builder: (context, state) {
          return  HomePage();
        },
      ),
    ],
    errorBuilder: (context, state) {
      return RouteErrorPage(error: state.error.toString());
    },
  );
}
