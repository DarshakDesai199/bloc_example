part of 'store_bloc.dart';

@immutable
abstract class StoreEvent {}

class StoreDataFetchEvent extends StoreEvent {}

class CoinsUpdateEvent extends StoreEvent {}
