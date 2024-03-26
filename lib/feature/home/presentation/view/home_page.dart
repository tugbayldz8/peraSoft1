import 'package:flutter/material.dart';
import 'package:pera_soft1/feature/home/provider/dropdown_provider.dart';
import 'package:pera_soft1/feature/home/provider/favorite_provider.dart';
import 'package:pera_soft1/feature/home/provider/select_category_provider.dart';
import 'package:provider/provider.dart';
import '../widget/home_body_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<FavoriteProvider>(
          create: (context) => FavoriteProvider(),
        ),
        ChangeNotifierProvider<DropdownProvider>(
          create: (context) => DropdownProvider(),
        ),
        ChangeNotifierProvider<SelectCategoryProvider>(
          create: (context) => SelectCategoryProvider(),
        ),
      ],
      child: const HomeBody(),
    );
  }
}
