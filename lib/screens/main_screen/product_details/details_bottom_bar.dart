import 'package:flutter/material.dart';
import 'package:opaku/core/repository/analytic/analytics_services.dart';

class DetailsBottomBar extends StatelessWidget {
  const DetailsBottomBar({
    Key? key,
    required this.text,
    required this.icon,
    required this.totalPrice,
  }) : super(key: key);

  final String text;
  final IconData icon;
  final int totalPrice;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.transparent,
      elevation: 9.0,
      clipBehavior: Clip.antiAlias,
      child: Container(
        height: 60.0,
        padding: EdgeInsets.symmetric(horizontal: 26.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25.0),
            topRight: Radius.circular(25.0)
          ),
          color: Colors.white
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Rp. $totalPrice",
              style: TextStyle(
                color: Theme.of(context).focusColor,
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextButton(
              onPressed: () {
                AnalyticsService().sendLogEvent(name: "Cart_Bottom_Bar", location: "cart");
              },
              style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.0)
                ),
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
                backgroundColor: Theme.of(context).accentColor
              ),
              child: Row(
                children: [
                  Icon(
                    icon,
                    color: Theme.of(context).primaryColor
                  ),
                  SizedBox(width: 16.0),
                  Text(
                    text,
                    style: TextStyle(
                      color: Theme.of(context).primaryColor
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}