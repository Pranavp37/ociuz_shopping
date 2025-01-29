import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:ociuz_shopping/bloc/cart_delect/bloc/cartdelet_event.dart';
import 'package:ociuz_shopping/bloc/cart_delect/bloc/cartdelet_state.dart';
import 'package:ociuz_shopping/models/cart_model.dart';

class CartdeletBloc extends Bloc<CartdeletEvent, CartdeletState> {
  CartdeletBloc() : super(CartdeletInitial()) {
    on<CartdeletEvent>((event, emit) {
      emit(CartdeletLoading());
      var box = Hive.box<CartModel>('Card_box');
      try {
        box.deleteAt(event.index);
        emit(CartdeletLoaded());
      } catch (e) {
        emit(CartdeletError(err: e.toString()));
      }
    });
  }
}
