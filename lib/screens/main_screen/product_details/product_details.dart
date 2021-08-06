import 'package:flutter/material.dart';
import 'package:opaku/core/constants/constants.dart';
import 'package:opaku/core/repository/analytic/analytics_services.dart';
import 'package:opaku/screens/widgets/app_bar.dart';

import 'details_bottom_bar.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({
    Key? key,
    required this.desc,
    required this.imgPath,
    required this.name,
    required this.price
  }) : super(key: key);

  final String name;
  final int price;
  final String imgPath;
  final String desc;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Product Detail",
      ),
      body: Container(
        padding: kPaddingScrollView,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor
                ),
                child: Center(
                  child: Hero(
                    tag: "assets/images/baby_shirt.jpg",
                    child: Container(
                      height: 250.0,
                      width: 250.0,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: AssetImage(imgPath),
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                      color: Theme.of(context).focusColor,
                      fontSize: 26.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    "Rp. $price",
                    style: TextStyle(
                      color: Theme.of(context).focusColor,
                      fontSize: 16.0,
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    desc,
                    style: TextStyle(
                      color: Theme.of(context).focusColor,
                      fontSize: 16.0,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 2,
                        child: Text(
                          "Available color",
                          style: TextStyle(
                            color: Theme.of(context).focusColor,
                            fontSize: 16.0,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            DotColor(colorName: "Hijau", color: Colors.green),
                            DotColor(colorName: "Merah", color: Colors.red),
                            DotColor(colorName: "Biru", color: Colors.blue),
                            DotColor(colorName: "Kuning", color: Colors.yellow),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: DetailsBottomBar(
        icon: Icons.bookmark_rounded,
        text: "Order",
        totalPrice: price,
      ),
    );
  }
}

class DotColor extends StatelessWidget {
  const DotColor({
    Key? key,
    required this.colorName,
    required this.color
  }) : super(key: key);

  final String colorName;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        AnalyticsService().sendLogEvent(
          name: "Tombol_Warna_$colorName",
          location: "product details $colorName"
        );
      },
      icon: Icon(
        Icons.circle_rounded,
        color: color,
        size: 16.0,
      ),
    );
  }
}