part of '../home_page.dart';

class _MostExpensiveProductView extends StatelessWidget {
  _MostExpensiveProductView();

  final productService = ProductService();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state.products != null) {
          final allProduct = state.products;
          final mostExpensiveCategory = state.selectedCategory == null
              ? allProduct
              : allProduct!
                  .where(
                      (product) => product.category == state.selectedCategory)
                  .toList();
          mostExpensiveCategory?.sort((a, b) {
            if (a.price == null || b.price == null) return 0;
            return b.price!.compareTo(a.price!);
          });

          return CarouselSlider.builder(
            itemCount: mostExpensiveCategory?.length ?? 0,
            itemBuilder: (context, index, child) {
              final product = mostExpensiveCategory?[index];
              if (product == null) return Container();
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
