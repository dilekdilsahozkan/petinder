import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:petinder/models/conversation.dart';

class ChatService {
  final Firestore _firestore = Firestore.instance;

  Stream<List<Conversation>> getConversations(String userId) {
    var ref = _firestore
        .collection('converations')
        .where('members', arrayContains: userId);

    return ref.snapshots().map((list) =>
        list.documents.map((snapshot) => Conversation.fromSnapshot(snapshot)).toList());
  }
}
