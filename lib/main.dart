import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pera_soft1/feature/home/presentation/bloc/home_bloc.dart';
import 'package:pera_soft1/feature/home/presentation/view/index.dart';
import 'package:pera_soft1/product/theme/bloc/theme_bloc.dart';
import 'package:pera_soft1/product/utils/service/service_manager.dart';
import 'package:pera_soft1/product/database/hive/core/cache_manager.dart';
import 'product/router/app_router.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheManager.init();
  runApp(MultiBlocProvider(providers: [
    BlocProvider(
      create: (context) => ThemeBloc(),
    ),
    BlocProvider(
      create: (context) =>
          HomeBloc(ProductService(serviceManager: ServiceManager())),
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
      theme: context.watch<ThemeBloc>().state.themeData,
      routeInformationParser: _appRoute.router.routeInformationParser,
      routeInformationProvider: _appRoute.router.routeInformationProvider,
      routerDelegate: _appRoute.router.routerDelegate,
    );
  }
}
