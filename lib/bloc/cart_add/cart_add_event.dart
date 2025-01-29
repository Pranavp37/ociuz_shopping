import 'package:ociuz_shopping/models/cart_model.dart';

class CartAddEvent {}

class CartProductAdd extends CartAddEvent {
  CartModel cartData;
  CartProductAdd({
    required this.cartData,
  });
}
