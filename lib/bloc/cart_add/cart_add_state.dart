// ignore_for_file: public_member_api_docs, sort_constructors_first
class CartAddState {}

class CartAddInitial extends CartAddState {}

class CartAddLoading extends CartAddState {}

class CartAddLoaded extends CartAddState {}

class CartAddError extends CartAddState {
  String err;
  CartAddError({
    required this.err,
  });
}
