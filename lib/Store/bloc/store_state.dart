part of 'store_bloc.dart';

@immutable
abstract class StoreState {}

abstract class StoreActionState extends StoreState {}

class StoreInitial extends StoreState {}

class StoreLoadingState extends StoreState {}

class StoreSuccessState extends StoreState {
  final List stores;
  StoreSuccessState({required this.stores});
}

class StoreErrorState extends StoreState {}

/// Coins Add
class CoinsUpdateSuccessState extends StoreActionState {}

class CoinsUpdateErrorState extends StoreActionState {}
