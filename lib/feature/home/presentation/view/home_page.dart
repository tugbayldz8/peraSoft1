import 'package:flutter/material.dart';
import 'package:pera_soft1/feature/home/presentation/view/first_page.dart';
import 'package:pera_soft1/feature/home/presentation/view/second_page.dart';
import 'package:pera_soft1/product/theme/custom_color_scheme.dart';
import 'package:pera_soft1/product/utils/string_constants.dart';
import 'package:provider/provider.dart';

import '../../viewModel/view_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final viewModel = HomePageViewModel();

  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomColorScheme.appBarBackground,
        title: Center(
            child:
                _selectedIndex == 0 ? Text(StringConstants.kategoriler) : Text(StringConstants.listeler)),
      ),
      bottomNavigationBar: CustomBottomNavbar(),
      body: ChangeNotifierProvider(
        create: (context) => HomePageViewModel(),
        child: Consumer<HomePageViewModel>(
          builder: (context, viewModel, child) {
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: _selectedIndex == 0
                  ? FirstPage()
                  : _selectedIndex == 1
                      ? SeconPage()
                      : SizedBox(),
            );
          },
        ),
      ),
    );
  }

  BottomNavigationBar CustomBottomNavbar() {
    return BottomNavigationBar(
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: StringConstants.kategoriler,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: StringConstants.listeler,
        ),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor:CustomColorScheme.selectedItemColor,
      onTap: _onItemTapped,
    );
  }
}
