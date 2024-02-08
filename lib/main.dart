import 'package:flutter/material.dart';
import 'package:pera_soft1/home/view/home_page.dart';
import 'package:pera_soft1/home/viewModel/view_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [  ChangeNotifierProvider(create: (context) => HomePageViewModel()),],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: HomePage(),
       
      ),
    );
  }
}
