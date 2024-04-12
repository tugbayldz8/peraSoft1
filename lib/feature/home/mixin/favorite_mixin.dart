part of '../view/home_page.dart';

mixin FavoriteMixin on State<FavoriteView> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<FavoriteViewModel>().getSelectFavorite();
    });
    super.initState();
  }
}
