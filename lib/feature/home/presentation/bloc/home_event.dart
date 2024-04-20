part of 'home_bloc.dart';

sealed class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

final class FetchProductsEvent extends HomeEvent {}

final class SelectCategoryEvent extends HomeEvent {
  final String? selectCategory;
  const SelectCategoryEvent(this.selectCategory);
}

final class GetFavoritesEvent extends HomeEvent {}

final class AddFavoriteEvent extends HomeEvent {
  final Product item;

  const AddFavoriteEvent(this.item);
}

final class RemoveFavoriteAllEvent extends HomeEvent {}

final class RemoveFavoriteSelectEvent extends HomeEvent {
  final Product product;

  const RemoveFavoriteSelectEvent(this.product);
}

final class LocationChangeEvent extends HomeEvent {
  final String address;

  const LocationChangeEvent(this.address);
}

final class FilterProductListEvent extends HomeEvent {}

final class SelectCategoryAndPriceEvent extends HomeEvent {
  final String? selectCategory;
  final PriceRange? selectPrice;

  const SelectCategoryAndPriceEvent({this.selectCategory, this.selectPrice});
}

final class ClearFilteredListEvent extends HomeEvent {}
