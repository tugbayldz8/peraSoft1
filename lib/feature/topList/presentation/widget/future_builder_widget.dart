import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pera_soft1/feature/home/presentation/bloc/home_bloc.dart';
import 'package:pera_soft1/product/base/widget/product_list_view_builder.dart';
import '../../../home/data/models/product/product_model.dart';

final class FutureBuilderWidget extends StatelessWidget {
  const FutureBuilderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state.products == null) {
          return const Center(child: CircularProgressIndicator());
        }
        List<Product> sortedProducts = List.from(state.products!);
        sortedProducts.sort((a, b) {
          if (a.price == null || b.price == null) return 0;
          return b.price!.compareTo(a.price!);
        });
        return ProductListViewBuilder(sortedProducts: sortedProducts);
      },
    );
  }
}
