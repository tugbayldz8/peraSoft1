import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:pera_soft1/feature/home/data/repositories/services/product/product_service.dart';
import 'package:pera_soft1/feature/home/provider/favorite_provider.dart';
import 'package:pera_soft1/product/extensions/context_extensions.dart';
import 'package:pera_soft1/product/theme/custom_color_scheme.dart';
import 'package:pera_soft1/product/utils/string/string_constants.dart';
import 'package:provider/provider.dart';
import '../../../../product/provider/custom_provider.dart';
import '../../data/models/product/product_model.dart';
import '../../viewModel/view_model.dart';
import '../widget/header_text_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<FavoriteProvider>(
          create: (context) => FavoriteProvider(),
        ),
        // ChangeNotifierProvider<HomePageViewModel>(
        //   create: (context) =>
        //       HomePageViewModel(productService: ProductService()),
        // ),
      ],
      child: const Categories(),
    );
  }
}

class Categories extends StatefulWidget {
  const Categories({super.key});

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  final CustomProvider _provider = HomePageViewModelProvider();
  final _homeViewModel = HomePageViewModel(productService: ProductService());

  int currentPageIndex = 0;
  String _selectedItem = 'Zihuatanejo, Gro';

  Map<int, bool> favoriteStates = {};

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
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Row(
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
                      items:
                          _items.map<DropdownMenuItem<String>>((String value) {
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
              ),
              HeaderTextWidget(
                headerLeft: StringConstants.selectCategory,
                headerRight: StringConstants.viewAll,
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
                                          SizedBox(height: context.lowValue),
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
                        HeaderTextWidget(
                          headerLeft: StringConstants.hotSales,
                          headerRight: StringConstants.seeMore,
                        ),
                        SizedBox(height: context.defaultValue),
                        CarouselSlider.builder(
                          itemCount: mostExpensiveProducts.length,
                          itemBuilder: (context, index, realIndex) {
                            Product product = mostExpensiveProducts[index];
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
                            height: 200.0,
                            autoPlay: true,
                            autoPlayInterval: Duration(seconds: 3),
                            autoPlayAnimationDuration:
                                Duration(milliseconds: 800),
                            autoPlayCurve: Curves.fastOutSlowIn,
                            enlargeCenterPage: true,
                            scrollDirection: Axis.horizontal,
                          ),
                        ),
                        SizedBox(height: context.defaultValue),
                        HeaderTextWidget(
                          headerLeft: StringConstants.bestSeller,
                          headerRight: StringConstants.seeMore,
                        ),
                        SizedBox(
                          height: MediaQueryExtension(context).height,
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
                              bool isFavorite =
                                  favoriteStates.containsKey(index)
                                      ? favoriteStates[index]!
                                      : false;
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
                                                  .veryhighValue2x /
                                              1.5,
                                          height: MediaQueryExtension(context)
                                                  .veryhighValue2x /
                                              1.5,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Positioned(
                                    width: context.veryhighValue1x * 1.9,
                                    top: 120,
                                    left: 20,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Text(
                                              '\$${product.price}',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyMedium!
                                                  .copyWith(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.bold,
                                                    color: CustomColorScheme
                                                        .customBottomNavColor,
                                                  ),
                                            ),
                                            SizedBox(width: context.lowValue),
                                            Text(
                                              '\$${product.price * 2}',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyMedium!
                                                  .copyWith(
                                                    decoration: TextDecoration
                                                        .lineThrough,
                                                    fontSize: 12,
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
                                                fontSize: 15,
                                                color: CustomColorScheme
                                                    .customBottomNavColor,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Positioned(
                                      right: 25,
                                      child: Consumer<FavoriteProvider>(
                                          builder: (context, provider, child) {
                                        bool isFavorite = provider
                                                .favoriteStates
                                                .containsKey(index)
                                            ? provider.favoriteStates[index]!
                                            : false;
                                        return IconButton(
                                          style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateProperty.all(
                                              CustomColorScheme.textColorwhite,
                                            ),
                                          ),
                                          onPressed: () {
                                            provider.selectedFavorite(index);
                                          },
                                          icon: Icon(
                                            isFavorite
                                                ? Icons.favorite_sharp
                                                : Icons
                                                    .favorite_border_outlined,
                                            color: CustomColorScheme
                                                .customButtonColor,
                                          ),
                                        );
                                      }))
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
