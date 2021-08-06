import 'package:cloud_firestore/cloud_firestore.dart';

class Inventory {
  Inventory({
    required this.id,
    required this.quantity,
    required this.createAt, 
    required this.createBy,
    required this.modifieAt,
    required this.modifiedBy
  });

  final String id;
  final String quantity;
  final Timestamp createAt;
  final String createBy;
  final Timestamp modifieAt;
  final String modifiedBy;
}