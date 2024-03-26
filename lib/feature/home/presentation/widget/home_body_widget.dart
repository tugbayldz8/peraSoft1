import 'package:flutter/material.dart';
import 'package:pera_soft1/feature/home/data/repositories/services/product/product_service.dart';
import 'package:pera_soft1/product/extensions/context_extensions.dart';
import 'package:pera_soft1/product/utils/string/string_constants.dart';
import '../../../../product/provider/custom_provider.dart';
import '../../data/models/product/product_model.dart';
import '../../viewModel/view_model.dart';
import '../widget/carousel_slider_widget.dart';
import '../widget/grid_view_widget.dart';
import 'header_widget.dart';
import '../widget/list_view_builder_widget.dart';
import '../widget/search_bar_widget.dart';
import 'dropdown_widget.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  final CustomProvider _provider = HomePageViewModelProvider();
  final _homeViewModel = HomePageViewModel(productService: ProductService());
  Map<int, bool> favoriteStates = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SingleChildScrollView(
        child: Padding(
          padding: context.paddingAllDefault,
          child: Column(
            children: [
              const DropdownWidget(),
              HeaderWidget(
                headerLeft: StringConstants.selectCategory,
                headerRight: StringConstants.viewAll,
              ),
              FutureBuilder<List<Product>>(
                future: _provider.fetchProducts(context),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Center(
                        child: Text(
                            '${StringConstants.hataolustu}${snapshot.error}'));
                  }
                  if (snapshot.hasData) {
                    List<Product> products = snapshot.data!;

                    List<Product> categoryNames =
                        _homeViewModel.fetchCategories(products);
                    return Column(
                      children: [
                        ListViewBuilderWidget(categoryNames: categoryNames),
                        const SearchBarWidget(),
                        SizedBox(height: context.sizedbox * 1.5),
                        HeaderWidget(
                          headerLeft: StringConstants.hotSales,
                          headerRight: StringConstants.seeMore,
                        ),
                        SizedBox(height: context.defaultValue),
                        CarouselSliderWidget(
                           
                            ),
                        SizedBox(height: context.defaultValue),
                        HeaderWidget(
                          headerLeft: StringConstants.bestSeller,
                          headerRight: StringConstants.seeMore,
                        ),
                        GridViewWidget(favoriteStates: favoriteStates),
                      ],
                    );
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
