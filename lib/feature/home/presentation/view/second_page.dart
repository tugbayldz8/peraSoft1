import 'package:flutter/material.dart';
import '../widget/second_page_listview_builder.dart';
import '../../viewModel/view_model.dart';

class SeconPage extends StatelessWidget {
   SeconPage({super.key});

  final viewModel = HomePageViewModel();

  @override
  Widget build(BuildContext context) {
    return SecondPageListViewBuilder(viewModel: viewModel);
  }
}
