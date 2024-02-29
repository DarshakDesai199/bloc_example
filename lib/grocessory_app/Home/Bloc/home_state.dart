part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

abstract class HomeActionState extends HomeState {}

class HomeInitial extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeSuccessState extends HomeState {
  final List data;

  HomeSuccessState({required this.data});
}

class HomeErrorState extends HomeState {}

class HomeNavigateToWishlistActionState extends HomeActionState {}

class HomeNavigateToCartActionState extends HomeActionState {}

class ProductAddToCartActionState extends HomeActionState {}

class ProductAddToWishlistActionState extends HomeActionState {}

class ProductRemoveFromCartActionState extends HomeActionState {}

class ProductRemoveFromWishlistActionState extends HomeActionState {}
