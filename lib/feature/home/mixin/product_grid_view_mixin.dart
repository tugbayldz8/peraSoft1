part of '../view/home_page.dart';

mixin ProductGridViewMixin on State<ProductGridView> {
  late final SelectCategoryViewModel selectCategoryProvider;
  @override
  void initState() {
    super.initState();
    selectCategoryProvider = SelectCategoryViewModel();
  }
}
