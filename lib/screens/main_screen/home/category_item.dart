import 'package:flutter/material.dart';
import 'package:opaku/core/constants/constants.dart';
import 'package:opaku/core/repository/analytic/analytics_services.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    Key? key,
    required this.text
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        AnalyticsService().sendLogEvent(
          name: "Category_item",
          location: "Home Page"
        );
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: kBorderRadiusCard,
          color: Theme.of(context).primaryColor,
          boxShadow: [
            BoxShadow(
              blurRadius: 6,
              color: Theme.of(context).accentColor.withAlpha(26),
              spreadRadius: 6,
            ),
          ]
        ),
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.normal,
            color: Theme.of(context).focusColor,
          ),
        ),
      ),
    );
  }
}