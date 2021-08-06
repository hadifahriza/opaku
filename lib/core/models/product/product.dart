import 'package:cloud_firestore/cloud_firestore.dart';

class Product {
  Product({
    required this.id,
    required this.name,
    required this.desc,
    required this.price,
    required this.sku,
    required this.imageURL,
    required this.size,
    required this.color,
    required this.brandId,
    required this.modelId,
    required this.categoryId,
    required this.inventoryId,
    required this.createAt,
    required this.createBy,
    required this.modifieAt,
    required this.modifiedBy,
  });

  final String id;
  final String name;
  final String desc;
  final String price;
  final String sku;
  final String imageURL;
  final String size;
  final String color;
  final String brandId;
  final String modelId;
  final String categoryId;
  final String inventoryId;
  final Timestamp createAt;
  final String createBy;
  final Timestamp modifieAt;
  final String modifiedBy;
}