import 'package:bhojansathi/generated/assets.dart';
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
            indicatorColor: Colors.deepOrange,
            labelColor: Colors.deepOrange,
            unselectedLabelColor: Colors.black,
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
                    leading:CircleAvatar(
                      radius: 25,
                      backgroundImage: AssetImage(Assets.assetsLogo),

                    ),
                    title: Text('Donation'),
                    subtitle: Text('Donation'),
                    trailing: Icon(Icons.info_outline),
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
