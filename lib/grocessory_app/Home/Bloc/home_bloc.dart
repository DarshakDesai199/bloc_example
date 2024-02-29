import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_example/repo/store_repo.dart';
import 'package:flutter/material.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  List productWishlist = [];
  List productCartList = [];

  HomeBloc() : super(HomeInitial()) {
    on<HomeInitialEvent>(homeInitialEvent);
    on<HomeWishlistButtonEvent>(homeWishlistButtonEvent);
    on<HomeCartButtonEvent>(homeCartButtonEvent);
    on<ProductAddToCartButtonEvent>(productAddToCartButtonEvent);
    on<ProductAddToWishlistButtonEvent>(productAddToWishlistButtonEvent);
    on<ProductRemoveFromCartButtonEvent>(productRemoveFromCartButtonEvent);
    on<ProductRemoveFromWishlistButtonEvent>(productRemoveFromWishlistButtonEvent);
  }

  Future<FutureOr<void>> homeInitialEvent(HomeInitialEvent event, Emitter<HomeState> emit) async {
    try {
      emit(HomeLoadingState());
      List data = await StoreRepo.getStores();
      debugPrint("home initial data ---- ${data.length}");
      emit(HomeSuccessState(data: data));
    } catch (e) {
      debugPrint("error of home initial state --- $e");
      emit(HomeErrorState());
    }
  }

  FutureOr<void> homeWishlistButtonEvent(HomeWishlistButtonEvent event, Emitter<HomeState> emit) {
    emit(HomeNavigateToWishlistActionState());
    debugPrint("Tap on wishlist button");
  }

  FutureOr<void> homeCartButtonEvent(HomeCartButtonEvent event, Emitter<HomeState> emit) {
    emit(HomeNavigateToCartActionState());
    debugPrint("Tap on cart button");
  }

  FutureOr<void> productAddToCartButtonEvent(ProductAddToCartButtonEvent event, Emitter<HomeState> emit) {
    emit(ProductAddToCartActionState());
    productCartList.add(event.productData);
    debugPrint("Tap on add to cart button");
    debugPrint("productCartList ***** $productCartList");
  }

  FutureOr<void> productAddToWishlistButtonEvent(ProductAddToWishlistButtonEvent event, Emitter<HomeState> emit) {
    emit(ProductAddToWishlistActionState());
    debugPrint("Tap on add to wishlist button");
    productWishlist.add(event.productData);
    debugPrint("productCartList ***** $productWishlist");
  }

  FutureOr<void> productRemoveFromCartButtonEvent(ProductRemoveFromCartButtonEvent event, Emitter<HomeState> emit) {
    emit(ProductRemoveFromCartActionState());
    debugPrint("Tap on remove from cart button");
    productCartList.remove(event.productData);
    debugPrint("productCartList ***** $productCartList");
  }

  FutureOr<void> productRemoveFromWishlistButtonEvent(
      ProductRemoveFromWishlistButtonEvent event, Emitter<HomeState> emit) {
    emit(ProductRemoveFromWishlistActionState());
    debugPrint("Tap on remove from wishlist button");
    productWishlist.remove(event.productData);
    debugPrint("productCartList ***** $productWishlist");
  }
}
