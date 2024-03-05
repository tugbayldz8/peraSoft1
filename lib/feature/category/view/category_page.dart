import 'package:flutter/material.dart';
import 'package:pera_soft1/product/extensions/context_extensions.dart';
import 'package:pera_soft1/product/theme/custom_color_scheme.dart';
import 'package:pera_soft1/product/utils/edge_insets_constants.dart';
import 'package:pera_soft1/product/utils/string_constants.dart';
import 'package:provider/provider.dart';
import '../../home/data/models/product/product_model.dart';
import '../../home/viewModel/view_model.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  final constantsEdgeInsets = ConstantEdgeInsets();
  int _currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomColorScheme.appBarBackground,
        title: Center(
          child: Text(StringConstants.kategoriler),
        ),
      ),
      body: FutureBuilder<List<Product>>(
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
                                  constantsEdgeInsets.constantEdgeInsets10x,
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
                Container(
                  color: CustomColorScheme.firstAppbarColor,
                  width: MediaQueryExtension(context).veryhighValue4x,
                  child: Center(
                      child: Text(
                    StringConstants.enPahaliUrunler,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                  )),
                ),
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
                          padding: constantsEdgeInsets.constantEdgeInsets10x,
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(   //****DÜZELTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT
                    mostExpensiveProducts.length,
                    (index) => Container(
                      margin: constantsEdgeInsets.constantEdgeInsets3x,
                      width: MediaQueryExtension(context).lowValue,
                      height: MediaQueryExtension(context).lowValue,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _currentPageIndex == index
                            ? CustomColorScheme.circleHover
                            : CustomColorScheme.circle,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: MediaQueryExtension(context).lowValue),
                Expanded(
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
                              padding: constantsEdgeInsets.constantEdgeInsets8x,
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
                              padding: constantsEdgeInsets.constantEdgeInsets8x,
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
    );
  }
}
