import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:opaku/core/constants/constants.dart';
import 'package:opaku/core/repository/analytic/analytics_services.dart';
import 'package:opaku/logic/counter/cubit/counter_cubit.dart';

class CartItem extends StatelessWidget {
  const CartItem({
    Key? key,
    required this.name,
    required this.price,
    required this.imgPath,
  }) : super(key: key);

  final String name;
  final int price;
  final String imgPath;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => AnalyticsService().sendLogEvent(name: "Cart_item", location: "cart"),
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
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    context.read<CounterCubit>().decrement();
                    FirebaseAnalytics().logEvent(name: 'decrement',parameters:null);
                  },
                  icon: Icon(Icons.remove_circle_rounded,
                      color: Theme.of(context).accentColor),
                ),
                BlocBuilder<CounterCubit, CounterState>(
                  builder: (context, state) {
                    return Text(
                      state.counterValue.toString(),
                      style: TextStyle(
                        color: Theme.of(context).focusColor,
                        fontSize: 16.0,
                      ),
                    );
                  },
                ),
                IconButton(
                  onPressed: () {
                    context.read<CounterCubit>().increment();
                    FirebaseAnalytics().logEvent(name: 'increment',parameters:null);
                  },
                  icon: Icon(Icons.add_circle_rounded,
                      color: Theme.of(context).accentColor),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}