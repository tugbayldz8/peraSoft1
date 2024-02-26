import 'package:flutter/material.dart';
import 'package:pera_soft1/feature/home/data/services/product/product_service.dart';
import 'package:pera_soft1/feature/home/presentation/view/first_page.dart';
import 'package:pera_soft1/feature/home/presentation/view/second_page.dart';
import 'package:pera_soft1/product/theme/custom_color_scheme.dart';
import 'package:pera_soft1/product/utils/string_constants.dart';
import 'package:provider/provider.dart';
import '../../../../product/utils/edge_insets_constants.dart';
import '../../viewModel/view_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
final constantsEdgeInsets=ConstantEdgeInsets();
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
        create: (context) => HomePageViewModel(productService: ProductService()),
        child: Consumer<HomePageViewModel>(
          builder: (context, viewModel, child) {
            return Padding(
              padding: constantsEdgeInsets.constantEdgeInsets10x,
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
          icon:const  Icon(Icons.home),
          label: StringConstants.kategoriler,
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.person),
          label: StringConstants.listeler,
        ),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor:CustomColorScheme.selectedItemColor,
      onTap: _onItemTapped,
    );
  }
}
