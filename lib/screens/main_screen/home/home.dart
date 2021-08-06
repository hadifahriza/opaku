import 'package:flutter/material.dart';
import 'package:opaku/core/constants/constants.dart';
import 'package:opaku/screens/widgets/app_bar.dart';
import 'package:opaku/screens/widgets/page_bottom_bar.dart';

import 'category_list.dart';
import 'product_list.dart';

class Home extends StatelessWidget {
  const Home({ Key? key }) : super(key: key);

  static Page page() => const MaterialPage<void>(child: Home());

  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => const Home());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Home",
      ),
      body: Container(
        padding: kPaddingScrollView,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "Our Product",
              style: TextStyle(
                color: Theme.of(context).focusColor,
                fontSize: 16.0,
                fontWeight: FontWeight.bold
              ),
            ),
            SizedBox(height: 10.0),
            Expanded(
              flex: 1,
              child: CategoryList(),
            ),
            SizedBox(height: 10.0),
            Expanded(
              flex: 12,
              child: ProductList(),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingButton(),
      bottomNavigationBar: PageBottomBar(currentRoute: Home.route())
    );
  }
}





