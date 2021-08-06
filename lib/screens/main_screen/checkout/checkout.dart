import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:opaku/core/constants/constants.dart';
import 'package:opaku/logic/counter/cubit/counter_cubit.dart';
import 'package:opaku/screens/widgets/app_bar.dart';
import 'package:opaku/screens/widgets/cart_item.dart';

class CheckOut extends StatelessWidget {
  const CheckOut({ Key? key }) : super(key: key);

  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => const CheckOut());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Check Out",
      ),
      body: Container(
        padding: kPaddingScrollView,
        child: Column(
          children: [
            Expanded(child: OrderList()),
            SizedBox(height: 16.0),
            Center(child: OrderDetails()),
            SizedBox(height: 16.0),
            Expanded(child: CardDetails()),
          ],
        )
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          padding: kPaddingScrollView,
          child: ElevatedButton(
            onPressed: () {},
            style: TextButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0)
              ),
              padding: kPaddingCard,
              backgroundColor: Theme.of(context).accentColor
            ),
            child: Text(
              "Confirm",
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class OrderList extends StatelessWidget {
  const OrderList({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
            .collection("product")
            .snapshots(),
      builder: (context, snapshot) {
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
          }
        );
      },
    );
  }
}

class OrderDetails extends StatelessWidget {
  const OrderDetails({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        RichText(
          text: TextSpan(
            style: TextStyle(
              fontSize: 16.0,
              color: Theme.of(context).focusColor,
            ),
            children: [
              TextSpan(
                text: "Product ",
              ),
              TextSpan(
                text: "2",
                style: TextStyle(
                  fontWeight: FontWeight.bold
                )
              ),
            ]
          ),
        ),
        RichText(
          text: TextSpan(
            style: TextStyle(
              fontSize: 16.0,
              color: Theme.of(context).focusColor,
            ),
            children: [
              TextSpan(
                text: "Total ",
              ),
              TextSpan(
                text: "Rp. 500000",
                style: TextStyle(
                  fontWeight: FontWeight.bold
                )
              ),
            ]
          ),
        ),
        RichText(
          text: TextSpan(
            style: TextStyle(
              fontSize: 16.0,
              color: Theme.of(context).focusColor,
            ),
            children: [
              TextSpan(
                text: "Taxes ",
              ),
              TextSpan(
                text: "Rp. 5000",
                style: TextStyle(
                  fontWeight: FontWeight.bold
                )
              ),
            ]
          ),
        ),
      ],
    );
  }
}

class CardDetails extends StatelessWidget {
  const CardDetails({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.only(top: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          TextField(
            decoration: InputDecoration(
              labelText: "Card Holders Name",
            ),
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 16.0),
          TextField(
            decoration: InputDecoration(
              labelText: "Card Number",
            ),
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 16.0),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    labelText: "Expire Date",
                  ),
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(width: 16.0),
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    labelText: "CVV",
                  ),
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}