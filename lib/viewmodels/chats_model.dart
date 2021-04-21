import 'package:get_it/get_it.dart';
import 'package:petinder/models/conversation.dart';
import 'package:petinder/services/chat_service.dart';
import 'package:petinder/viewmodels/base_model.dart';

class ChatsModel extends BaseModel{

  final ChatService _db = GetIt.instance<ChatService>();
  Stream<List<Conversation>> conversations(String userId){
    return _db.getConversations(userId);
  }
}