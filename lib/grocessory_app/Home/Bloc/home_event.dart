part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class HomeInitialEvent extends HomeEvent {}

class HomeWishlistButtonEvent extends HomeEvent {}

class HomeCartButtonEvent extends HomeEvent {}

class ProductAddToCartButtonEvent extends HomeEvent {
  final Map productData;
  ProductAddToCartButtonEvent({required this.productData});
}

class ProductAddToWishlistButtonEvent extends HomeEvent {
  final Map productData;
  ProductAddToWishlistButtonEvent({required this.productData});
}

class ProductRemoveFromCartButtonEvent extends HomeEvent {
  final Map productData;
  ProductRemoveFromCartButtonEvent({required this.productData});
}

class ProductRemoveFromWishlistButtonEvent extends HomeEvent {
  final Map productData;
  ProductRemoveFromWishlistButtonEvent({required this.productData});
}
