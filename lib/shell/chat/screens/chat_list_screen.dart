import 'package:bhojansathi/bloc/chat/chat_list/chat_list_bloc.dart';
import 'package:bhojansathi/config/routePaths.dart';
import 'package:bhojansathi/models/ChatListModel.dart';
import 'package:bhojansathi/utils/style.dart';
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
    BlocProvider.of<ChatListBloc>(context)
        .add(LoadChatListEvent(userId: FirebaseAuth.instance.currentUser!.uid));
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
      body: BlocBuilder<ChatListBloc, ChatListState>(
        builder: (context, state) {
          if (state is ChatListInitialState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is ChatListLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is ChatListLoadedState) {
            return (state.chatList.isEmpty)
                ? const Center(
                    child: Text("You don't have any chats"),
                  )
                : ListView.builder(
                    itemCount: state.chatList.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.all(5),
                        decoration: MyStyle.containerDecoration,
                        child: ListTile(
                          title: Text(state.chatList[index].name),
                          onTap: () {},
                          subtitle: Text(state.chatList[index].message),
                          leading: CircleAvatar(
                            backgroundImage:
                                NetworkImage(state.chatList[index].avatarUrl),
                          ),
                        ),
                      );
                    },
                  );
          } else if (state is ChatListOperationSucessState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is ChatListErrorState) {
            return Center(
              child: Text(state.message),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
