import 'package:go_router/go_router.dart';
import 'package:pera_soft1/feature/bottom_nav/view/custom_bottom_nav_page.dart';
import 'package:pera_soft1/feature/category/view/category_page.dart';
import 'package:pera_soft1/feature/home/presentation/view/home_page.dart';
import 'package:pera_soft1/feature/landing/presentation/view/landing_page.dart';
import 'package:pera_soft1/feature/list/presentation/view/list_page.dart';
import 'package:pera_soft1/feature/topList/presentation/view/topl_list_page.dart';
import 'package:pera_soft1/product/router/error/route_error_page.dart';

final class AppRoute {
  GoRouter router = GoRouter(
    initialLocation: "/",
    routes: <GoRoute>[
      GoRoute(
        name: "landing_page",
        path: "/",
        builder: (context, state) {
          return const LandingPage();
        },
      ),
      GoRoute(
        name: "custom_bottom_nav",
        path: '/custom_bottom_nav',
        builder: (context, state) {
          return CustomBottomNav();
        },
      ),
      GoRoute(
        name: "home_page",
        path: '/home_page',
        builder: (context, state) {
          return HomePage();
        },
      ),
      GoRoute(
        name: "category_page",
        path: '/category_page',
        builder: (context, state) {
          return const CategoryPage();
        },
      ),
      GoRoute(
        name: "list_page",
        path: '/list_page',
        builder: (context, state) {
          return const ListPage();
        },
      ),
      GoRoute(
        name: "top_list_page",
        path: '/top_list_page',
        builder: (context, state) {
          return const TopListPage();
        },
      ),
    ],
    errorBuilder: (context, state) {
      return RouteErrorPage(error: state.error.toString());
    },
  );
}
