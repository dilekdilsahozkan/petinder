import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:petinder/style/bottom_sheet_shape.dart';

class ConversationPage extends StatefulWidget {
  final String userId;
  final String conversationId;

  const ConversationPage({Key key, this.userId, this.conversationId})
      : super(key: key);

  @override
  _ConversationPageState createState() => _ConversationPageState();
}

class _ConversationPageState extends State<ConversationPage> {
  final TextEditingController _editingController = TextEditingController();
  CollectionReference _ref;

  @override
  void initState() {
    _ref = Firestore.instance
        .collection('converations/${widget.conversationId}/messages');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Scaffold(
        appBar: AppBar(
          titleSpacing: -5,
          title: Row(children: <Widget>[
            CircleAvatar(
              backgroundImage: NetworkImage("https://placekitten.com/200/200"),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text("Dilek Dilşah"),
            ),
          ]),
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.more_horiz),
                color: Colors.white,
                onPressed: () {
                  _openMoreOptions(context);
                }),
          ],
        ),
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                      "https://cdn.shopify.com/s/files/1/0687/4327/files/1st_b41a0f9b-3c07-4fb8-a306-40e6cfbd3b13.jpg?2142"))),
          child: Column(
            children: <Widget>[
              Expanded(
                child: StreamBuilder(
                    stream: _ref.orderBy('timeStamp').snapshots(),
                    builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                      return !snapshot.hasData
                          ? CircularProgressIndicator()
                          : ListView(
                              children: snapshot.data.documents
                                  .map(
                                    (document) => ListTile(
                                      title: Align(
                                        alignment: widget.userId !=
                                                document['senderId']
                                            ? Alignment.centerLeft
                                            : Alignment.centerRight,
                                        child: Container(
                                          padding: EdgeInsets.all(8),
                                          decoration: BoxDecoration(
                                              color: widget.userId !=
                                                document['senderId']
                                            ? Colors.purple[100] : Theme.of(context)
                                                  .primaryColor,
                                              borderRadius:
                                                  BorderRadius.horizontal(
                                                      left: Radius.circular(10),
                                                      right:
                                                          Radius.circular(10))),
                                          child: Text(
                                            document['message'],
                                            style: 
                                                TextStyle(color: widget.userId !=
                                                document['senderId']
                                            ? Colors.black : Colors.white, fontSize: 20),
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                  .toList(),
                            );
                    }),
              ),
              Row(
                children: <Widget>[
                  Expanded(
                      child: Container(
                          margin: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.horizontal(
                                  left: Radius.circular(25),
                                  right: Radius.circular(25))),
                          child: Container(
                            margin:  EdgeInsets.only(left: 15),
                            child: TextField(
                              controller: _editingController,
                              decoration: InputDecoration(
                                  hintText: "Sending message...",
                                  border: InputBorder.none),
                            ),
                          ))),
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Theme.of(context).primaryColor,
                    ),
                    child: IconButton(
                      icon: Icon(Icons.send),
                      onPressed: () async {
                        await _ref.add({
                          'senderId': widget.userId,
                          'message': _editingController.text,
                          'timeStamp': DateTime.now(),
                        });
                        _editingController.text = '';
                      },
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
void _openMoreOptions(BuildContext context) {
  showModalBottomSheet(
    shape: BottomSheetShape(),
    backgroundColor: Colors.white70,
    context: context, 
    builder: (context){
    return Container(
      padding: EdgeInsets.only(top: 30),
      height: 250,
      child: Column(
        children: <Widget>[
          MaterialButton(
            onPressed: (){},
            child: Text('Block', style: TextStyle(
              color: Colors.red,
              fontSize: 23,
            ),),
          ),
          SizedBox(height: 23,),
          MaterialButton(
            onPressed: (){},
            child: Text('Complain!', style: TextStyle(
              color: Colors.red,
              fontSize: 23,
            ),),
          ),
          SizedBox(height: 10,),
          Divider(
            indent: 100,
            endIndent: 100,
            thickness: 1,
            color: Colors.black12,
          ),
          SizedBox(height: 10,),
          MaterialButton(
            onPressed: (){
              Navigator.of(context).pop();
            },
            child: Text('Close', style: TextStyle(
              color: Colors.black,
              fontSize: 23,
            ),),
          ),
        ],
      ),
    );
  });
}
