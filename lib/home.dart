import 'package:flutter/material.dart';
import 'package:flutter_application_1/categories.dart';
import 'package:flutter_application_1/category.dart';
import 'package:flutter_application_1/components/bottomNavigation.dart';
import 'package:flutter_application_1/label.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ListView(
                children: [
                  //Title

                  buildTitle(),

                  //Banner
                  buildBanner(),
                  //butonlar

                  Padding(
                    padding: EdgeInsets.only(top: 48),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        buildNavigationButton(
                            text: "Categories",
                            icon: Icons.category,
                            widget: CategoriesPage(),
                            context: context),
                        buildNavigationButton(
                            text: "Favorites",
                            icon: Icons.star_border,
                            widget: buildBanner(),
                            context: context),
                        buildNavigationButton(
                            text: "Gifts",
                            icon: Icons.card_giftcard,
                            widget: buildBanner(),
                            context: context),
                        buildNavigationButton(
                            text: "Best sellings",
                            icon: Icons.people,
                            widget: buildBanner(),
                            context: context),
                      ],
                    ),
                  ),

                  SizedBox(height: 40),
                  //sales tittle
                  Text(
                    "Sales",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                        color: Color(0xFF0A1034)),
                  ),

                  SizedBox(height: 16),

                  //sales items
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      buildSaleItem(
                        text: "Iphone 12",
                        photoURl: "assets/images/iphone12.png",
                        discount: "-50%",
                        screeWidth: screenWidth,
                      ),
                      buildSaleItem(
                        text: "Iphone X",
                        photoURl: "assets/images/iphonex.png",
                        discount: "-50%",
                        screeWidth: screenWidth,
                      ),
                    ],
                  ),

                  SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      buildSaleItem(
                        text: "Samsung A71",
                        photoURl: "assets/images/iphonex.png",
                        discount: "-50%",
                        screeWidth: screenWidth,
                      ),
                      buildSaleItem(
                        text: "Iphone 12",
                        photoURl: "assets/images/iphone12.png",
                        discount: "-50%",
                        screeWidth: screenWidth,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            //BOTTOM NAVIGATION BAR
            bottomNavigationBar("home"),
          ],
        ),
      ),
    );
  }
}

//Title function
Widget buildTitle() {
  return Padding(
    padding: const EdgeInsets.only(top: 24.0),
    child: Text(
      "Home",
      style: TextStyle(
          fontSize: 32, color: Color(0xFF0A1034), fontWeight: FontWeight.bold),
    ),
  );
}

//Banner Function

Widget buildBanner() {
  return Padding(
      padding: EdgeInsets.only(top: 24),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.only(left: 24, right: 36, top: 14, bottom: 18),
        decoration: BoxDecoration(
            color: Color(0xFF0001FC), borderRadius: BorderRadius.circular(6)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Bose Home Speaker",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 4),
                Text(
                  "279₺",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
            Image.asset("assets/images/speaker.png",
                width: 70, height: 70, fit: BoxFit.fill),
          ],
        ),
      ));
}

//Navigation button

Widget buildNavigationButton({
  required String text,
  required IconData icon,
  required Widget widget,
  required BuildContext context,
}) {
  return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return widget;
        }));
      },
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 19, vertical: 22),
            decoration:
                BoxDecoration(shape: BoxShape.circle, color: Color(0xFFE0ECF8)),
            child: Icon(
              icon,
              color: Color(0xFF0001FC),
              size: 18,
            ),
          ),
          Text(
            text,
            style: TextStyle(
                color: Color(0xFF1F53e4),
                fontSize: 14,
                fontWeight: FontWeight.w500),
          ),
        ],
      ));
}

Widget buildSaleItem({
  required String text,
  required String photoURl,
  required String discount,
  required double screeWidth,
}) {
  return Container(
    width: (screeWidth - 60) * 0.5,
    padding: EdgeInsets.only(left: 12, right: 12, top: 12, bottom: 21),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //%50

        label(discount),
        SizedBox(
          height: 22,
        ),
        // telephone picture
        Center(
          child: Image.asset(
            photoURl,
          ),
        ),
        SizedBox(
          height: 22,
        ),
        Center(
          child: Text(text,
              style: TextStyle(fontSize: 18, color: Color(0xFF0A1034))),
        ),

        // name

        //
      ],
    ),
  );
}
