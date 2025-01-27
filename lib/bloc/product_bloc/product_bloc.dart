import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ociuz_shopping/bloc/product_bloc/product_event.dart';
import 'package:ociuz_shopping/bloc/product_bloc/product_state.dart';
import 'package:http/http.dart' as http;
import 'package:ociuz_shopping/models/product_model.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc() : super(ProductInitial()) {
    on<ProductGetEvent>(
      (event, emit) async {
        emit(ProductLoading());
        try {
          var res = await http.get(Uri.parse(
              'https://fakestoreapi.com/products/category/${event.category}'));
          if (res.statusCode == 200) {
            List<ProductModels> data = productodelsFromJson(res.body);
            emit(ProductLoaded(data: data));
          }
        } catch (e) {
          emit(ProductError(err: e.toString()));
        }
      },
    );
  }
}
