
import 'package:e_commerce_app/components/header.dart';
import 'package:e_commerce_app/productDetail.dart';
import 'package:flutter/material.dart';



class CategoryPage extends StatelessWidget {
  String categoryTitle;
  CategoryPage(this.categoryTitle);

  List<Map> products = [
    {
      "isim": "Rand pict 1",
      "fotograf": "https://picsum.photos/200",
      "fiyat": "999"
    },
    {
      "isim": "rand 2",
      "fotograf": "https://picsum.photos/201",
      "fiyat": "999"
    },
    {
      "isim": "Surface Laptop 1",
      "fotograf": "https://picsum.photos/202",
      "fiyat": "999"
    },
    {
      "isim": "iPhone 11 Pro Max",
      "fotograf": "https://picsum.photos/203",
      "fiyat": "999"
    },
    {
      "isim": "Macbook",
      "fotograf": "https://picsum.photos/204",
      "fiyat": "999"
    },
    {
      "isim": "Surface Laptop 8",
      "fotograf": "https://picsum.photos/205",
      "fiyat": "999"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(width: double.infinity,),
                    header(categoryTitle, context),
                    const SizedBox(height: 32),
                    //içerik
                    //buildContent("Surface Laptop 3",  "assets/speaker.jpg", "999"),
                    Expanded(
                      child: Container(
                        child: GridView.count(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          children: [
                            for(int i=0 ; i<products.length ; i++) buildContent(products[i]["isim"], products[i]["fotograf"], products[i]["fiyat"],context)

                          ],
                        ),
                      ),
                    )
                  ],
                )
            )
        )
    );
  }
}

buildContent(String title, String photoUrl, String price,context) {
  return GestureDetector(
    onTap:() {
      Navigator.push(context,MaterialPageRoute(builder: (context){
    return ProductDetailPage(title); }));
    }
    ,child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
      decoration: BoxDecoration(
          color: Colors.blueGrey.withOpacity(.2),
          borderRadius: BorderRadius.circular(6),
          ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 16,
          ),
          Expanded(
            child: Image.network(
              photoUrl,
            ),
          ),
          const SizedBox(height: 5),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                    color: Color(0xFF0A1034),
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
          Text(
            "USD $price",
            style: const TextStyle(
                color: Color(0xFF0001FC),
                fontSize: 12,
                fontWeight: FontWeight.w500),
          ),
        ],
      ),
    ),
  );
}
