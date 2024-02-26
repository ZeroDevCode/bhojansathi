import 'package:bhojansathi/bloc/donation/donation_bloc.dart';
import 'package:bhojansathi/generated/assets.dart';
import 'package:bhojansathi/models/DonationModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  @override
  void initState() {
    BlocProvider.of<FoodDonationBloc>(context).add(LoadFoodDonationEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final FoodDonationBloc _foodDonationBlock =
        BlocProvider.of<FoodDonationBloc>(context);
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
              child: BlocBuilder<FoodDonationBloc, FoodDonationState>(
                builder: (context, state) {
                  if (state is DonationLoadingState) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is DonationLoadedState) {
                    final donation = state.foodDonationList;
                    return ListView.builder(
                      itemCount: donation.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: const CircleAvatar(
                            radius: 25,
                            backgroundImage: AssetImage(Assets.assetsLogo),
                          ),
                          title: Text(donation[index].foodName),
                          subtitle: Text(donation[index].foodDescription),
                          trailing: (donation[index].foodImage.isNotEmpty)
                              ? Image.network(donation[index].foodImage[0])
                              : Image.asset(Assets.assetsLogo),
                        );
                      },
                    );
                  } else {
                    return const Text("Unknown State");
                  }
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
