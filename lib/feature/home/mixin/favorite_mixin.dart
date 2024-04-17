part of '../presentation/view/home_page.dart';

mixin FavoriteMixin on State<FavoriteView> {
  @override
  void initState() {
    context.read<HomeBloc>().add(GetFavoritesEvent());
    super.initState();
  }
}
