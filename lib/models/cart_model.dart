import 'package:hive_flutter/adapters.dart';

part 'cart_model.g.dart';

@HiveType(typeId: 1)
class CartModel {
  @HiveField(0)
  int? id;
  @HiveField(1)
  String? image;
  @HiveField(2)
  int? qty;
  @HiveField(3)
  double? price;
  @HiveField(4)
  String? name;
  @HiveField(5)
  String? desc;

  CartModel({
    this.id,
    this.name,
    this.image,
    this.desc,
    this.price,
    this.qty,
  });
}
