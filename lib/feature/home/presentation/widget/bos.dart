
import 'package:flutter/material.dart';
import 'package:pera_soft1/product/utils/string/string_constants.dart';
import 'package:provider/provider.dart';
import 'package:pera_soft1/product/extensions/context_extensions.dart';
import '../../../../product/provider/custom_provider.dart';
import '../../../../product/theme/custom_color_scheme.dart';
import '../../data/models/product/product_model.dart';
import '../../data/repositories/services/product/product_service.dart';
import '../../provider/favorite_provider.dart';
import '../../viewModel/view_model.dart';

final class GriddViewWidget extends StatelessWidget {
  GriddViewWidget({
    Key? key,
    required this.favoriteStates,
  });

  final Map<int, bool> favoriteStates;

  final CustomProvider _provider = HomePageViewModelProvider();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Product>>(
      future: _provider.fetchProducts(context),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(
            child: Text(
              '${StringConstants.hataolustu} ${snapshot.error}',
            ),
          );
        }
        if (snapshot.hasData) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: _buildCategoryCards(context, snapshot.data!),
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  List<Widget> _buildCategoryCards(
      BuildContext context, List<Product> products) {
    List<Widget> categoryCards = [];

    // Kategori adlarından benzersiz olanları al
    List<String> uniqueCategoryNames =
        _provider.fetchSpecialCategories(products);

    // Her bir kategori için ayrı bir Card oluştur
    for (String categoryName in uniqueCategoryNames) {
      List<Product> categoryProducts =
          _getProductsByCategory(products, categoryName);

      // Eğer kategoride ürün varsa, bu kategori için bir Card oluştur
      if (categoryProducts.isNotEmpty) {
        if (categoryName == 'jewelery') {
          Widget categoryCard = Card(
            child: Column(
              children: [
                Text(
                  categoryName,
                  style: Theme.of(context).textTheme.headline6,
                ),
                GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: categoryProducts.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 4,
                    crossAxisSpacing: 4,
                  ),
                  itemBuilder: (context, index) {
                    Product product = categoryProducts[index];
                    return GridTile(
                      child: Image.network(product.image),
                      footer: GridTileBar(
                        backgroundColor: Colors.black45,
                        title: Text(product.title),
                        subtitle: Text('\$${product.price}'),
                      ),
                    );
                  },
                ),
              ],
            ),
          );
          categoryCards.add(categoryCard);
        }
      }
    }
    return categoryCards;
  }

  List<Product> _getProductsByCategory(
      List<Product> products, String categoryName) {
    return products
        .where((product) => product.category == categoryName)
        .toList();
  }
}
