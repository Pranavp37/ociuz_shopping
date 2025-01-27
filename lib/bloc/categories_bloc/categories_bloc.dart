import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ociuz_shopping/bloc/categories_bloc/categories_event.dart';
import 'package:ociuz_shopping/bloc/categories_bloc/categories_state.dart';
import 'package:http/http.dart' as http;

class CategoriesBloc extends Bloc<CategoriesEvent, CategoriesState> {
  CategoriesBloc() : super(CategoriesInitialState()) {
    on<CategoriesGetEvent>(
      (event, emit) async {
        emit(CategoriesLoadingState());
        try {
          var res = await http
              .get(Uri.parse('https://fakestoreapi.com/products/categories'));
          if (res.statusCode == 200) {
            emit(CategoriesLoadedState(categData: jsonDecode(res.body)));
          }
        } catch (e) {
          emit(
            CategoriesErrorState(err: e.toString()),
          );
        }
      },
    );
  }
}
