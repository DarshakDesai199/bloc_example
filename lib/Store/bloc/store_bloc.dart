import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:bloc_example/repo/store_repo.dart';
import 'package:flutter/material.dart';

part 'store_event.dart';
part 'store_state.dart';

class StoreBloc extends Bloc<StoreEvent, StoreState> {
  StoreBloc() : super(StoreInitial()) {
    on<StoreDataFetchEvent>(storeInitialFetchEvent);
    on<CoinsUpdateEvent>(coinsAddEvent);
  }

  Future<FutureOr<void>> storeInitialFetchEvent(StoreDataFetchEvent event, Emitter<StoreState> emit) async {
    try {
      emit(StoreLoadingState());
      List storeDataList = await StoreRepo.getStores();
      emit(StoreSuccessState(stores: storeDataList));
    } catch (e) {
      log('Error: $e');
      emit(StoreErrorState());
    }
  }

  Future<FutureOr<void>> coinsAddEvent(CoinsUpdateEvent event, Emitter<StoreState> emit) async {
    try {
      debugPrint("Enter in coins update bloc");

      bool status = await StoreRepo.coinsUpdate();
      if (status) {
        debugPrint("coins update $status");
        emit(CoinsUpdateSuccessState());
      } else {
        emit(CoinsUpdateErrorState());
      }
    } catch (e) {
      emit(CoinsUpdateErrorState());
    }
  }
}
