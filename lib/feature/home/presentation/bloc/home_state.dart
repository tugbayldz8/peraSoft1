part of 'home_bloc.dart';

final class HomeState extends Equatable {
  const HomeState(
      {this.error,
      this.selectedCategory,
      this.categories,
      this.products,
      this.cachedProducts,
      this.favoritesList,
      this.selectedAddress});

  final String? error;
  final String? selectedCategory;
  final List<String>? categories;
  final List<Product>? products;
  final List<Product>? cachedProducts;
  final List<Product>? favoritesList;
  final String? selectedAddress;

  @override
  List<Object?> get props => [
        error,
        selectedCategory,
        categories,
        products,
        cachedProducts,
        favoritesList,
        selectedAddress,
      ];

  HomeState copyWith({
    String? error,
    String? selectedCategory,
    List<String>? categories,
    List<Product>? products,
    List<Product>? cachedProducts,
    List<Product>? favoritesList,
    String? selectedAddress,
  }) {
    return HomeState(
      error: error ?? this.error,
      selectedCategory: selectedCategory ?? this.selectedCategory,
      categories: categories ?? this.categories,
      products: products ?? this.products,
      cachedProducts: cachedProducts ?? this.cachedProducts,
      favoritesList: favoritesList ?? this.favoritesList,
      selectedAddress: selectedAddress ?? this.selectedAddress,
    );
  }
}
