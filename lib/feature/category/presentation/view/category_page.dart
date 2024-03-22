import 'dart:async';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pera_soft1/feature/home/data/repositories/services/product/product_service.dart';
import 'package:pera_soft1/product/extensions/context_extensions.dart';
import 'package:pera_soft1/product/theme/custom_color_scheme.dart';
import 'package:pera_soft1/product/utils/string/string_constants.dart';
import '../../../../product/provider/custom_provider.dart';
import '../../../home/data/models/product/product_model.dart';
import '../../../home/viewModel/view_model.dart';
import '../widget/list_view_builder_widget.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  int currentPageIndex = 0;

  final CustomProvider _provider = HomePageViewModelProvider();
  final _homeViewModel = HomePageViewModel(productService: ProductService());

  String _selectedItem = 'Zihuatanejo, Gro';
  final List<String> _items = [
    'Zihuatanejo, Gro',
    'Item 2',
    'Item 3',
    'Item 4'
  ];

  IconData categoryIcon(int index) {
    switch (index) {
      case 0:
        return Icons.laptop_chromebook_outlined;
      case 1:
        return Icons.ac_unit_sharp;
      case 2:
        return Icons.man;
      case 3:
        return Icons.woman;
      default:
        return Icons.home;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SingleChildScrollView(
        child: Padding(
          padding: context.paddingAllDefault,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(
                    Icons.location_on_outlined,
                    color: CustomColorScheme.customButtonColor,
                  ),
                  DropdownButton<String>(
                    value: _selectedItem,
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedItem = newValue!;
                      });
                    },
                    items: _items.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                  SizedBox(
                      width:
                          MediaQueryExtension(context).veryhighValue1x * 1.3),
                  Icon(Icons.filter_alt_outlined)
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    StringConstants.selectCategory,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: CustomColorScheme.customBottomNavColor,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  Text(
                    StringConstants.viewAll,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontSize: 15,
                        color: CustomColorScheme.customButtonColor),
                  ),
                ],
              ),
              FutureBuilder<List<Product>>(
                future: _provider.fetchProducts(context),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Center(
                        child: Text('Hata oluştu: ${snapshot.error}'));
                  }
                  if (snapshot.hasData) {
                    List<Product> products = snapshot.data!;
                    List<Product> mostExpensiveProducts = _homeViewModel
                        .getMostExpensiveProductsPerCategory(products);
                    List<Product> categoryNames =
                        _homeViewModel.fetchCategories(products);
                    return Column(
                      children: [
                        SizedBox(
                          height: 150,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: categoryNames.length,
                            itemBuilder: (context, index) {
                              Product product = categoryNames[index];
                              return Row(
                                children: [
                                  InkWell(
                                    onTap: () {},
                                    child: Padding(
                                      padding: context.paddingAllDefault / 1.3,
                                      child: Column(
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                            ),
                                            child: CircleAvatar(
                                              backgroundColor: CustomColorScheme
                                                  .textColorwhite,
                                              radius: 40,
                                              child: Icon(
                                                color: CustomColorScheme
                                                    .customBottomNavColor
                                                    .withOpacity(0.4),
                                                categoryIcon(index),
                                                size:
                                                    context.defaultValue * 2.5,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: context.lowValue,
                                          ),
                                          Text(
                                            product.category,
                                            style: TextStyle(
                                              color: CustomColorScheme
                                                  .customBottomNavColor,
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              );
                            },
                          ),
                        ),
                        Row(
                          children: [
                            InkWell(
                              onTap: () {},
                              child: Container(
                                height: 40,
                                width: 300,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: CustomColorScheme.textColorwhite,
                                ),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Icon(Icons.search,
                                          color: CustomColorScheme
                                              .customButtonColor),
                                    ),
                                    Text(
                                      StringConstants.search,
                                      style: TextStyle(color: Colors.grey[700]),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              width: MediaQueryExtension(context).lowValue,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                                shape: BoxShape.circle,
                              ),
                              child: CircleAvatar(
                                backgroundColor:
                                    CustomColorScheme.customButtonColor,
                                radius: 20,
                                child: Icon(
                                  color: CustomColorScheme.textColorwhite,
                                  Icons.qr_code,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: context.sizedbox * 1.5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              StringConstants.hotSales,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                    color:
                                        CustomColorScheme.customBottomNavColor,
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                            Text(
                              StringConstants.seeMore,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                      fontSize: 15,
                                      color:
                                          CustomColorScheme.customButtonColor),
                            ),
                          ],
                        ),
                        // CarouselSlider.builder(
                        //   itemCount: mostExpensiveProducts.length,
                        //   itemBuilder: (context, index, realIndex) {
                        //     Product product = mostExpensiveProducts[index];
                        //     return Container(
                        //       width: MediaQuery.of(context).size.width,
                        //       decoration: BoxDecoration(
                        //         shape: BoxShape.rectangle,
                        //         borderRadius: BorderRadius.circular(20),
                        //       ),
                        //       child: ClipRRect(
                        //         borderRadius: BorderRadius.circular(10),
                        //         child: Image.network(
                        //           product.image,
                        //           fit: BoxFit.fill,
                        //         ),
                        //       ),
                        //     );
                        //   },
                        //   options: CarouselOptions(
                        //     height: 200.0,
                        //     autoPlay: true,
                        //     autoPlayInterval: Duration(seconds: 3),
                        //     autoPlayAnimationDuration:
                        //         Duration(milliseconds: 800),
                        //     autoPlayCurve: Curves.fastOutSlowIn,
                        //     enlargeCenterPage: true,
                        //     scrollDirection: Axis.horizontal,
                        //   ),
                        // ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height,
                          child: GridView.builder(
                            itemCount: snapshot.data!.length,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 4,
                              crossAxisSpacing: 4,
                            ),
                            itemBuilder: (context, index) {
                              Product product = snapshot.data![index];
                              return Card(
                                elevation: 0.1,
                                child: Stack(children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Image.network(
                                          product.image,
                                          width: MediaQueryExtension(context)
                                              .veryhighValue1x,
                                          height: MediaQueryExtension(context)
                                              .veryhighValue1x,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Positioned(
                                    top: 100,
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Text(
                                              '\$${product.price}',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyMedium!
                                                  .copyWith(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.bold,
                                                    color: CustomColorScheme
                                                        .customBottomNavColor,
                                                  ),
                                            ),
                                            Text(
                                              '\$${product.price * 2}',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyMedium!
                                                  .copyWith(
                                                    decoration: TextDecoration
                                                        .lineThrough,
                                                    fontSize: 15,
                                                    color: Colors.grey[500],
                                                  ),
                                            ),
                                          ],
                                        ),
                                        Text(
                                          product.category,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium!
                                              .copyWith(
                                                fontSize: 18,
                                                color: CustomColorScheme
                                                    .customBottomNavColor,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Positioned(
                                      right: 25,
                                      child: IconButton(
                                        style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                            CustomColorScheme.textColorwhite,
                                          ),
                                        ),
                                        onPressed: () {},
                                        icon: Icon(
                                          Icons.favorite_border_outlined,
                                          color: CustomColorScheme
                                              .customButtonColor,
                                        ),
                                      ))
                                ]),
                              );
                            },
                          ),
                        ),
                      ],
                    );
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
