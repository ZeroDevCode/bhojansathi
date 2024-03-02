import 'package:bhojansathi/bloc/donation/donation_bloc.dart';
import 'package:bhojansathi/config/routePaths.dart';
import 'package:bhojansathi/generated/assets.dart';
import 'package:bhojansathi/models/DonationModel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

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
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          appBar: AppBar(
            title: const Text('History'),
            bottom: const TabBar(
              tabs: [
                Tab(
                  text: 'All Donation',
                ),
                Tab(
                  text: 'OnTheWay',
                ),
                Tab(
                  text: 'Delivered',
                ),
              ],
            ),
          ),
          body: BlocBuilder<FoodDonationBloc, FoodDonationState>(
            builder: (context, state) {
              if (state is DonationLoadingState) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is DonationLoadedState) {
                List<FoodDonationModel> donation = state.foodDonationList
                    .where((element) =>
                        element.foodDonorUID ==
                        FirebaseAuth.instance.currentUser!.uid)
                    .toList();
                List<FoodDonationModel> donationOnTheWay = state
                    .foodDonationList
                    .where((element) =>
                        element.foodDonorUID ==
                            FirebaseAuth.instance.currentUser!.uid &&
                        element.foodDonationStatus == "OnTheWay")
                    .toList();
                List<FoodDonationModel> donationDelivered = state
                    .foodDonationList
                    .where((element) =>
                        element.foodDonorUID ==
                            FirebaseAuth.instance.currentUser!.uid &&
                        element.foodDonationStatus == "Delivered")
                    .toList();
                return TabBarView(
                  children: [
                    ListView.builder(
                      itemCount: donation.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 10),
                          decoration: BoxDecoration(
                            //show shadoewd container
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.shade200.withOpacity(1),
                                spreadRadius: 1,
                                blurRadius: 7,
                              ),
                            ],
                          ),
                          child: ListTile(
                            leading: Container(
                              width: 50,
                              height: 50,
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: (donation[index].foodImage.isNotEmpty)
                                    ? DecorationImage(
                                        image: NetworkImage(
                                            donation[index].foodImage[0]),
                                        fit: BoxFit.cover,
                                      )
                                    : const DecorationImage(
                                        image: AssetImage(Assets.assetsLogo)),
                              ),
                            ),
                            title: Text(donation[index].foodName),
                            subtitle: Text(
                              donation[index].foodDescription,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              semanticsLabel: '.........',
                              textAlign: TextAlign.justify,
                              style: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 11,
                                  height: 0.9),
                            ),
                            trailing: PopupMenuButton(
                              color: Colors.white,
                              surfaceTintColor: Colors.white,
                              itemBuilder: (context) => [
                                PopupMenuItem(
                                  child: SizedBox(
                                      width: 100, child: Text('View Details')),
                                  onTap: () {
                                    context.push(
                                      RoutePaths.donationDetailScreen
                                          .replaceAll(':id',
                                              donation[index].foodDonationID),
                                    );
                                  },
                                ),
                                PopupMenuItem(
                                  child: Text('Edit'),
                                  onTap: () {
                                    context.push(
                                      '${RoutePaths.editDonationScreen}/${donation[index].foodDonationID}',
                                    );
                                  },
                                ),
                                PopupMenuItem(
                                  child: Text('Delete'),
                                  onTap: () async {
                                    showDialog(
                                        context: context,
                                        builder: (context) {
                                          return AlertDialog(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            title: const Text('Delete'),
                                            content: const Text(
                                                'Are you sure you want to delete this donation?'),
                                            actions: [
                                              TextButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                child: const Text('No'),
                                              ),
                                              TextButton(
                                                onPressed: () async {
                                                  Navigator.pop(context);
                                                  await BlocProvider.of<
                                                      FoodDonationBloc>(context)
                                                    ..add(DeleteFoodDonationEvent(
                                                        foodDonationId: donation[
                                                                index]
                                                            .foodDonationID));
                                                },
                                                child: const Text('Yes'),
                                              ),
                                            ],
                                          );
                                        });
                                  },
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                    ListView.builder(
                      itemCount: donationOnTheWay.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: const EdgeInsets.symmetric(
                              vertical: 3, horizontal: 5),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.grey.shade300),
                          ),
                          child: ListTile(
                            leading:
                                (donationOnTheWay[index].foodImage.isNotEmpty)
                                    ? Image.network(
                                        donationOnTheWay[index].foodImage[0])
                                    : Image.asset(Assets.assetsLogo),
                            title: Text(donationOnTheWay[index].foodName),
                            subtitle: Text(
                              donationOnTheWay[index].foodDescription,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              semanticsLabel: '.........',
                              textAlign: TextAlign.justify,
                              style: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 11,
                                  height: 0.9),
                            ),
                            trailing: PopupMenuButton(
                              color: Colors.white,
                              surfaceTintColor: Colors.white,
                              itemBuilder: (context) => [
                                PopupMenuItem(
                                  child: SizedBox(
                                      width: 100, child: Text('View Details')),
                                  onTap: () {
                                    context.push(
                                      RoutePaths.donationDetailScreen
                                          .replaceAll(':id',
                                              donation[index].foodDonationID),
                                    );
                                  },
                                ),
                                PopupMenuItem(
                                  child: Text('Edit'),
                                  onTap: () {
                                    context.push(
                                      '${RoutePaths.editDonationScreen}/${donation[index].foodDonationID}',
                                    );
                                  },
                                ),
                                PopupMenuItem(
                                  child: Text('Delete'),
                                  onTap: () async {
                                    showDialog(
                                        context: context,
                                        builder: (context) {
                                          return AlertDialog(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            title: const Text('Delete'),
                                            content: const Text(
                                                'Are you sure you want to delete this donation?'),
                                            actions: [
                                              TextButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                child: const Text('No'),
                                              ),
                                              TextButton(
                                                onPressed: () async {
                                                  Navigator.pop(context);
                                                  await BlocProvider.of<
                                                      FoodDonationBloc>(context)
                                                    ..add(DeleteFoodDonationEvent(
                                                        foodDonationId: donation[
                                                                index]
                                                            .foodDonationID));
                                                },
                                                child: const Text('Yes'),
                                              ),
                                            ],
                                          );
                                        });
                                  },
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                    ListView.builder(
                      itemCount: donationDelivered.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: const EdgeInsets.symmetric(
                              vertical: 3, horizontal: 5),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.grey.shade300),
                          ),
                          child: ListTile(
                            leading:
                                (donationDelivered[index].foodImage.isNotEmpty)
                                    ? Image.network(
                                        donationDelivered[index].foodImage[0])
                                    : Image.asset(Assets.assetsLogo),
                            title: Text(donationDelivered[index].foodName),
                            subtitle: Text(
                              donation[index].foodDescription,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              semanticsLabel: '.........',
                              textAlign: TextAlign.justify,
                              style: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 11,
                                  height: 0.9),
                            ),
                            trailing: PopupMenuButton(
                              color: Colors.white,
                              surfaceTintColor: Colors.white,
                              itemBuilder: (context) => [
                                PopupMenuItem(
                                  child: SizedBox(
                                      width: 100, child: Text('View Details')),
                                  onTap: () {
                                    context.push(
                                      RoutePaths.donationDetailScreen
                                          .replaceAll(':id',
                                              donation[index].foodDonationID),
                                    );
                                  },
                                ),
                                PopupMenuItem(
                                  child: Text('Edit'),
                                  onTap: () {
                                    context.push(
                                      '${RoutePaths.editDonationScreen}/${donation[index].foodDonationID}',
                                    );
                                  },
                                ),
                                PopupMenuItem(
                                  child: Text('Delete'),
                                  onTap: () async {
                                    showDialog(
                                        context: context,
                                        builder: (context) {
                                          return AlertDialog(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            title: const Text('Delete'),
                                            content: const Text(
                                                'Are you sure you want to delete this donation?'),
                                            actions: [
                                              TextButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                child: const Text('No'),
                                              ),
                                              TextButton(
                                                onPressed: () async {
                                                  Navigator.pop(context);
                                                  await BlocProvider.of<
                                                      FoodDonationBloc>(context)
                                                    ..add(DeleteFoodDonationEvent(
                                                        foodDonationId: donation[
                                                                index]
                                                            .foodDonationID));
                                                },
                                                child: const Text('Yes'),
                                              ),
                                            ],
                                          );
                                        });
                                  },
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                );
              } else if (state is DonationOperationSucessState) {
                context.read<FoodDonationBloc>().add(LoadFoodDonationEvent());
                return const Center(
                  child: Text('Operation Success'),
                );
              } else if (state is DonationErrorState) {
                return Center(
                  child: Text(state.message),
                );
              } else {
                return const Center(
                  child: Text('No Donations'),
                );
              }
            },
          )),
    );
  }
}
