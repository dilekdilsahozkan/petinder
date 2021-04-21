import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:petinder/style/guest.dart';
import 'package:petinder/style/styleguid.dart';
import 'package:provider/provider.dart';

import 'event.dart';

class EventDetailsContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    final event = Provider.of<Event>(context);
    final screenWidth = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 70,
          ),
          Container(
            alignment: Alignment.topRight,
            margin: EdgeInsets.only(left: 30),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.1),
              child: Text(
                event.title,
                style: eventWhiteTitleTextStyle,
              ),
            ),
          ),
          SizedBox(
            height: 80,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Text(
              "SUITORS",
              style: guestTextStyle,
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: <Widget>[
                for (final guest in guests)
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: ClipOval(
                      child: Image.asset(
                        guest.imagePath,
                        width: 90,
                        height: 90,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
              ],
            ),
          ),
          if (event.description.isNotEmpty)
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "DESCRIPTION",
                    style: guestTextStyle,
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  Text(
                    event.description,
                    style: eventLocationTextStyle,
                  ),
                ],
              ),
            ),
          if (event.galleryImages.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(left: 16.0, top: 16, bottom: 16),
              child: Text(
                "GALLERY",
                style: guestTextStyle,
              ),
            ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: <Widget>[
                for (final galleryImagePath in event.galleryImages)
                  Container(
                    margin:
                        const EdgeInsets.only(left: 16, right: 16, bottom: 32),
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      child: Image.asset(
                        galleryImagePath,
                        width: 180,
                        height: 180,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
              ],
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16.0, top: 16, bottom: 16, right: 16),
            child: Row(
              children: <Widget>[
                Container(
                  height: 60,
                  width: 70,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                      gradient: LinearGradient(colors: [
                    Theme.of(context).primaryColor,
                    themeData.scaffoldBackgroundColor
                  ], begin: Alignment.topLeft, end: Alignment.topRight)),
                  child: Icon(Icons.favorite, color: Colors.white, size: 30,),
                ),
                Expanded(
                  child: Container(
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: Theme.of(context).primaryColor),
                  child: Center(child: Text('Adoption', style: TextStyle(color: Colors.white, fontSize: 30, fontFamily: 'Playfair', fontWeight: FontWeight.bold),)),
                  ),
                ),
                Container(
                  height: 60,
                  width: 70,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                      gradient: LinearGradient(colors: [
                    Theme.of(context).primaryColor,
                    themeData.scaffoldBackgroundColor
                  ], begin: Alignment.topRight, end: Alignment.topLeft)),
                  child: Icon(FontAwesomeIcons.share, color: Colors.white, size: 30,),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
