import 'package:flutter/material.dart';
import 'package:pera_soft1/feature/home/provider/select_category_provider.dart';
import 'package:pera_soft1/product/utils/string/string_constants.dart';
import 'package:provider/provider.dart';
import 'package:pera_soft1/product/extensions/context_extensions.dart';
import '../../../../product/provider/custom_provider.dart';
import '../../../../product/theme/custom_color_scheme.dart';
import '../../data/models/product/product_model.dart';
import '../../provider/favorite_provider.dart';

final class GridViewWidget extends StatelessWidget {
  GridViewWidget({
    super.key,
    required this.favoriteStates,
  });

  final Map<int, bool> favoriteStates;

  final CustomProvider _provider = HomePageViewModelProvider();

  @override
  Widget build(BuildContext context) {
    return Consumer<SelectCategoryProvider>(
      builder: (context, provider, child) => FutureBuilder<List<Product>>(
        future: _provider.fetchProducts(context),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
                child: Text('${StringConstants.hataolustu} ${snapshot.error}'));
          }
          if (snapshot.hasData) {
            List<Product> products = snapshot.data!;
            List<Product> filteredProducts =provider.selectedCategory==null?products: snapshot.data!
                .where(
                    (product) => product.category == provider.selectedCategory)
                .toList();
            return SizedBox(
              height: MediaQueryExtension(context).height,
              child: GridView.builder(
                itemCount: filteredProducts.length
                    ,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 4,
                  crossAxisSpacing: 4,
                ),
                itemBuilder: (context, index) {
                  Product product =  filteredProducts[index]
                     ;
                 
                  return Card(
                    elevation: 0.1,
                    child: Stack(children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.network(
                              product.image,
                             
                              width:
                                  MediaQueryExtension(context).veryhighValue2x /
                                      1.5,
                              height:
                                  MediaQueryExtension(context).veryhighValue2x /
                                      1.5,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ],
                      ),
                      Positioned(
                        width: context.veryhighValue1x * 1.9,
                        top: 120,
                        left: 20,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  '\$${ product.price}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: CustomColorScheme
                                            .customBottomNavColor,
                                      ),
                                ),
                                SizedBox(width: context.lowValue),
                                Text(
                                  '\$${ product.price * 2 }',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                        decoration: TextDecoration.lineThrough,
                                        fontSize: 12,
                                        color: Colors.grey[500],
                                      ),
                                ),
                              ],
                            ),
                            Text(
                            product.category
                                 ,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                    fontSize: 15,
                                    color:
                                        CustomColorScheme.customBottomNavColor,
                                  ),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                          right: 25,
                          child: Consumer<FavoriteProvider>(
                              builder: (context, provider, child) {
                            bool isFavorite =
                                provider.favoriteStates.containsKey(index)
                                    ? provider.favoriteStates[index]!
                                    : false;
                            return IconButton(
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                  CustomColorScheme.textColorwhite,
                                ),
                              ),
                              onPressed: () {
                                provider.selectedFavorite(index);
                              },
                              icon: Icon(
                                isFavorite
                                    ? Icons.favorite_sharp
                                    : Icons.favorite_border_outlined,
                                color: CustomColorScheme.customButtonColor,
                              ),
                            );
                          }))
                    ]),
                  );
                },
              ),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
