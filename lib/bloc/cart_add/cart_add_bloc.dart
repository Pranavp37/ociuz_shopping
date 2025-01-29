import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:ociuz_shopping/bloc/cart_add/cart_add_event.dart';
import 'package:ociuz_shopping/bloc/cart_add/cart_add_state.dart';
import 'package:ociuz_shopping/models/cart_model.dart';

class CartAddBloc extends Bloc<CartAddEvent, CartAddState> {
  CartAddBloc() : super(CartAddInitial()) {
    on<CartProductAdd>(
      (event, emit) {
        emit(CartAddLoading());
        var box = Hive.box<CartModel>('Card_box');
        List<CartModel> CartDAta = [];
        try {
          CartDAta = box.values.toList();

          bool isAlredyExit = CartDAta.any(
            (element) => element.name == event.cartData.name,
          );
          if (isAlredyExit) {
            emit(CartAddError(err: 'Product Already Exit'));
          } else {
            box.add(event.cartData);
            emit(CartAddLoaded());
            log(' cart add successfully');
          }
        } catch (e) {
          emit(CartAddError(err: e.toString()));
        }
      },
    );
  }
}
