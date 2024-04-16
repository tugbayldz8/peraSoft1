import 'package:pera_soft1/product/extensions/context_extensions.dart';
import 'index.dart';

part 'src/_fetch_category_view.dart';
part 'src/_most_expensive_product_view.dart';
part 'src/_dropdown_view.dart';
part 'src/_bottom_sheet_view.dart';
part '../view/src/_favorite_view.dart';
part '../view/src/_grid_view.dart';
part '../view/src/_header_view.dart';
part '../view/src/_search_bar_view.dart';
part '../mixin/home_body_mixin.dart';
part '../mixin/location_dropdown_mixin.dart';
part '../mixin/favorite_mixin.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with HomeBodyMixin {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<FavoriteViewModel>(
          create: (context) => FavoriteViewModel(),
        ),
        ChangeNotifierProvider<LocationDropdownViewModel>(
          create: (context) => LocationDropdownViewModel(),
        ),
        ChangeNotifierProvider<HomeViewModel>(
          create: (context) => HomeViewModel(),
        ),
      ],
      child: SingleChildScrollView(
        child: Padding(
          padding: context.paddingAllDefault,
          child: Column(
            children: [
              const LocationDropdownView(),
              _HeaderView(
                headerLeft: StringConstants.selectCategory,
                headerRight: StringConstants.viewAll,
              ),
              Column(
                children: [
                  const _FetchCategoryView(),
                  const _SearchBarView(),
                  SizedBox(height: context.sizedbox * 1.5),
                  _HeaderView(
                    headerLeft: StringConstants.hotSales,
                    headerRight: StringConstants.seeMore,
                  ),
                  SizedBox(height: context.defaultValue),
                  _MostExpensiveProductView(),
                  SizedBox(height: context.defaultValue),
                  const FavoriteView(),
                  SizedBox(height: context.defaultValue),
                  _HeaderView(
                    headerLeft: StringConstants.bestSeller,
                    headerRight: StringConstants.seeMore,
                  ),
                  const ProductGridView(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
