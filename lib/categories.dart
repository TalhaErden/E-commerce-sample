
import 'package:e_commerce_app/category.dart';
import 'package:e_commerce_app/components/bottomNavigation.dart';
import 'package:e_commerce_app/components/header.dart';
import 'package:flutter/material.dart';

class CategoriesPage extends StatelessWidget {
  final List<String> categories = [
    "All",
    "Computers",
    "Accessories",
    "Smartphones",
    "Smart objects",
    "Speakers",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Stack(children: [
      Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                //Header
                header("Categories", context) ,
           
            const SizedBox(height: 16),


            Expanded(
              child: ListView
                (children: categories.map((String title) => buildCategory(title,context)).toList() ,),
            ),






            Container(
              padding: const EdgeInsets.all(24),
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(6),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.25),
                      blurRadius: 4,
                      offset: const Offset(0, 4),
                    ),
                  ]),
              child: const Text(
                "All",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
            ),
          ])),
              bottomNavigationBar(),
    ])));
  }
}

Widget buildCategory(String title,context) {
  return GestureDetector(
    onTap:(){
      Navigator.push(context, MaterialPageRoute(builder: (context){
        return CategoryPage(title) ;
      }));

    },
    child: Container(
      padding: const EdgeInsets.all(24),
      margin:const EdgeInsets.only(bottom: 16) ,
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(6),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.25),
              blurRadius: 4,
              offset: const Offset(0, 4),
            ),
          ]),
      child: Text(
        title,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
      ),
    ),
  );
}
