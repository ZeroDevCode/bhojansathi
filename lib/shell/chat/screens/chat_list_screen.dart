import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Chat extends StatefulWidget {
  const Chat({Key? key}) : super(key: key);

  @override
  State<Chat> createState() => _ChatState();
}

List<String> imageUrls = [
  'https://source.unsplash.com/random',
  'https://source.unsplash.com/random'
];

List messages = [
  'Hello',
  'Order status?',
  'Thank you',
  'What is ETA?',
  'Hello',
  'We will deliver soon'
];

List times = [
  '12:00 PM',
  '12:01 PM',
  '12:02 PM',
  '12:03 PM',
  '12:04 PM',
  '12:05 PM',
];

List users = [
  'Lakshya',
  'Raj',
  'Ram',
  'Shyam',
  'Gopal',
  'Krishna',
];

class _ChatState extends State<Chat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Chat',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              radius: 25,
              backgroundImage: NetworkImage(imageUrls[1]),
            ),
            title: Text(users[index]),
            subtitle: Text(messages[index]),
            trailing: Text(times[index]),
            onTap: () => context.push("/chatViewScreen"),
          );
        },
      ),
    );
  }
}
