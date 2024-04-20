part of 'home_bloc.dart';

final class HomeState extends Equatable {
  const HomeState({
    this.error,
    this.selectedCategory,
    this.categories,
    this.products,
    this.filteredProductList,
    this.cachedProducts,
    this.favoritesList,
    this.selectedAddress,
    this.selectCategory,
    this.selectPrice,
  });

  final String? error;
  final String? selectedCategory;
  final List<String>? categories;
  final List<Product>? products;
  final List<Product>? filteredProductList;
  final List<Product>? cachedProducts;
  final List<Product>? favoritesList;
  final String? selectedAddress;
  final String? selectCategory;
  final PriceRange? selectPrice;

  @override
  List<Object?> get props => [
        error,
        selectedCategory,
        categories,
        products,
        filteredProductList,
        cachedProducts,
        favoritesList,
        selectedAddress,
        selectCategory,
        selectPrice,
      ];

  HomeState copyWith({
    String? error,
    String? selectedCategory,
    List<String>? categories,
    List<Product>? products,
    List<Product>? cachedProducts,
    List<Product>? filteredProductList,
    List<Product>? favoritesList,
    String? selectedAddress,
    String? selectCategory,
    PriceRange? selectPrice,
  }) {
    return HomeState(
      error: error ?? this.error,
      selectedCategory: selectedCategory ?? this.selectedCategory,
      categories: categories ?? this.categories,
      products: products ?? this.products,
      filteredProductList: filteredProductList ?? this.filteredProductList,
      cachedProducts: cachedProducts ?? this.cachedProducts,
      favoritesList: favoritesList ?? this.favoritesList,
      selectedAddress: selectedAddress ?? this.selectedAddress,
      selectCategory: selectCategory ?? this.selectCategory,
      selectPrice: selectPrice ?? this.selectPrice,
    );
  }
}
