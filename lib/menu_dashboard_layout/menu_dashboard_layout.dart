import 'package:flutter/material.dart';
import 'package:hidden_drawer_menu/hidden_drawer/hidden_drawer_menu.dart';
import 'package:petinder/a_map/screens/location_page.dart';
import 'package:petinder/pages/adoption_page.dart';
import 'package:petinder/pages/home_page.dart';
import 'package:petinder/pages/message_page.dart';
import 'package:petinder/pages/profile_page.dart';
import 'package:petinder/style/styleguid.dart';

class MenuDashboardLayout extends StatefulWidget {
  
  @override
  _MenuDashboardLayoutState createState() => _MenuDashboardLayoutState();
}

class _MenuDashboardLayoutState extends State<MenuDashboardLayout> {

  List<ScreenHiddenDrawer> items = new List();

  @override
  void initState() {
    items.add(new ScreenHiddenDrawer(
        new ItemHiddenMenu(
          name: 'Petinder',
          baseStyle: TextStyle(color: Colors.black, fontSize: 28.0 ),
          colorLineSelected: Colors.purple,
          selectedStyle: TextStyle(color: Colors.purple, fontWeight: FontWeight.bold),
        ),
        HomePage())
    );
    items.add(new ScreenHiddenDrawer(
        new ItemHiddenMenu(
          name: 'Profile',          
          baseStyle: TextStyle( color: Colors.black, fontSize: 28.0 ),
          colorLineSelected: Colors.teal,
          selectedStyle: TextStyle(color: Colors.purple,fontWeight: FontWeight.bold),
        ),
        ProfilePage())
    );

    items.add(new ScreenHiddenDrawer(
        new ItemHiddenMenu(
          name: 'Adoption',
          baseStyle: TextStyle( color: Colors.black, fontSize: 28.0),
          colorLineSelected: Colors.orange,
          selectedStyle: TextStyle(color: Colors.purple,fontWeight: FontWeight.bold),
        ),
        AdoptionPage())
    );
    items.add(new ScreenHiddenDrawer(
        new ItemHiddenMenu(
          name: 'Messages',
          baseStyle: TextStyle( color: Colors.black, fontSize: 28.0 ),
          colorLineSelected: Colors.purple,
          selectedStyle: TextStyle(color: Colors.purple,fontWeight: FontWeight.bold),
        ),
        MessagePage()
        )
    );
    items.add(new ScreenHiddenDrawer(
        new ItemHiddenMenu(
          name: 'Location',
          baseStyle: TextStyle( color: Colors.black, fontSize: 28.0 ),
          colorLineSelected: Colors.pink,
          selectedStyle: TextStyle(color: Colors.purple,fontWeight: FontWeight.bold),
        ),
        MapPage())
    );
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return HiddenDrawerMenu(
      //backgroundColorMenu: Colors.black,
      //backgroundColorAppBar: Colors.green,
      screens: items,
           // typeOpen: TypeOpen.FROM_RIGHT,
          //  enableScaleAnimin: true,
          //  enableCornerAnimin: true,
           slidePercent: 50.0,
           verticalScalePercent: 90.0,
           contentCornerRadius: 40.0,
        //  iconMenuAppBar: Icon(Icons.menu),
        //    backgroundContent: DecorationImage((image: ExactAssetImage('assets/bg_news.jpg'),fit: BoxFit.cover),
            whithAutoTittleName: true,
            styleAutoTittleName: appBarTextStyle,
            isTitleCentered: true,
        //    actionsAppBar: <Widget>[],
        //    backgroundColorContent: Colors.blue,
            elevationAppBar: 0.0,
           // tittleAppBar: Center(child: Text(styleAutoTittleName: appBarTextStyle,))
           // tittleAppBar: Center(chi),
        //    enableShadowItensMenu: true,
    );
  }
}