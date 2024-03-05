 import 'package:flutter/material.dart';
import '../../category/view/category_page.dart';
import '../../list/presentation/view/list_page.dart';
import '../../topList/presentation/view/topl_list_page.dart';

Widget buildGetPage
(int index) {
    switch (index) {
      case 0:
        return const ListPage();
      case 1:
        return const CategoryPage();
      case 2:
        return const TopListPage();
      default:
        return Container();
    }
  }
