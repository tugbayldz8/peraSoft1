import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../viewModel/view_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
 
  final viewModel = HomePageViewModel();

 int _currentPageIndex = 0;
   int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    viewModel.fetchCategories();
    viewModel.fetchTopProducts();
    viewModel.fetchProducts();
  }
  
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amberAccent,
        title: Center(
            child:
                _selectedIndex == 0 ? Text('Kategoriler') : Text('Listeler')),
      ),
      bottomNavigationBar: CustomBottomNavbar(),
      body: ChangeNotifierProvider(
        create: (context) => HomePageViewModel(),
        child: Consumer<HomePageViewModel>(builder: (context, viewModel, child){
          return  Padding(
            padding: const EdgeInsets.all(10.0),
            child: _selectedIndex == 0
                ? Column(
                    children: [
                      Container(
                        height: 110,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            for (String category in viewModel.categories)
                              Container(
                                width: 100,
                                margin: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius: BorderRadius.circular(120),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 3,
                                      blurRadius: 5,
                                      offset: Offset(0, 2),
                                    ),
                                  ],
                                ),
                                child: Center(
                                  child: Text(
                                    category,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                      SizedBox(height: 15),
                      Container(
                        color: Colors.yellow,
                        width: 350,
                        child: Center(
                            child: Text(
                          'En Pahalı Ürünler',
                          style:
                              TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        )),
                      ),
                      Container(
                        height: 150,
                        width: 350,
                        color: Color.fromARGB(103, 226, 238, 58),
                        child: PageView.builder(
                          onPageChanged: (index) {
                            setState(() {
                              _currentPageIndex = index;
                            });
                          },
                          itemCount:viewModel.topProducts.length,
                          itemBuilder: (context, index) {
                            dynamic product = viewModel.topProducts[index];
                            return Center(
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      product['category'],
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      product['title'],
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      '\$${product['price']}',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
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
                            width: 8,
                            height: 8,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: _currentPageIndex == index
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
                            viewModel.products.length,
                            (index) {
                              dynamic product = viewModel.products[index];
                              return Card(
                                elevation: 3,
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Image.network(
                                        product['image'],
                                        width: 70,
                                        height: 70,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(8),
                                      child: Text(
                                        product['category'],
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
                : _selectedIndex == 1
                    ? ListView.builder(
                        itemCount: viewModel.products.length,
                        itemBuilder: (context, index) {
                          dynamic product = viewModel.products[index];
                          return ListTile(
                            leading: Image.network(
                              product['image'],
                              width: 100,
                              height: 100,
                              fit: BoxFit.cover,
                            ),
                            title: Text(product['title']),
                            subtitle: Text(product['category']),
                            trailing: Text('\$${product['price']}'),
                          );
                        },
                      )
                    : SizedBox(),
          );
        
        },
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: _selectedIndex == 0
                ? Column(
                    children: [
                      Container(
                        height: 110,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            for (String category in viewModel.categories)
                              Container(
                                width: 100,
                                margin: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius: BorderRadius.circular(120),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 3,
                                      blurRadius: 5,
                                      offset: Offset(0, 2),
                                    ),
                                  ],
                                ),
                                child: Center(
                                  child: Text(
                                    category,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                      SizedBox(height: 15),
                      Container(
                        color: Colors.yellow,
                        width: 350,
                        child: Center(
                            child: Text(
                          'En Pahalı Ürünler',
                          style:
                              TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        )),
                      ),
                      Container(
                        height: 150,
                        width: 350,
                        color: Color.fromARGB(103, 226, 238, 58),
                        child: PageView.builder(
                          onPageChanged: (index) {
                            setState(() {
                              _currentPageIndex = index;
                            });
                          },
                          itemCount:viewModel.topProducts.length,
                          itemBuilder: (context, index) {
                            dynamic product = viewModel.topProducts[index];
                            return Center(
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      product['category'],
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      product['title'],
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      '\$${product['price']}',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
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
                            width: 8,
                            height: 8,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: _currentPageIndex == index
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
                            viewModel.products.length,
                            (index) {
                              dynamic product = viewModel.products[index];
                              return Card(
                                elevation: 3,
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Image.network(
                                        product['image'],
                                        width: 70,
                                        height: 70,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(8),
                                      child: Text(
                                        product['category'],
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
                : _selectedIndex == 1
                    ? ListView.builder(
                        itemCount: viewModel.products.length,
                        itemBuilder: (context, index) {
                          dynamic product = viewModel.products[index];
                          return ListTile(
                            leading: Image.network(
                              product['image'],
                              width: 100,
                              height: 100,
                              fit: BoxFit.cover,
                            ),
                            title: Text(product['title']),
                            subtitle: Text(product['category']),
                            trailing: Text('\$${product['price']}'),
                          );
                        },
                      )
                    : SizedBox(),
          ),
        ),
      ),
    );
  }

  BottomNavigationBar CustomBottomNavbar() {
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
      currentIndex: _selectedIndex,
      selectedItemColor: Colors.blue,
      onTap: _onItemTapped,
    );
  }
}
