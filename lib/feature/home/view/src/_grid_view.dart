part of '../home_page.dart';

final class ProductGridView extends StatefulWidget {
  const ProductGridView({super.key});

  @override
  State<ProductGridView> createState() => ProductGridViewState();
}

class ProductGridViewState extends State<ProductGridView>
    with ProductGridViewMixin {
  @override
  Widget build(BuildContext context) {
    return Consumer<HomeViewModel>(
      builder: (context, snapshot, child) {
        if (snapshot.products.isEmpty) {
          return Center(child: Text(StringConstants.hataolustu));
        }
        if (snapshot.products.isNotEmpty) {
          List<Product> products = snapshot.products;
          List<Product> filteredProducts =
              selectCategoryProvider.selectedCategory == null
                  ? products
                  : snapshot.products
                      .where((product) =>
                          product.category ==
                          selectCategoryProvider.selectedCategory)
                      .toList();
          return SizedBox(
            height: MediaQueryExtension(context).height,
            child: GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: filteredProducts.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 4,
                crossAxisSpacing: 4,
              ),
              itemBuilder: (context, index) {
                Product product = filteredProducts[index];

                return Card(
                  elevation: 0.1,
                  child: Stack(children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.network(
                            product.image ?? '',
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
                      top: 135,
                      left: 20,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                '\$${product.price}',
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
                                '\$${(product.price ?? 0) * 2}',
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
                            product.category ?? '',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  fontSize: 15,
                                  color: CustomColorScheme.customBottomNavColor,
                                ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                        right: 25,
                        child: Consumer<FavoriteViewModel>(
                            builder: (context, provider, child) {
                          bool isFavorite =
                              provider.favoriteStates.contains(product);
                          return IconButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                CustomColorScheme.textColorwhite,
                              ),
                            ),
                            onPressed: () {
                              if (isFavorite) {
                                return provider.removeFavoriteSelect(product);
                              }
                              provider.selectedFavorite(product);
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
    );
  }
}