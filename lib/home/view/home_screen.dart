import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../model/product.dart';

class ProductService extends ChangeNotifier {
  int _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;

  void onItemTapped(int index) {
    _selectedIndex = index;
    notifyListeners();
  }

  Future<List<Product>> fetchProducts() async {
    final response =
        await http.get(Uri.parse('https://fakestoreapi.com/products'));
    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      List<Product> products =
          data.map((item) => Product.fromJson(item)).toList();
      return products;
    } else {
      throw Exception('Bir hata oluştu');
    }
  }

  List<Product> getMostExpensiveProductsPerCategory(List<Product> products) {
    Map<String, Product> mostExpensiveProductsMap = {};

    for (Product product in products) {
      String category = product.category;

      if (mostExpensiveProductsMap.containsKey(category)) {
        Product existingProduct = mostExpensiveProductsMap[category]!;
        if (product.price > existingProduct.price) {
          mostExpensiveProductsMap[category] = product;
        }
      } else {
        mostExpensiveProductsMap[category] = product;
      }
    }

    return mostExpensiveProductsMap.values.toList();
  }
}

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  ProductService productt = ProductService();

  int _currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amberAccent,
        title: Center(
          child: Consumer<ProductService>(
            builder: (context, productService, child) {
              return Text(productService.selectedIndex == 0
                  ? 'Kategoriler'
                  : 'Listeler');
            },
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNavbar(),
      body: FutureBuilder<List<Product>>(
          future: Provider.of<ProductService>(context).fetchProducts(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError) {
              return Center(child: Text('Hata oluştu: ${snapshot.error}'));
            }
            if (snapshot.hasData) {
              ProductService productService =
                  Provider.of<ProductService>(context);
              List<Product> products = snapshot.data!;
              List<Product> mostExpensiveProducts =
                  productService.getMostExpensiveProductsPerCategory(products);
              return productt._selectedIndex == 0
                  ? Column(
                      children: [
                        //Düzelttttttttt
                        // Container(
                        //   height: 110,
                        //   child: ListView(
                        //     scrollDirection: Axis.horizontal,
                        //     children: [
                        //       for (String category in categories)
                        //         Container(
                        //           width: 100,
                        //           margin: EdgeInsets.all(5),
                        //           decoration: BoxDecoration(
                        //             color: Colors.grey[200],
                        //             borderRadius: BorderRadius.circular(120),
                        //             boxShadow: [
                        //               BoxShadow(
                        //                 color: Colors.grey.withOpacity(0.5),
                        //                 spreadRadius: 3,
                        //                 blurRadius: 5,
                        //                 offset: Offset(0, 2),
                        //               ),
                        //             ],
                        //           ),
                        //           child: Center(
                        //             child: Text(
                        //               category,
                        //               style: TextStyle(
                        //                 color: Colors.black,
                        //                 fontWeight: FontWeight.bold,
                        //               ),
                        //             ),
                        //           ),
                        //         ),
                        //     ],
                        //   ),
                        // ),
                        SizedBox(height: 15),
                        Container(
                          color: Colors.yellow,
                          width: 350,
                          child: Center(
                              child: Text(
                            'En Pahalı Ürünler',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          )),
                        ),
                        Container(
                            height: 150,
                            width: 350,
                            color: Color.fromARGB(103, 226, 238, 58),
                            child: PageView.builder(
                          
                              itemCount: mostExpensiveProducts.length,
                              itemBuilder: (context, index) {
                                Product product = mostExpensiveProducts[index];
                                return ListTile(
                                  title: Text(product.title),
                                  subtitle: Text(product.category),
                                  trailing: Text(
                                      '\$${product.price.toStringAsFixed(2)}'),
                                );
                              },
                               onPageChanged: (index) {
                                 _currentPageIndex = index;
                  
                    },
                            )),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                            mostExpensiveProducts.length,
                            (index) => Container(
                              margin: EdgeInsets.all(3),
                              width: 8,
                              height: 8,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color:   _currentPageIndex == index
                                    ? Colors.black
                                    : Colors.grey,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Expanded(
                          child: GridView.count(
                            childAspectRatio: 1.45,
                            crossAxisCount: 2,
                            children: List.generate(
                              snapshot.data!.length,
                              (index) {
                                Product product = snapshot.data![index];
                                return Card(
                                  elevation: 3,
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Image.network(
                                          product.image,
                                          width: 70,
                                          height: 70,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.all(8),
                                        child: Text(
                                          product.category,
                                          style: TextStyle(
                                            fontSize: 12,
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
                        ),
                      ],
                    )
                  : productt._selectedIndex == 1
                      ? ListView.builder(
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            Product product = snapshot.data![index];
                            return ListTile(
                              leading: Image.network(
                                product.image,
                                width: 100,
                                height: 100,
                                fit: BoxFit.cover,
                              ),
                              title: Text(product.title),
                              subtitle: Text(product.category),
                              trailing: Text('\$${product.price}'),
                            );
                          },
                        )
                      : SizedBox();
            } else {
              return Center(child: CircularProgressIndicator());
            }
          }),
    );
  }
}

class CustomBottomNavbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Kategoriler',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Listeler',
        ),
      ],
      currentIndex: Provider.of<ProductService>(context).selectedIndex,
      selectedItemColor: Colors.blue,
      onTap: (index) {
        Provider.of<ProductService>(context, listen: false).onItemTapped(index);
      },
    );
  }
}
