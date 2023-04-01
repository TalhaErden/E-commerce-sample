import 'package:e_commerce_app/components/bottomNavigation.dart';
import 'package:e_commerce_app/components/label.dart';
import 'package:flutter/material.dart';

import 'components/header.dart';

class ProductDetailPage extends StatefulWidget {
  String productTitle;

  ProductDetailPage(this.productTitle);

  @override
  _ProductDetailPageState createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  Color? selectedColor;
  int selectedCapacity = 64;

  List<Color> colors = [
    Color(0xFF52514F),
    Color(0xFF0001FC),
    Color(0xFF6F7972),
    Color(0xFFF5D8C0)
  ];

  List<int> capacities = [64, 256, 512];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Stack(children: [
      Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            header(widget.productTitle, context),
            SizedBox(
              height: 15,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: ListView(
                  children: [
                    //new etiketi
                    label("New"),
                    SizedBox(
                      height: 25,
                    ),
                    //ÜRÜN FOTO
                    Center(child: Image.asset("assets/indir.jpg")),
                    SizedBox(
                      height: 30,
                    ),

                    //RENK SEÇENEK
                    Text(
                      "Color",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.black),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: colors
                            .map((Color color) => colorOption(
                                color: color,
                                selected: selectedColor == color,
                                onTap: () {
                                  setState(() {
                                    selectedColor = color;
                                  });
                                }))
                            .toList()),

                    //KAPASİTE SEÇ

                    SizedBox(
                      height: 32,
                    ),
                    Text(
                      "Capacity",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.black),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: capacities
                            .map((int number) => capacityOption(
                                capacity: number,
                                selected: selectedCapacity == number,
                                onTap: () {
                                  setState(() {
                                    selectedCapacity = number;
                                  });
                                }))
                            .toList()),
                    SizedBox(
                      height: 32,
                    ),

                    //SEPETE EKLE BUTONU
                    GestureDetector(
                      onTap: (){
                        print("ürün sepete eklendi.");
                        print("Ürünün ismi: " + widget.productTitle);
                        print("Ürünün rengi: " + selectedColor!.value.toString());
                        print("Ürünün kapasitesi: " + selectedCapacity.toString() + "gb");

                      },
                      child: Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(vertical: 16),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: Color(0xFF1F53E4)),
                        child: Text(
                          "Add to cart",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    )
                    ,SizedBox(height: 96,)
                  ],
                ),
              ),
            ),
          ]))
            ,  bottomNavigationBar()
    ])));
  }
}

Widget colorOption(
    {required Color color, required bool selected, required var onTap}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      margin: EdgeInsets.only(right: 15),
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color,
          border:
              Border.all(color: Color(0xFF0001FC), width: selected ? 3 : 0)),
      width: 23,
      height: 23,
    ),
  );
}

Widget capacityOption(
    {required int capacity, required bool selected, required var onTap}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      margin: EdgeInsets.only(right: 23),
      child: Text(
        "$capacity gb",
        style: TextStyle(
            color: Color(selected ? 0xFF0001FC : 0xFFA7A9BE), fontSize: 16),
      ),
    ),
  );
}
