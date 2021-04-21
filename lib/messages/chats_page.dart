import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:petinder/messages/conversation_page.dart';
import 'package:petinder/models/conversation.dart';
import 'package:petinder/viewmodels/chats_model.dart';
import 'package:provider/provider.dart';

class ChatsPage extends StatelessWidget {
  final String userId = "hAGXvEekejTTnzP8p5j8KRt0A5h2";
  const ChatsPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var model = GetIt.instance<ChatsModel>();
    return Expanded(
      child: ChangeNotifierProvider(
        create: (BuildContext context) => model,
        child: StreamBuilder<List<Conversation>>(
            stream: model.conversations(userId),
            builder: (BuildContext context,
                AsyncSnapshot<List<Conversation>> snapshot) {
              if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              }

              if (snapshot.connectionState == ConnectionState.waiting) {
                return Text('Loading...');
              }
              return ListView(
                children: snapshot.data
                    .map((doc) => SafeArea(
                          child: Material(
                            child: ListTile(
                              leading: CircleAvatar(
                                backgroundImage: NetworkImage(
                                    doc.profileImage),
                              ),
                              title: Text(doc.name),
                              subtitle: Text(doc.displayMessage),
                              trailing: Column(
                                children: <Widget>[
                                  Text("19:30"),
                                  Container(
                                    width: 20,
                                    height: 20,
                                    margin: EdgeInsets.only(top: 8),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Theme.of(context).primaryColor,
                                    ),
                                    child: Center(
                                        child: Text(
                                      "16",
                                      textScaleFactor: 0.8,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    )),
                                  )
                                ],
                              ),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (content) => ConversationPage(
                                            userId: userId,
                                            conversationId: doc.id)));
                              },
                            ),
                          ),
                        ))
                    .toList(),
              );
            }),
      ),
    );
  }
}
