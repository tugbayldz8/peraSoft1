part of '../home_page.dart';

class _FetchCategoryView extends StatelessWidget {
  const _FetchCategoryView();

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeViewModel>(
      builder: (context, snapshot, child) {
        if (snapshot.products.isEmpty) {
          return Center(child: Text(StringConstants.hataolustu));
        }
        if (snapshot.products.isNotEmpty) {
          final categoryNames =
              FetchCategories.fetchCategories(snapshot.products);
          return _CategoryListViewBuilderView(categoryNames: categoryNames,selectedCategory:snapshot.selectedCategory??'');
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
    required this.selectedCategory,
  });

  final List<String> categoryNames;
  final String selectedCategory;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQueryExtension(context).veryhighValue2x / 1.30,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categoryNames.length,
        itemBuilder: (context, index) {
          String category = categoryNames[index];
          bool isSelectedIcon =
              category == selectedCategory;
          return InkWell(
            onTap: () {
              if(isSelectedIcon){
                context.read<HomeViewModel>().selectCategory(null);
                return;
              }
           context.read<HomeViewModel>().selectCategory(category);
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
                 category,
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
      ),
    );
  }
}
