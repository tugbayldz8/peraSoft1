part of '../view/home_page.dart';

mixin FavoriteMixin on State<FavoriteView> {
  @override
  void initState() {
    //NOT:::::widget oluşturulur oluştururlmaz hemen altındaki fonksiyonu çağıran bir callback fonksiyonu. initstatein içinde olması da sadece bir kez çağrılmasından.
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<FavoriteViewModel>().getSelectFavorite();
    });
    super.initState();
  }
}
