// ignore_for_file: public_member_api_docs, sort_constructors_first
class ProductEvent {}

class ProductGetEvent extends ProductEvent {
  String category;
  ProductGetEvent({
    required this.category,
  });
}
