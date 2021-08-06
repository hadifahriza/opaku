import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'category_item.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
              .collection("category")
              .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        }

        if (snapshot.data == null) {
          return Text("Belum ada data");
        }
        
        return ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: snapshot.data!.docs.length,
          separatorBuilder: (BuildContext context, int index) => SizedBox(width: 6.0),
          itemBuilder: (BuildContext context, int index) {
            return CategoryItem(
              text: snapshot.data!.docs[index]["name"],
            );
          }
        );
      }
    );
  }
}