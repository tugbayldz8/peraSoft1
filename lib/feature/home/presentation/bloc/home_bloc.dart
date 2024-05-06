import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pera_soft1/feature/home/presentation/view/index.dart';
import 'package:pera_soft1/product/state/base/model/base_bloc.dart';
import 'package:pera_soft1/product/enums/price_range.dart';
import 'package:pera_soft1/product/database/hive/constants/cache_enums.dart';
import 'package:pera_soft1/product/state/container/product_state_items.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends BaseBloc<HomeEvent, HomeState> {
  late final ProductService _productService;
  final cacheManager = ProductStateItems.cacheManager;
  HomeBloc(ProductService productService)
      : _productService = productService,
        super(const HomeState(
          selectedAddress: 'Zihuatanejo, Gro',
        )) {
    on<FetchProductsEvent>(_fetchProducts);
    on<SelectCategoryEvent>(_selectCategory);
    on<GetFavoritesEvent>(_getFavorites);
    on<AddFavoriteEvent>(_addFavorite);
    on<RemoveFavoriteAllEvent>(_removeFavoriteAll);
    on<RemoveFavoriteSelectEvent>(_removeFavoriteSelect);
    on<LocationChangeEvent>(_selectAddress);
    on<FilterProductListEvent>(_filteredProductList);
    on<SelectCategoryAndPriceEvent>(_selectCategoryAndPrice);
    on<ClearFilteredListEvent>(_clearFilteredList);
  }

  FutureOr<void> _clearFilteredList(event, emit) {
    safeEmit(HomeState(
      error: state.error,
      categories: state.categories,
      products: state.products,
      cachedProducts: state.cachedProducts,
      favoritesList: state.favoritesList,
      selectedAddress: state.selectedAddress,
      selectCategory: null,
      selectPrice: null,
      filteredProductList: null,
    ));
  }

  FutureOr<void> _selectCategoryAndPrice(
      SelectCategoryAndPriceEvent event, emit) {
    safeEmit(state.copyWith(
        selectCategory: event.selectCategory, selectPrice: event.selectPrice));
  }

  FutureOr<void> _filteredProductList(event, emit) {
    if (state.products == null) return null;
    List<Product> products = List<Product>.from(state.products!);
    if (state.selectCategory != null) {
      products = products
          .where((element) => element.category == state.selectCategory)
          .toList();
    }
    if (state.selectPrice != null) {
      products = products.where((element) {
        final price = element.price ?? 0.0;
        if (price > state.selectPrice!.price.first &&
            price < state.selectPrice!.price.last) return true;
        return false;
      }).toList();
    }
    safeEmit(
      state.copyWith(
        filteredProductList: products,
      ),
    );
  }

  FutureOr<void> _selectAddress(event, emit) {
    safeEmit(state.copyWith(
      selectedAddress: event.address,
    ));
  }

  FutureOr<void> _removeFavoriteSelect(
      RemoveFavoriteSelectEvent event, Emitter<HomeState> emit) {
    if (state.favoritesList == null) return null;
    final favorites = List<Product>.from(state.favoritesList!);
    favorites.remove(event.product);
    cacheManager.clearList<Product>(BoxName.product);
    cacheManager.setDataList(favorites, BoxName.product);
    safeEmit(state.copyWith(
      favoritesList: favorites,
    ));
  }

  FutureOr<void> _removeFavoriteAll(event, emit) {
    if (state.favoritesList == null) return null;
    cacheManager.clearList<Product>(BoxName.product);
    safeEmit(state.copyWith(
      favoritesList: null,
    ));
  }

  FutureOr<void> _addFavorite(AddFavoriteEvent event, Emitter<HomeState> emit) {
    final favoriteList = state.favoritesList ?? [];
    if (favoriteList.contains(event.item)) return null;
    final favorites = List<Product>.from(favoriteList);
    favorites.add(event.item);
    cacheManager.clearList<Product>(BoxName.product);
    cacheManager.setDataList<Product>(favorites, BoxName.product);
    safeEmit(state.copyWith(favoritesList: favorites));
  }

  FutureOr<void> _selectCategory(
      SelectCategoryEvent event, Emitter<HomeState> emit) {
    final productList = state.products
        ?.where((element) => element.category == event.selectCategory)
        .toList();

    safeEmit(state.copyWith(
        selectCategory: event.selectCategory,
        filteredProductList: productList));
  }

  FutureOr<void> _getFavorites(event, emit) {
    final favorites = cacheManager.getDataList<Product>(BoxName.product);
    if (favorites.isNotEmpty) {
      safeEmit(
        state.copyWith(
          favoritesList: favorites,
        ),
      );
    }
  }

  FutureOr<void> _fetchProducts(event, emit) async {
    final response = await _productService.fetchProducts<List<Product>>();
    final categories = await _productService.fetchCategories<List<String>>();
    if (response.error != null && categories.error != null) {
      return safeEmit(state.copyWith(error: response.error));
    } else {
      return safeEmit(
        state.copyWith(
          products: response.data,
          categories: categories.data,
        ),
      );
    }
  }
}
