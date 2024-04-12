part of '../view/home_page.dart';

mixin HomeBodyMixin on State<HomePage> {
  @override
  void initState() {
    super.initState();
    context.read<HomeViewModel>().setProducts();
  }
}
