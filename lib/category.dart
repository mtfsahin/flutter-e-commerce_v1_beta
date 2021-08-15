import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/bottomNavigation.dart';
import 'package:flutter_application_1/productDetail.dart';
import 'header.dart';

List<Map> products = [
  {
    "isim": "Acer Laptop",
    "fotograf": "assets/images/laptop.png",
    "fiyat": "3450"
  },
  {
    "isim": "Acer Laptop",
    "fotograf": "assets/images/laptop.png",
    "fiyat": "3450"
  },
  {
    "isim": "Acer Laptop",
    "fotograf": "assets/images/laptop.png",
    "fiyat": "3450"
  },
  {
    "isim": "Acer Laptop",
    "fotograf": "assets/images/laptop.png",
    "fiyat": "3450"
  },
  {
    "isim": "Acer Laptop",
    "fotograf": "assets/images/laptop.png",
    "fiyat": "3450"
  },
  {
    "isim": "Acer Laptop",
    "fotograf": "assets/images/laptop.png",
    "fiyat": "3450"
  },
];

class Category extends StatelessWidget {
  const Category({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Stack(children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          //header
          header("Laptop", context),
          SizedBox(
            height: 32,
          ),

          //içerikler
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              mainAxisSpacing: 15,
              crossAxisSpacing: 10,
              children: products.map((Map product) {
                return buildContext(product["isim"], product["fotograf"],
                    product["fiyat"], context);
              }).toList(),
            ),
          )
        ]),
      ),

      // Bottom navigation
      bottomNavigationBar("search"),
    ])));
  }
}

Widget buildContext(String title, String photoUrl, String price, context) {
  return GestureDetector(
    onTap: () {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return productDetail(title);
      }));
    },
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 24,
              offset: Offset(0, 16))
        ],
      ),
      child: Column(
        children: [
          SizedBox(
            height: 0,
          ),
          Image.asset(photoUrl),
          SizedBox(
            height: 0,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                    color: Color(0xFF0A1034),
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
              Text(
                "${price} ₺",
                style: TextStyle(
                    color: Color(0xFF0001FC),
                    fontSize: 12,
                    fontWeight: FontWeight.w500),
              ),
            ],
          )
        ],
      ),
    ),
  );
}
