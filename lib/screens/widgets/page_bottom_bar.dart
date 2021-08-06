import 'package:flutter/material.dart';
import 'package:opaku/core/repository/analytic/analytics_services.dart';
import 'package:opaku/screens/main_screen/cart/cart.dart';
import 'package:opaku/screens/main_screen/favorite/favorite.dart';
import 'package:opaku/screens/main_screen/home/home.dart';
import 'package:opaku/screens/main_screen/order/order.dart';
import 'package:opaku/screens/main_screen/profile/profile.dart';

class FloatingButton extends StatelessWidget {
  const FloatingButton({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Navigator.of(context).push<void>(Cart.route());
        AnalyticsService().sendLogEvent(name: "Cart_route", location: "Bottom Bar");
      },
      backgroundColor: Theme.of(context).accentColor,
      child: Icon(
        Icons.shopping_cart_rounded,
        color: Theme.of(context).primaryColor,
      ),
    );
  }
}

class PageBottomBar extends StatelessWidget {
  const PageBottomBar({ Key? key , required this.currentRoute }) : super(key: key);

  final Route<dynamic> currentRoute;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: CircularNotchedRectangle(),
      notchMargin: 10.0,
      color: Colors.transparent,
      elevation: 9.0,
      clipBehavior: Clip.antiAlias,
      child: Container(
        height: 60.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25.0),
            topRight: Radius.circular(25.0)
          ),
          color: Theme.of(context).primaryColor
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 60.0,
              width: MediaQuery.of(context).size.width /2 - 40.0,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  currentRoute == Home.route()
                    ? SelectedItem(label: "Home", icon: Icons.home_rounded)
                    : UnselectedItem(icon: Icons.home_rounded, name: "Home", route: Home.route()),
                  currentRoute == Favorite.route()
                    ? SelectedItem(label: "Favorite", icon: Icons.favorite_rounded )
                    : UnselectedItem(icon: Icons.favorite_rounded, name: "Favorite", route: Favorite.route()),
                ],
              ),
            ),
            Container(
              height: 60.0,
              width: MediaQuery.of(context).size.width /2 - 40.0,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  currentRoute == Order.route()
                    ? SelectedItem(label: "Order", icon: Icons.bookmark_rounded)
                    : UnselectedItem(icon: Icons.bookmark_rounded, name: "Order", route: Order.route()),
                  currentRoute == Profile.route()
                    ? SelectedItem(label: "Profile", icon: Icons.person_rounded)
                    : UnselectedItem(icon: Icons.person_rounded, name: "Profile", route: Profile.route()),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SelectedItem extends StatelessWidget {
  const SelectedItem({
    Key? key,
    required this.label,
    required this.icon,
  }) : super(key: key);

  final String label;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.0),
          color: Theme.of(context).accentColor.withAlpha(100)
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: Theme.of(context).primaryColor,
            ),
            SizedBox(width: 6.0),
            Text(
              label,
              style: TextStyle(
                color: Theme.of(context).primaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class UnselectedItem extends StatelessWidget {
  const UnselectedItem({
    Key? key,
    required this.icon,
    required this.name,
    required this.route,
  }) : super(key: key);

  final IconData icon;
  final String name;
  final Route<dynamic> route;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push<void>(route);
        AnalyticsService().sendLogEvent(name: "$name", location: "Bottom Bar");
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
        child: Icon(
          icon,
          color: Theme.of(context).accentColor.withAlpha(100)
        ),
      ),
    );
  }
}