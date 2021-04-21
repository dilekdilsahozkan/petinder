import 'package:flutter/material.dart';
import 'package:petinder/events/event.dart';
import 'package:petinder/style/styleguid.dart';

class EventWidget extends StatelessWidget {
  final Event event;

  const EventWidget({Key key, this.event}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return SafeArea(
          child: Card(
        margin: const EdgeInsets.symmetric(vertical: 20),
        elevation: 4,
        color: Colors.white,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(24))),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(24)),
            gradient: LinearGradient(colors: [
              Theme.of(context).primaryColor,
              themeData.scaffoldBackgroundColor
            ], begin: Alignment.bottomRight, end: Alignment.topLeft),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.all(
                    Radius.circular(30),
                  ),
                  child: Image.asset(
                    event.imagePath,
                    height: 150,
                    fit: BoxFit.fitWidth,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, left: 8.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        flex: 3,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                               width: 350,
                               height: 45,
                          child: Wrap(
                            direction: Axis.horizontal,
                            alignment: WrapAlignment.spaceBetween,
                              children: <Widget>[
                                Text(event.title, style: eventTitleTextStyle),
                                event.sex == "female"
                                    ? Image.asset("assets/icons/gfemale.png",)
                                    : Image.asset("assets/icons/gmale.png",)
                              ],
                          ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
