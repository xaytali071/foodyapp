import 'package:flutter/material.dart';
import 'package:foodyapp/view/pages/home/category_page.dart';
import 'package:foodyapp/view/pages/home/chats_page.dart';
import 'package:foodyapp/view/pages/home/home_page.dart';
import 'package:foodyapp/view/pages/home/message_page.dart';
import 'package:foodyapp/view/pages/product/add_product_page.dart';
import 'package:foodyapp/view/pages/product/product_page.dart';
import 'package:foodyapp/view/style/style.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';


class BottomNB extends StatefulWidget {
  static final title = 'salomon_bottom_bar';

  @override
  _BottomNBState createState() => _BottomNBState();
}

class _BottomNBState extends State<BottomNB> {
  var _currentIndex = 0;
  List<Widget> bodyList=[
    HomePage(),
    CategoryPage(),
    AddProductPage(),
    ChatsPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: BottomNB.title,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text(BottomNB.title),
        ),
        body:bodyList[_currentIndex] ,
        bottomNavigationBar: SalomonBottomBar(
          
          currentIndex: _currentIndex,
          onTap: (i) => setState(() => _currentIndex = i),
          items: [
            /// Home
            SalomonBottomBarItem(
              icon: Icon(Icons.home,color: Style.primaryColor,),
              title: Text("Home"),
              selectedColor:Style.primaryColor,
            ),

            /// Likes
            SalomonBottomBarItem(
              icon: Icon(Icons.shopping_bag,color:Style.primaryColor),
              title: Text("Likes"),
              selectedColor: Style.primaryColor,
            ),

            /// Search
            SalomonBottomBarItem(
              icon: Icon(Icons.message,color: Style.primaryColor,),
              title: Text("Search"),
              selectedColor: Style.primaryColor,
            ),

            /// Profile
            SalomonBottomBarItem(
              icon: Icon(Icons.person,color: Style.primaryColor,),
              title: Text("Profile"),
              selectedColor: Style.primaryColor,
            ),
          ],
        ),
      ),
    );
  }
}