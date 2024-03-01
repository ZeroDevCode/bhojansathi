import 'package:bhojansathi/bloc/chat/chat_list/chat_list_bloc.dart';
import 'package:bhojansathi/config/routePaths.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class Chat extends StatefulWidget {
  const Chat({super.key});

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {

  @override
  void initState() {
    BlocProvider.of<ChatListBloc>(context).add(LoadChatListEvent(userId: FirebaseAuth.instance.currentUser!.uid));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Chat',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: BlocB,
    );
  }
}
