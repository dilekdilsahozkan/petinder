import 'package:flutter/material.dart';
import 'package:petinder/messages/chats_page.dart';

class MessagePage extends StatelessWidget{
  final Function onMenuTap;

  const MessagePage({Key key, this.onMenuTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        drawerEnableOpenDragGesture: false,
        endDrawerEnableOpenDragGesture: false,
        //resizeToAvoidBottomPadding: true,
        body: Container(
          decoration: BoxDecoration(
              border: Border.all(width: 1, color: Colors.transparent),
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(24),
                  bottomRight: Radius.circular(24))),
          child: Column(
            children: <Widget>[
              ChatsPage(),
            ],
          ),
        ),
      ),
    );
  }
}
