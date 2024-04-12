import 'package:flutter/material.dart';
import 'package:pera_soft1/feature/home/viewModel/home_view_model.dart';
import 'package:pera_soft1/product/theme/notifier/theme_notifier.dart';
import 'package:pera_soft1/product/utils/cache/cache_manager.dart';
import 'package:provider/provider.dart';
import 'product/router/app_router.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheManager.init();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => ThemeNotifier(),
    ),
    ChangeNotifierProvider(
      create: (context) => HomeViewModel(),
    ),
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final AppRouter _appRoute = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: context.watch<ThemeNotifier>().currentTheme,
      routeInformationParser: _appRoute.router.routeInformationParser,
      routeInformationProvider: _appRoute.router.routeInformationProvider,
      routerDelegate: _appRoute.router.routerDelegate,
    );
  }
}
