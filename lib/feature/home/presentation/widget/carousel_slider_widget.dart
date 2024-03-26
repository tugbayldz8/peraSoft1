import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:pera_soft1/feature/home/provider/select_category_provider.dart';
import 'package:pera_soft1/product/extensions/context_extensions.dart';
import 'package:provider/provider.dart';
import '../../../../product/provider/custom_provider.dart';
import '../../../../product/utils/string/string_constants.dart';
import '../../data/models/product/product_model.dart';

final class CarouselSliderWidget extends StatelessWidget {
  CarouselSliderWidget({
    super.key,
  });

  final CustomProvider _provider = HomePageViewModelProvider();

  @override
  Widget build(BuildContext context) {
    return Consumer<SelectCategoryProvider>(
      builder: (context, provider, child) => FutureBuilder(
        future: _provider.fetchProducts(context),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
                child: Text('${StringConstants.hataolustu} ${snapshot.error}'));
          }
          if (snapshot.hasData) {
            List<Product> allProduct = snapshot.data!;
            List<Product> mostExpensiveCategory = provider.selectedCategory==null?
            allProduct:
            allProduct
                .where(
                    (product) => product.category == provider.selectedCategory)
                .toList();
            mostExpensiveCategory.sort((a, b) => b.price.compareTo(a.price));


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
                      product.image,
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
      ),
    );
  }
}
