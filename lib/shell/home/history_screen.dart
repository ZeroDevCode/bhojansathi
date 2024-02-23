import 'package:flutter/material.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('History'),
          bottom: const TabBar(
            tabs: [
              Tab(
                text: 'Donations',
              ),
              Tab(
                text: 'Requests',
              ),
              Tab(
                text: 'Live',
              )
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Center(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return const ListTile(
                    title: Text('Donation'),
                    subtitle: Text('Donation'),
                    trailing: Icon(Icons.arrow_forward_ios),
                  );
                },
              ),
            ),
            const Center(
              child: Text('Requests'),
            ),
            const Center(
              child: Text('Live'),
            ),
          ],
        ),
      ),
    );
  }
}
