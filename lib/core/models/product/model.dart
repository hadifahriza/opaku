import 'package:cloud_firestore/cloud_firestore.dart';

class Model {
  Model({
    required this.id,
    required this.name,
    required this.brandId,
    required this.imageURL,
    required this.createAt,
    required this.createBy,
    required this.modifieAt,
    required this.modifiedBy,
  });

  final String id;
  final String name;
  final String brandId;
  final String imageURL;
  final Timestamp createAt;
  final String createBy;
  final Timestamp modifieAt;
  final String modifiedBy;
}