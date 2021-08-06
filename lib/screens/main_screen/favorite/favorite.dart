import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:opaku/core/constants/constants.dart';
import 'package:opaku/screens/widgets/app_bar.dart';
import 'package:opaku/screens/widgets/card_item.dart';
import 'package:opaku/screens/widgets/page_bottom_bar.dart';

class Favorite extends StatelessWidget {
  const Favorite({ Key? key }) : super(key: key);

  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => const Favorite());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Favorite",
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
              .collection("product")
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
        
          return GridView.builder(
            padding: kPaddingScrollView,
            itemCount: snapshot.data!.docs.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 4/5,
              crossAxisCount: 2,
              crossAxisSpacing: 10.0,
              mainAxisSpacing: 16.0,
            ),
            itemBuilder: (BuildContext context, int index) {
              return CardItem(
                desc: snapshot.data!.docs[index]["desc"],
                name: snapshot.data!.docs[index]["name"],
                price: snapshot.data!.docs[index]["price"],
                imgPath: snapshot.data!.docs[index]["imageURL"],
              );
            }
          );
        }
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingButton(),
      bottomNavigationBar: PageBottomBar(currentRoute: Favorite.route())
    );
  }
}