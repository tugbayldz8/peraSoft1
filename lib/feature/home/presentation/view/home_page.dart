import 'package:flutter/material.dart';
import 'package:pera_soft1/feature/bottom_nav/view/custom_bottom_nav_page.dart';
import 'package:provider/provider.dart';
import '../../../../product/widget/custom_list_view_builder_widget.dart';
import '../../../../product/theme/custom_color_scheme.dart';
import '../../../../product/utils/string_constants.dart';
import '../../../home/data/models/product/product_model.dart';
import '../../../home/viewModel/view_model.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomColorScheme.appBarBackground,
        title: Center(child: Text(StringConstants.listeler)),
      ),                               // CustomAppBar().customAppBar(appBarTitle: StringConstants.listeler),
      body: CustomBottomNav(
        child: FutureBuilder<List<Product>>(
          future: Provider.of<HomePageViewModel>(context).fetchProducts(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError) {
              return Center(
                  child:
                      Text('${StringConstants.hataolustu}+ ${snapshot.error}'));
            }
            if (snapshot.hasData) {
              List<Product> sortedProducts = snapshot.data!;
              return CustomListViewBuilderWidget(
                  sortedProducts: sortedProducts);
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}

// final class CustomAppBar {
//   AppBar customAppBar({required String appBarTitle}) {
//     return AppBar(
//       backgroundColor: CustomColorScheme.appBarBackground,
//       title: Row(
//         children: [
//           Center(child: Text(appBarTitle)),
//         ],
//       ),
//     );
//   }
// }
