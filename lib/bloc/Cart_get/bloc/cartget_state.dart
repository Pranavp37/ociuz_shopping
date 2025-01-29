// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ociuz_shopping/models/cart_model.dart';

class CartgetState {}

class CartgetInitial extends CartgetState {}

class CartgetLoading extends CartgetState {}

class CartgetLoaded extends CartgetState {
  List<CartModel> cartData = [];
  CartgetLoaded({
    required this.cartData,
  });
}

class CartgetError extends CartgetState {
  String? err;
  CartgetError({
    this.err,
  });
}
