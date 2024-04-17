part of '../presentation/view/home_page.dart';

mixin HomeBodyMixin on State<HomePage> {
  @override
  void initState() {
    super.initState();
    context.read<HomeBloc>().add(FetchProductsEvent());
  }
}
