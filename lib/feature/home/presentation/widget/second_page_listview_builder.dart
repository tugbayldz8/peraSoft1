
import 'package:flutter/material.dart';
import 'package:pera_soft1/product/extensions/context_extensions.dart';
import '../../viewModel/view_model.dart';
import '../../../../product/utils/string_constants.dart';

class SecondPageListViewBuilder extends StatelessWidget {
  const SecondPageListViewBuilder({
    super.key,
    required this.viewModel,
  });

  final HomePageViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: viewModel.products.length,
      itemBuilder: (context, index) {
        dynamic product = viewModel.products[index];
        return ListTile(
          leading: Image.network(
            product[StringConstants.image],
            width: MediaQueryExtension(context).veryhighValue1x,
            height: MediaQueryExtension(context).veryhighValue1x,
            fit: BoxFit.cover,
          ),
          title: Text(product[StringConstants.title]),
          subtitle: Text(product[StringConstants.category]),
          trailing: Text('\$${product[StringConstants.price]}'),
        );
      },
    );
  }
}
