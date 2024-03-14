import 'package:flutter/material.dart';
import 'package:pera_soft1/product/extensions/context_extensions.dart';
import 'package:pera_soft1/product/theme/custom_color_scheme.dart';
import 'package:pera_soft1/product/utils/string_constants.dart';
import 'package:provider/provider.dart';
import '../../../../product/widget/custom_appbar_widget.dart';
import '../../../home/data/models/product/product_model.dart';
import '../../../home/viewModel/view_model.dart';
import '../widget/container_widget.dart';
import '../widget/list_view_builder_widget.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  int _currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarWidget(appBarTitle: StringConstants.kategoriler),
      body: SingleChildScrollView(
        child: FutureBuilder<List<Product>>(
          future: Provider.of<HomePageViewModel>(context).fetchProducts(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(child: Text('Hata oluştu: ${snapshot.error}'));
            }
            if (snapshot.hasData) {
              HomePageViewModel productService =
                  Provider.of<HomePageViewModel>(context);
              List<Product> products = snapshot.data!;
              List<Product> mostExpensiveProducts =
                  productService.getMostExpensiveProductsPerCategory(products);
              return Column(
                children: [
                  Container(
                    height: MediaQueryExtension(context).veryhighValue1x,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        Product product = snapshot.data![index];
                        return Row(
                          children: [
                            Card(
                              elevation: 3,
                              child: Padding(
                                padding:
                                    PaddingExtension(context).paddingAllDefault,
                                child: Text(
                                  product.category,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                  SizedBox(height: MediaQueryExtension(context).sizedbox),
                  const ContainerWidget(),
                  Container(
                    height: MediaQueryExtension(context).veryhighValue3x,
                    width: MediaQueryExtension(context).veryhighValue4x,
                    color: CustomColorScheme.containerColor,
                    child: PageView.builder(
                      onPageChanged: (index) {
                        setState(() {
                          _currentPageIndex = index;
                        });
                      },
                      itemCount: mostExpensiveProducts.length,
                      itemBuilder: (context, index) {
                        Product product = mostExpensiveProducts[index];
                        return Center(
                          child: Padding(
                            padding: PaddingExtension(context).paddingAllLow,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  product.category,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                                Text(
                                  product.title,
                                ),
                                Text(
                                  '\$${product.price}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    height: MediaQueryExtension(context).veryhighValue1x / 2,
                    width: MediaQueryExtension(context).veryhighValue1x,
                    child: ListViewBuilderWidget(
                        mostExpensiveProducts: mostExpensiveProducts,
                        currentPageIndex: _currentPageIndex),
                  ),
                  SizedBox(height: MediaQueryExtension(context).lowValue),
                  Container(
                    height: MediaQuery.of(context).size.height,
                    child: GridView.builder(
                      itemCount: snapshot.data!.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2),
                      itemBuilder: (context, index) {
                        Product product = snapshot.data![index];
                        return Card(
                          elevation: 3,
                          child: Column(
                            children: [
                              Padding(
                                padding:
                                    PaddingExtension(context).paddingAllDefault,
                                child: Image.network(
                                  product.image,
                                  width: MediaQueryExtension(context)
                                      .veryhighValue1x,
                                  height: MediaQueryExtension(context)
                                      .veryhighValue1x,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Padding(
                                padding:
                                    PaddingExtension(context).paddingAllDefault,
                                child: Text(
                                  product.category,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}

