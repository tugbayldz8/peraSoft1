import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pera_soft1/feature/home/presentation/bloc/home_bloc.dart';
import '../../../../product/base/widget/product_list_view_builder.dart';
import '../../../home/presentation/view/index.dart';
import '../../index.dart';

class ListPage extends StatelessWidget {
  ListPage({super.key});

  final productService = ProductService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarWidget(appBarTitle: StringConstants.listeler),
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state.products == null) {
            return const Center(child: CircularProgressIndicator());
          }
          List<Product> sortedProducts = List.from(state.products!);

          sortedProducts.sort((a, b) {
            if (a.price == null || b.price == null) return 0;
            return a.price!.compareTo(b.price!);
          });
          return ProductListViewBuilder(sortedProducts: sortedProducts);
        },
      ),
    );
  }
}
