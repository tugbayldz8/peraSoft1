part of '../home_page.dart';

class _FetchCategoryView extends StatelessWidget {
  const _FetchCategoryView();

  @override
  Widget build(BuildContext context) {
    return Selector<HomeViewModel, List<Product>>(
      selector: (context, homeViewModel) => homeViewModel.products,
      builder: (context, snapshot, child) {
        if (snapshot.isEmpty) {
          return Center(child: Text(StringConstants.hataolustu));
        }
        if (snapshot.isNotEmpty) {
          final categoryNames =
              FetchCategories.fetchCategories(snapshot);
          return _CategoryListViewBuilderView(categoryNames: categoryNames);
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}

final class _CategoryListViewBuilderView extends StatelessWidget {
  const _CategoryListViewBuilderView({
    required this.categoryNames,
  });

  final List<Product> categoryNames;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQueryExtension(context).veryhighValue2x / 1.30,
      child: Consumer<HomeViewModel>(
        builder: (context, provider, child) {
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: categoryNames.length,
            itemBuilder: (context, index) {
              Product product = categoryNames[index];
              bool isSelectedIcon =
                  product.category == provider.selectedCategory;
              return InkWell(
                onTap: () {
                  provider.selectCategory(product.category ?? '');
                },
                child: Padding(
                  padding: context.paddingAllDefault / 1.3,
                  child: Column(
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: CircleAvatar(
                          backgroundColor: isSelectedIcon
                              ? CustomColorScheme.customButtonColor
                              : CustomColorScheme.textColorwhite,
                          radius: 30,
                          child: Icon(
                            color: isSelectedIcon
                                ? CustomColorScheme.textColorwhite
                                : CustomColorScheme.customBottomNavColor
                                    .withOpacity(0.4),
                            categoryIcon(index),
                            size: context.defaultValue * 2.5,
                          ),
                        ),
                      ),
                      SizedBox(height: context.lowValue),
                      Text(
                        product.category ?? '',
                        style: TextStyle(
                          color: isSelectedIcon
                              ? CustomColorScheme.customButtonColor
                              : CustomColorScheme.customBottomNavColor,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
