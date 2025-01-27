import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ociuz_shopping/bloc/product_bloc/product_event.dart';
import 'package:ociuz_shopping/bloc/product_bloc/product_state.dart';
import 'package:http/http.dart' as http;
import 'package:ociuz_shopping/bloc/product_details_bloc/product_details_event.dart';
import 'package:ociuz_shopping/bloc/product_details_bloc/product_details_state.dart';
import 'package:ociuz_shopping/models/product_model.dart';

class ProductDetailsBloc
    extends Bloc<ProductDetaildEvent, ProductDetailsState> {
  ProductDetailsBloc() : super(ProductGetDetailsInitial()) {
    on<ProductGetDetaildEvent>(
      (event, emit) async {
        emit(ProductGetDetailsLoading());
        try {
          var res = await http
              .get(Uri.parse('https://fakestoreapi.com/products/${event.id}'));
          if (res.statusCode == 200) {
            ProductModels data = productDetailsFromJson(res.body);
            emit(ProductGetDetailsLoaded(data: data));
          }
        } catch (e) {
          emit(ProductGetDetailsError(err: e.toString()));
        }
      },
    );
  }
}
