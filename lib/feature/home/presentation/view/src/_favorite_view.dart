part of '../home_page.dart';

final class FavoriteView extends StatefulWidget {
  const FavoriteView({super.key});

  @override
  State<FavoriteView> createState() => _FavoriteViewState();
}

class _FavoriteViewState extends State<FavoriteView> with FavoriteMixin {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state.favoritesList != null) {
          List<Product> products = state.favoritesList!;
          return SizedBox(
            height: MediaQueryExtension(context).height / 4,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: products.length,
              itemBuilder: (context, index) {
                Product product = products[index];
                return FavoriteCard(product: product, index: index);
              },
            ),
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}

class FavoriteCard extends StatelessWidget {
  const FavoriteCard({
    super.key,
    required this.product,
    required this.index,
  });

  final int index;
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.1,
      child: Stack(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: context.paddingAllDefault,
              child: Image.network(
                product.image ?? '',
                width: MediaQueryExtension(context).veryhighValue2x / 1.5,
                height: MediaQueryExtension(context).veryhighValue2x / 1.5,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
        Positioned(
          width: context.veryhighValue1x * 1.9,
          top: 150,
          left: 20,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    '\$${product.price}',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: CustomColorScheme.customBottomNavColor,
                        ),
                  ),
                  SizedBox(width: context.lowValue),
                  Text(
                    '\$${(product.price ?? 0) * 2}',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          decoration: TextDecoration.lineThrough,
                          fontSize: 12,
                          color: Colors.grey[500],
                        ),
                  ),
                ],
              ),
              Text(
                product.category ?? '',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontSize: 15,
                      color: CustomColorScheme.customBottomNavColor,
                    ),
              ),
            ],
          ),
        ),
        Positioned(
            right: 25,
            child: IconButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                  CustomColorScheme.textColorwhite,
                ),
              ),
              onPressed: () => context
                  .read<HomeBloc>()
                  .add(RemoveFavoriteSelectEvent(product)),
              icon: const Icon(
                Icons.favorite_sharp,
                color: CustomColorScheme.customButtonColor,
              ),
            ))
      ]),
    );
  }
}
