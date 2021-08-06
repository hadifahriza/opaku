import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:opaku/core/constants/constants.dart';
import 'package:opaku/core/repository/analytic/analytics_services.dart';
import 'package:opaku/logic/counter/cubit/counter_cubit.dart';
import 'package:opaku/screens/widgets/app_bar.dart';
import 'package:opaku/screens/widgets/page_bottom_bar.dart';

class Order extends StatelessWidget {
  const Order({ Key? key }) : super(key: key);

  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => const Order());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Order",
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
                child: OrderItem(
                    name: snapshot.data!.docs[index]["name"],
                    price: snapshot.data!.docs[index]["price"],
                    imgPath: snapshot.data!.docs[index]["imageURL"],
                ),
              );
            },
          );
        }
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingButton(),
      bottomNavigationBar: PageBottomBar(currentRoute: Order.route())
    );
  }
}

class OrderItem extends StatelessWidget {
  const OrderItem({
    Key? key,
    required this.imgPath,
    required this.name,
    required this.price,
  }) : super(key: key);

  final String name;
  final int price;
  final String imgPath;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => AnalyticsService().sendLogEvent(name: "Cart_item", location: "order"),
      child: Container(
        padding: kPaddingCard,
        decoration: BoxDecoration(
          borderRadius: kBorderRadiusCard,
          color: Theme.of(context).primaryColor,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 75,
              width: 75,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage(imgPath),
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
            SizedBox(width: 26.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                      color: Theme.of(context).focusColor,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  Text(
                    "Rp. $price",
                    style: TextStyle(
                      color: Theme.of(context).focusColor,
                      fontSize: 16.0
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}