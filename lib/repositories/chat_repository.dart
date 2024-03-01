import 'package:bhojansathi/models/ChatListModel.dart';
import 'package:bhojansathi/models/ChatModel.dart';
import 'package:bhojansathi/shell/chat/screens/chat_list_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatRepository {
  ChatRepository({FirebaseFirestore? firestore})
      : _firestore = firestore ?? FirebaseFirestore.instance;

  final FirebaseFirestore _firestore;

  Stream<List<ChatListModel>> getListOfChats(String userId) {
    return _firestore
        .collection('chat_list')
        .where('senderId', isEqualTo: userId)
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => ChatListModel.fromMap(doc.data()))
            .toList());
  }

  bool isChatListExist(String userId,String receiverId) {
    _firestore
        .collection('chat_list')
        .where('senderId', isEqualTo: userId)
        .where('receiverId', isEqualTo: receiverId)
        .get()
        .then((value) {
      if (value.docs.length > 0) {
        return true;
      } else {
        return false;
      }
    });
    return false;
  }

  Stream<List<ChatModel>> getChats(String senderId, String receiverId) {
    return _firestore.collection('chats').snapshots().map((snapshot) =>
        snapshot.docs.map((doc) => ChatModel.fromMap(doc.data())).toList());
  }

  Future<void> addChat(ChatModel chatModel) async {
    await _firestore.collection('chats').add(chatModel.toMap());
  }

  Future<void> addChatList(ChatListModel chatListModel) async {
    await _firestore.collection('chat_list').add(chatListModel.toMap());
  }
}
