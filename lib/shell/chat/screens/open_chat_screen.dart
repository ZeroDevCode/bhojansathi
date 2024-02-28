import 'package:flutter/material.dart';

class ChatViewScreen extends StatelessWidget {
  const ChatViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Jyoti Rand'),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.phone_outlined)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.info_outline))
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 5.0),
                child: ListView.builder(
                  reverse: true,
                  itemCount: 20,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return UnconstrainedBox(
                      alignment: index % 2 == 0
                          ? Alignment.topLeft
                          : Alignment.topRight,
                      child: Container(
                        constraints: BoxConstraints(maxWidth: 250),
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(8),
                          ),
                          border: Border.all(
                            color: Colors.grey.withOpacity(0.2),
                          ),
                        ),
                        margin: const EdgeInsets.all(8),
                        padding: const EdgeInsets.all(8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Karan",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Divider(
                              height: 5,
                            ),
                            Text(
                              "This the message from karan lodu bhagat to make this bhojan sathi",
                              style: TextStyle(fontSize: 12),
                            ),
                            Container(
                              alignment: Alignment.bottomRight,
                              child: Text(
                                "10:10 PM",
                                style: TextStyle(fontSize: 10),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            Container(
              color: Colors.grey[300],
              padding: const EdgeInsets.symmetric(vertical: 3.0),
              child: Row(
                children: [
                  const SizedBox(width: 8.0),
                  Container(
                    height: 35.0,
                    width: 35.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: const DecorationImage(
                        image: NetworkImage(
                          'https://images.unsplash.com/photo-1448932223592-d1fc686e76ea?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTB8fG9ubGluZXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60',
                        ),
                      ),
                      border: Border.all(
                        color: const Color(0xff025f7f),
                        width: 2.0,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8.0),
                  Expanded(
                    child: SizedBox(
                      height: 35.0,
                      child: TextField(
                        style: const TextStyle(fontSize: 14.0),
                        decoration: InputDecoration(
                          hintText: 'Type a message...',
                          hintStyle: const TextStyle(fontSize: 14.0),
                          suffixIcon: IconButton(
                            icon:
                                const Icon(Icons.mic, color: Color(0xff025f7f)),
                            onPressed: () => print('Mic Pressed'),
                          ),
                          contentPadding:
                              const EdgeInsets.fromLTRB(12.0, 8.0, 8.0, 12.0),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25.0),
                            borderSide: const BorderSide(
                              color: Color(0xff025f7f),
                              width: 2.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 5.0),
                  InkWell(
                    child: const Icon(
                      Icons.add,
                      color: Color(0xff025f7f),
                    ),
                    onTap: () async => await showBottomSheetOptions(context),
                  ),
                  const SizedBox(width: 5.0),
                  InkWell(
                    child: const Icon(
                      Icons.send,
                      color: Color(0xff025f7f),
                    ),
                    onTap: () {},
                  ),
                  const SizedBox(width: 5.0),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Future<void> showBottomSheetOptions(BuildContext context) {
  return showModalBottomSheet(
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(16.0),
        topRight: Radius.circular(16.0),
      ),
    ),
    context: context,
    builder: (BuildContext context) {
      return Padding(
        padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                MaterialButton(
                  onPressed: () => print("Will updated later."),
                  color: const Color(0xff025f7f),
                  textColor: Colors.white,
                  padding: const EdgeInsets.all(16),
                  shape: const CircleBorder(),
                  child: const Icon(
                    Icons.camera_alt,
                    size: 24,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 5.0),
                  child: Text(
                    "Camera",
                    style: TextStyle(fontSize: 12.0),
                  ),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                MaterialButton(
                  onPressed: () => print("Will updated later."),
                  color: const Color(0xff025f7f),
                  textColor: Colors.white,
                  padding: const EdgeInsets.all(16),
                  shape: const CircleBorder(),
                  child: const Icon(
                    Icons.photo,
                    size: 24,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 5.0),
                  child: Text(
                    "Gallery",
                    style: TextStyle(fontSize: 12.0),
                  ),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                MaterialButton(
                  onPressed: () => print("Will updated later."),
                  color: const Color(0xff025f7f),
                  textColor: Colors.white,
                  padding: const EdgeInsets.all(16),
                  shape: const CircleBorder(),
                  child: const Icon(
                    Icons.assignment_rounded,
                    size: 24,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 5.0),
                  child: Text(
                    "Document",
                    style: TextStyle(fontSize: 12.0),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    },
  );
}
