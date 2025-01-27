// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ociuz_shopping/models/product_model.dart';

class ProductDetailsState {}

class ProductGetDetailsInitial extends ProductDetailsState {}

class ProductGetDetailsLoading extends ProductDetailsState {}

class ProductGetDetailsLoaded extends ProductDetailsState {
  ProductModels data;
  ProductGetDetailsLoaded({
    required this.data,
  });
}

class ProductGetDetailsError extends ProductDetailsState {
  String err;
  ProductGetDetailsError({
    required this.err,
  });
}
