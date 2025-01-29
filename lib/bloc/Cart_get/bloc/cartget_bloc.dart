import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:ociuz_shopping/bloc/Cart_get/bloc/cartget_event.dart';
import 'package:ociuz_shopping/bloc/Cart_get/bloc/cartget_state.dart';
import 'package:ociuz_shopping/models/cart_model.dart';

class CartgetBloc extends Bloc<CartgetEvent, CartgetState> {
  CartgetBloc() : super(CartgetInitial()) {
    on<CartgetEvent>((event, emit) {
      List<CartModel> cartData = [];
      emit(CartgetLoading());
      var box = Hive.box<CartModel>('Card_box');
      try {
        cartData = box.values.toList();
        emit(CartgetLoaded(cartData: cartData));
      } catch (e) {
        emit(CartgetError(err: e.toString()));
      }
    });
  }
}
