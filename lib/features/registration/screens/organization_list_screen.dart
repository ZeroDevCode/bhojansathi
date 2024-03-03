import 'package:bhojansathi/config/routePaths.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class OrganizationListScreen extends StatefulWidget {
  const OrganizationListScreen({Key? key}) : super(key: key);

  @override
  State<OrganizationListScreen> createState() => _OrganizationListScreenState();
}

class _OrganizationListScreenState extends State<OrganizationListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Organization List'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.push(RoutePaths.organizationCreateScreen);
        },
        backgroundColor: Colors.deepOrange,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: const Column(
        children: <Widget>[
          ListTile(
            title: Text('Organization 1'),
            subtitle: Text('Description'),
            leading: CircleAvatar(
              backgroundColor: Colors.deepOrange,
              child: Icon(
                Icons.account_balance,
                color: Colors.white,
              ),
            ),
          ),
          Divider(),
          ListTile(
            title: Text('Organization 2'),
            subtitle: Text('Description'),
            leading: CircleAvatar(
              backgroundColor: Colors.deepOrange,
              child: Icon(
                Icons.account_balance,
                color: Colors.white,
              ),
            ),
          ),
          Divider(),
          ListTile(
            title: Text('Organization 3'),
            subtitle: Text('Description'),
            leading: CircleAvatar(
              backgroundColor: Colors.deepOrange,
              child: Icon(
                Icons.account_balance,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
