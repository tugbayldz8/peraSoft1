part of '../home_page.dart';

class _MostExpensiveProductView extends StatelessWidget {
  _MostExpensiveProductView();

  final productService = ProductService();

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeViewModel>(
      builder: (context, snapshot, child) {
        if (snapshot.products.isEmpty) {
          return Center(child: Text(StringConstants.hataolustu));
        }
        if (snapshot.products.isNotEmpty) {
          final allProduct = snapshot.products;
          final mostExpensiveCategory =
             snapshot.selectedCategory == null
                  ? allProduct
                  : allProduct
                      .where((product) =>
                          product.category ==
                          snapshot
                              .selectedCategory)
                      .toList();
          mostExpensiveCategory.sort((a, b) {
            if (a.price == null || b.price == null) return 0;
            return b.price!.compareTo(a.price!);
          });
    
          return CarouselSlider.builder(
            itemCount: mostExpensiveCategory.length,
            itemBuilder: (context, index, child) {
              Product product = mostExpensiveCategory[index];
              return Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    product.image ?? '',
                    fit: BoxFit.fill,
                  ),
                ),
              );
            },
            options: CarouselOptions(
              height: context.veryhighValue2x,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 3),
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              enlargeCenterPage: true,
              scrollDirection: Axis.horizontal,
            ),
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
