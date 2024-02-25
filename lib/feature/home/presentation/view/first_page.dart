import 'package:flutter/material.dart';
import 'package:pera_soft1/product/extensions/context_extensions.dart';
import 'package:pera_soft1/product/theme/custom_color_scheme.dart';
import 'package:pera_soft1/product/utils/string_constants.dart';
import '../../viewModel/view_model.dart';

class FirstPage extends StatefulWidget {
  FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  final viewModel = HomePageViewModel();
  int _currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: MediaQueryExtension(context).veryhighValue1x,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: viewModel.categories.length,
            itemBuilder: (BuildContext context, int index) {
              dynamic product = viewModel.categories[index];
              return Row(
                children: [
                  Card(
                    elevation: 3,
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        product,
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
        SizedBox(height: MediaQueryExtension(context).sizedbox),
        Container(
          color: CustomColorScheme.firstAppbarColor,
          width: MediaQueryExtension(context).veryhighValue4x,
          child: Center(
              child: Text(
            StringConstants.enPahaliUrunler,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
          )),
        ),
        Container(
          height: MediaQueryExtension(context).veryhighValue3x,
          width: MediaQueryExtension(context).veryhighValue4x,
          color: CustomColorScheme.containerColor,
          child: PageView.builder(
            onPageChanged: (index) {
              setState(() {
                _currentPageIndex = index;
              });
            },
            itemCount: viewModel.topProducts.length,
            itemBuilder: (context, index) {
              dynamic product = viewModel.topProducts[index];
              return Center(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        product[StringConstants.category],
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      Text(
                        product[StringConstants.title],
                      ),
                      Text(
                        '\$${product[StringConstants.price]}',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            viewModel.topProducts.length,
            (index) => Container(
              margin: EdgeInsets.all(3),
              width: MediaQueryExtension(context).lowValue,
              height: MediaQueryExtension(context).lowValue,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _currentPageIndex == index
                    ? CustomColorScheme.circleHover
                    : CustomColorScheme.circle,
              ),
            ),
          ),
        ),
        SizedBox(height: MediaQueryExtension(context).lowValue),
        Expanded(
          child: GridView.builder(
            itemCount: viewModel.products.length,
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            itemBuilder: (BuildContext context, int index) {
              dynamic product = viewModel.products[index];
              return Card(
                elevation: 3,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.network(
                        product[StringConstants.image],
                        width: MediaQueryExtension(context).veryhighValue1x,
                        height: MediaQueryExtension(context).veryhighValue1x,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8),
                      child: Text(
                        product[StringConstants.category],
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
