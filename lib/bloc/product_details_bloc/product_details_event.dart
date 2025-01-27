// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ociuz_shopping/bloc/product_bloc/product_event.dart';

class ProductDetaildEvent {}

class ProductGetDetaildEvent extends ProductDetaildEvent {
  String id;
  ProductGetDetaildEvent({
    required this.id,
  });
}
