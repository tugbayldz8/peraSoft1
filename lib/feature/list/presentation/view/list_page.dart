import '../../../../product/base/widget/product_list_view_builder.dart';
import '../../../home/view/index.dart';
import '../../index.dart';

class ListPage extends StatelessWidget {
  ListPage({super.key});

  final productService = ProductService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarWidget(appBarTitle: StringConstants.listeler),
      body: Consumer<HomeViewModel>(
        builder: (context, snapshot, child) {
          if (snapshot.products.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }
          List<Product> sortedProducts = List.from(snapshot.products);

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
