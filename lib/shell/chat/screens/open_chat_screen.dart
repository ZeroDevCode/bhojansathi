import 'package:bhojansathi/utils/style.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ChatViewScreen extends StatefulWidget {
  final String chatId;
  const ChatViewScreen({Key? key, required this.chatId}) : super(key: key);

  @override
  State<ChatViewScreen> createState() => _ChatViewScreenState();
}

class _ChatViewScreenState extends State<ChatViewScreen> {
  final userId = FirebaseAuth.instance.currentUser!.uid;
  var chats;

  late Stream<List<Message>> messagesStream;

  @override
  void initState() {
    super.initState();
    messagesStream = getMessages(userId, widget.chatId);
  }

  Future<void> sendMessage(String currentUserID, String otherUserID, String message) async {
    await FirebaseFirestore.instance
        .collection('chats')
        .doc(currentUserID)
        .collection('rooms')
        .doc(otherUserID)
        .collection('messages')
        .add({
      'text': message,
      'senderId': currentUserID,
      'timestamp': FieldValue.serverTimestamp(),
    });
  }

  Stream<List<Message>> getMessages(String currentUserID, String otherUserID) {
    return FirebaseFirestore.instance
        .collection('chats')
        .doc(currentUserID)
        .collection('rooms')
        .doc(otherUserID)
        .collection('messages')
        .orderBy('timestamp', descending: true)
        .snapshots()
        .map((snapshot) => snapshot.docs.map((doc) => Message.fromDocumentSnapshot(doc)).toList());
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Chat Name'),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.phone_outlined)),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 5.0),
                child: StreamBuilder<List<Message>>(
                  stream: messagesStream,
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      sendMessage(userId, widget.chatId, "Hello");
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    List<Message> messages = snapshot.data!;
                    return ListView.builder(
                      itemCount: messages.length,
                      itemBuilder: (context, index) {
                        Message message = messages[index];
                        return MessageBubble(message: message, isCurrentUser: message.senderId == userId);
                      },
                    );
                  },
                ),
              ),
            ),
            Container(
              height: 60,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 1),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: TextFormField(
                      textAlign: TextAlign.start,
                      keyboardType: TextInputType.multiline,
                      decoration: MyStyle.outlinedTextStyle.copyWith(
                        hintText: "Type a message",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onFieldSubmitted: (value) {
                        if (value.trim().isNotEmpty) {
                          sendMessage(userId, widget.chatId, value.trim());
                        }
                      },
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      sendMessage(userId, widget.chatId, "Hello");
                    },
                    icon: const Icon(Icons.send_outlined),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Message {
  final String text;
  final String senderId;
  final Timestamp timestamp;

  Message({required this.text, required this.senderId, required this.timestamp});

  factory Message.fromDocumentSnapshot(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return Message(
      text: data['text'],
      senderId: data['senderId'],
      timestamp: data['timestamp'],
    );
  }
}

class MessageBubble extends StatelessWidget {
  final Message message;
  final bool isCurrentUser;

  const MessageBubble({Key? key, required this.message, required this.isCurrentUser}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: isCurrentUser ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        Container(
          constraints: const BoxConstraints(maxWidth: 250),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            color: isCurrentUser ? Colors.blue : Colors.grey.withOpacity(0.2),
          ),
          margin: const EdgeInsets.all(8),
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (!isCurrentUser)
                const Text(
                  "Other User",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              const Divider(
                height: 5,
              ),
              Text(
                message.text,
                style: const TextStyle(fontSize: 12),
              ),
              Container(
                alignment: Alignment.bottomRight,
                child: Text(
                  DateFormat('HH:mm').format(message.timestamp.toDate()),
                  style: const TextStyle(fontSize: 10),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}

