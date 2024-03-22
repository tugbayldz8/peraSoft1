import 'package:flutter/material.dart';
import 'package:pera_soft1/product/provider/custom_provider.dart';
import 'package:pera_soft1/product/widget/custom_appbar_widget.dart';
import '../../../../product/widget/custom_list_view_builder_widget.dart';
import '../../../../product/utils/string/string_constants.dart';
import '../../../home/data/models/product/product_model.dart';

class HomePage extends StatelessWidget {
   HomePage({super.key});

  final CustomProvider _provider = HomePageViewModelProvider();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarWidget(appBarTitle: StringConstants.listeler),
      body: FutureBuilder<List<Product>>(
        future: _provider.fetchProducts(context),
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
    );
  }
}
