// ignore_for_file: public_member_api_docs, sort_constructors_first
class CartdeletState {}

class CartdeletInitial extends CartdeletState {}

class CartdeletLoading extends CartdeletState {}

class CartdeletLoaded extends CartdeletState {}

class CartdeletError extends CartdeletState {
  String? err;
  CartdeletError({
    this.err,
  });
}
