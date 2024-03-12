import 'package:flutter/material.dart';
import 'package:pera_soft1/feature/home/data/repositories/services/product/product_service.dart';
import 'package:pera_soft1/product/theme/notifier/theme_notifier.dart';
import 'package:provider/provider.dart';
import 'feature/home/viewModel/view_model.dart';
import 'product/router/app_router.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final AppRouter _appRoute = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) =>
              HomePageViewModel(productService: ProductService()),
        ),
        ChangeNotifierProvider(
          create: (context) => ThemeNotifier(),
        ),
      ],
      child: Consumer<ThemeNotifier>(
        builder: (context, themeNotifier, _) {
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            //theme: context.watch<ThemeNotifier>().currentTheme,
            routeInformationParser: _appRoute.router.routeInformationParser,
            routeInformationProvider: _appRoute.router.routeInformationProvider,
            routerDelegate: _appRoute.router.routerDelegate,
          );
        },
      ),
    );
  }
}
