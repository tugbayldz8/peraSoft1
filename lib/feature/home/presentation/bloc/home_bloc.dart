import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:pera_soft1/feature/home/presentation/view/index.dart';
import 'package:pera_soft1/product/base/model/base_bloc.dart';
import '../../../../product/utils/cache/cache_manager.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends BaseBloc<HomeEvent, HomeState> {
  late final ProductService _productService;

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
    on<LocationChangeEvent>((event, emit) {
      safeEmit(state.copyWith(
        selectedAddress: event.address,
      ));
    });
  }

  FutureOr<void> _removeFavoriteSelect(event, emit) {
    if (state.favoritesList == null) return null;
    final favorites = List<Product>.from(state.favoritesList!);
    favorites.remove(event.product);
    CacheManager.clearList();
    CacheManager.setProducts(favorites);
    safeEmit(state.copyWith(
      favoritesList: favorites,
    ));
  }

  FutureOr<void> _removeFavoriteAll(event, emit) {
    if (state.favoritesList == null) return null;
    CacheManager.clearList();
    safeEmit(state.copyWith(
      favoritesList: null,
    ));
  }

  FutureOr<void> _addFavorite(event, emit) {
    if (state.favoritesList == null) return null;
    if (state.favoritesList!.contains(event.item)) return null;
    final favorites = List<Product>.from(state.favoritesList!);
    favorites.add(event.item);
    CacheManager.clearList();
    CacheManager.setProducts(favorites);
    safeEmit(state.copyWith(favoritesList: favorites));
  }

  FutureOr<void> _selectCategory(event, emit) {
    safeEmit(state.copyWith(selectedCategory: event.selectCategory));
  }

  FutureOr<void> _getFavorites(event, emit) {
    final favorites = CacheManager.getProducts();
    if (favorites != null) {
      safeEmit(state.copyWith(favoritesList: favorites));
    }
  }

  FutureOr<void> _fetchProducts(event, emit) async {
    final response = await _productService.fetchProducts<List<Product>>();
    if (response.error != null) {
      return safeEmit(state.copyWith(error: response.error));
    } else {
      return safeEmit(state.copyWith(
          products: response.data,
          categories: FetchCategories.fetchCategories(response.data!)));
    }
  }
}
