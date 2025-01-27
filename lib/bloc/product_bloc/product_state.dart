// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ociuz_shopping/models/product_model.dart';

class ProductState {}

class ProductInitial extends ProductState {}

class ProductLoading extends ProductState {}

class ProductLoaded extends ProductState {
  List<ProductModels> data = [];
  ProductLoaded({
    required this.data,
  });
}

class ProductError extends ProductState {
  String err;
  ProductError({
    required this.err,
  });
}
