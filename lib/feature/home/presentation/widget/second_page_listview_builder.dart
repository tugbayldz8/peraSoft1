import 'package:flutter/material.dart';
import 'package:pera_soft1/product/extensions/context_extensions.dart';
import 'package:pera_soft1/product/utils/string_constants.dart';
import 'package:provider/provider.dart';
import '../../data/models/product/product_model.dart';
import '../../viewModel/view_model.dart';

class SecondPageListViewBuilder extends StatelessWidget {
  const SecondPageListViewBuilder({
    super.key,
   
  });


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Product>>(
        future: Provider.of<HomePageViewModel>(context).fetchProducts(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('${StringConstants.hataolustu}+ ${snapshot.error}'));
          }
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                Product product = snapshot.data![index];
                return ListTile(
                  leading: Image.network(
                    product.image,
                    width: MediaQueryExtension(context).veryhighValue1x,
                    height: MediaQueryExtension(context).veryhighValue1x,
                    fit: BoxFit.cover,
                  ),
                  title: Text(product.title),
                  subtitle: Text(product.category),
                  trailing: Text('\$${product.price}'),
                );
              },
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
