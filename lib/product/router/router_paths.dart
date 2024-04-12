enum RouterPaths {
  initial('/'),
  home('/home_page'),
  list('/list_page'),
  topList('/top_list_page');

  final String path;
  const RouterPaths(this.path);
}
