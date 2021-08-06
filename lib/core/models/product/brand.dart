import 'package:cloud_firestore/cloud_firestore.dart';

class Brand {
  Brand({
    required this.id,
    required this.name,
    required this.createAt,
    required this.createBy,
    required this.modifieAt,
    required this.modifiedBy,
  });
  
  final String id;
  final String name;
  final Timestamp createAt;
  final String createBy;
  final Timestamp modifieAt;
  final String modifiedBy;
}