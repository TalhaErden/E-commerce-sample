import 'package:e_commerce_app/categories.dart';
import 'package:e_commerce_app/components/label.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'components/bottomNavigation.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{
  @override
  Widget build(BuildContext context){
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ListView(
                children: [
                  //BAŞLIK
                  buildBaslik(),
                  //BANNER
                  buildBanner(),

                  //BUTONLAR
                  Padding(
                    padding: const EdgeInsets.only(top: 48),
                    child: Row(
                      mainAxisAlignment:MainAxisAlignment.spaceBetween ,
                      children: [
                        //ilk eleman
                        buildNavigation(text: "Categories", icon: Icons.menu,widget: CategoriesPage(),context: context),
                        //ikinci eleman
                        buildNavigation(text: "Favorites", icon: Icons.star_border),
                        //üçüncü eleman
                        buildNavigation(text: "Gifts", icon: Icons.card_giftcard),
                        //dördüncü eleman
                        buildNavigation(text: "Best selling", icon: Icons.people_alt_rounded)
                      ],
                    ),
                  ),
                  //SALES TiTle
                  const SizedBox(height: 40),
                  const Text("Sales",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24,color: Color(0xFF0A1034)),),
                  const SizedBox(height: 16),


                  //SALES ITEMS
                  Row(mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                      buildSalesItem(text: "Smartphones",
                          icon: Icons.phone_android,
                          discount: "-%50",
                          screenWidth: screenWidth),
                      buildSalesItem(text: "Monitors",
                          icon: Icons.computer_sharp,
                          discount: "-%30",
                          screenWidth: screenWidth),
                     ],),
                  const SizedBox(height: 10,),
                  Row(mainAxisAlignment: MainAxisAlignment.center,
                    children: [ buildSalesItem(text: "Microphones", icon: Icons.mic_rounded, discount: "-%40", screenWidth: screenWidth),
                      buildSalesItem(text: "Musics", icon: Icons.queue_music, discount: "-%25", screenWidth: screenWidth)
                  ],),
                  SizedBox(height: 50,),

                ],
              ),
            ),
           // BOTTOM NAVIGATION BAR
         bottomNavigationBar(),
          ],
        ),
      ),
    );
  }
}




Widget buildBaslik() {
  return const Padding(
    padding: EdgeInsets.only(
      top: 24.0,
    ),
    child: Text(
      "Home",
      style: TextStyle(
          fontSize: 32, color: Color(0xFF0A1034), fontWeight: FontWeight.bold),
    ),
  );
}

Widget buildBanner() {
  return Padding(
      padding: const EdgeInsets.only(top: 24.0),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.only(left: 24, right: 36, top: 14, bottom: 18),
        decoration: BoxDecoration(
            gradient: const RadialGradient(
              colors: [Colors.purple,Colors.pink],
              radius: 4,
              center: Alignment.centerLeft
            ),
            borderRadius: BorderRadius.circular(6)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "Bose Home Speaker",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 4),
                Text(
                  "USD 279",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
            const Icon(
              Icons.headphones,
              size: 70,
            )
          ],
        ),
      ));
}

buildNavigation(
    {required String text,
      required IconData icon,
      Widget? widget,
      BuildContext? context,
    }) {
  return GestureDetector(
    onTap:(){
      Navigator.push(context!, MaterialPageRoute(builder:(context){
        return widget! ;
      }));
    },
    child: Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 19, vertical: 22),
          decoration:
          const BoxDecoration(shape: BoxShape.circle, color: Color(0xFFE0ECF8)),
          child: Icon(icon, color: const Color(0xFF0001FC), size: 18),
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          text,
          style: const TextStyle(
              color: Color(0xFF1F53E5),
              fontSize: 14,
              fontWeight: FontWeight.w500),
        )
      ],
    ),
  );
}

buildSalesItem({required String text,
  required IconData icon
  ,required String discount
  ,required double screenWidth}){
  return   Container(
    width: (screenWidth - 60) * 0.5 ,
    padding: const EdgeInsets.only(left: 12,top: 12,bottom: 21,right: 12),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [ label(discount),
        //%50
        const SizedBox(height: 22),
        //telefon resmi
        Icon(icon,size: 120),
        const SizedBox(height: 22,),
        //ismi
        Center(
          child: Text(text,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 18,color: Color(0xFF0A1034))),
        )


      ],),
  );
}