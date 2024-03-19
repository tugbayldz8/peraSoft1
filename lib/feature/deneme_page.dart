// import 'package:flutter/material.dart';
// import 'package:pera_soft1/feature/category/presentation/view/category_page.dart';
// import 'package:pera_soft1/feature/topList/presentation/view/topl_list_page.dart';


// class DenemePage extends StatefulWidget {
//   const DenemePage({super.key});

//   @override
//   State<DenemePage> createState() => _DenemePageState();
// }

// class _DenemePageState extends State<DenemePage> {
  
//   int _selectedPage = 0;
//   List<Widget> pageList = [CategoryPage(), TopListPage()];


//   @override
//   Widget build(BuildContext context) {
//     return  Scaffold(
//       appBar: AppBar(
//         title: Text('Deneme'),
//       ),
//       body: IndexedStack(
//         index: _selectedPage,
//         children: pageList,
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         type: BottomNavigationBarType.fixed,
//         items: const <BottomNavigationBarItem>[
//           BottomNavigationBarItem(
//             icon: Icon(Icons.phone_android),
//             label: 'First Page',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.phone_android),
//             label: 'Second Page',
//           ),
//         ],
//         currentIndex: _selectedPage,
//         selectedItemColor: Colors.blue,
//         onTap: _onItemTapped,
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }

//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedPage = index;
//     });
//   }
// }