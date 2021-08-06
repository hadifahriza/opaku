import 'package:flutter/material.dart';
import 'package:opaku/core/constants/constants.dart';
import 'package:opaku/core/repository/analytic/analytics_services.dart';
import 'package:opaku/screens/main_screen/product_details/product_details.dart';

class CardItem extends StatelessWidget {
  const CardItem({
    Key? key,
    required this.name,
    required this.desc,
    required this.price,
    required this.imgPath,
  }) : super(key: key);

  final String name;
  final String desc;
  final int price;
  final String imgPath;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => ProductDetails(
              desc: desc,
              imgPath: imgPath,
              name: name,
              price: price,
            ),
          ),
        );
        AnalyticsService().sendLogEvent(name: "Card_item", location: "card item");
      },
      borderRadius: kBorderRadiusCard,
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: kBorderRadiusCard,
          boxShadow: [
            BoxShadow(
              blurRadius: 6,
              color: Theme.of(context).accentColor.withAlpha(26),
              spreadRadius: 6,
            ),
          ]
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  padding: EdgeInsets.all(6.0),
                  onPressed: () {},
                  icon: Icon(
                    Icons.favorite_border_rounded,
                    color: Theme.of(context).accentColor,
                  ),
                  iconSize: 26.0,
                ),
              ],
            ),
            Column(
              children: [
                Hero(
                  tag: imgPath,
                  child: Container(
                    height: 75.0,
                    width: 75.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage(imgPath),
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Text(
              name,
              style: TextStyle(
                color: Theme.of(context).focusColor,
                fontSize: 16.0,
              ),
            ),
            Text(
              "Rp. $price",
              style: TextStyle(
                color: Theme.of(context).focusColor,
                fontSize: 16.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}