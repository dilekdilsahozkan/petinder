import 'package:flutter/material.dart';
import 'package:petinder/style/background.dart';

class FavoritesPage extends StatelessWidget{

  final Function onMenuTap;

  const FavoritesPage({Key key, this.onMenuTap}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          PageBackground(screenHeight: MediaQuery.of(context).size.height),
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            physics: ClampingScrollPhysics(),
            child: Container(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 35),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Container(
                    height: 200,
                    child: PageView(
                      controller: PageController(viewportFraction: 0.8),
                      scrollDirection: Axis.horizontal,
                      pageSnapping: true,
                      children: <Widget>[],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}