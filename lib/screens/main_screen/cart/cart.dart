import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:opaku/core/constants/constants.dart';
import 'package:opaku/logic/counter/cubit/counter_cubit.dart';
import 'package:opaku/screens/widgets/app_bar.dart';
import 'package:opaku/screens/widgets/cart_item.dart';

import 'cart_bottom_bar.dart';

class Cart extends StatelessWidget {
  const Cart({ Key? key }) : super(key: key);

  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => const Cart());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Cart",
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
          return ListView.separated(
            padding: kPaddingScrollView,
            itemCount: snapshot.data!.docs.length,
            separatorBuilder: (BuildContext context, int index) => SizedBox(height: 10.0),
            itemBuilder: (BuildContext context, int index) {
              return BlocProvider(
                create: (_) => CounterCubit(),
                child: CartItem(
                    name: snapshot.data!.docs[index]["name"],
                    price: snapshot.data!.docs[index]["price"],
                    imgPath: snapshot.data!.docs[index]["imageURL"],
                ),
              );
            },
          );
        }
      ),
      bottomNavigationBar: CartBottomBar(
        icon: Icons.shopping_bag_rounded,
        text: "Check Out",
        totalPrice: 100000,
      ),
    );
  }
}



