import 'package:bhojansathi/bloc/donation/donation_bloc.dart';
import 'package:bhojansathi/config/routePaths.dart';
import 'package:bhojansathi/models/ChatListModel.dart';
import 'package:bhojansathi/models/DonationModel.dart';
import 'package:bhojansathi/repositories/chat_repository.dart';
import 'package:bhojansathi/utils/style.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class DonationDetails extends StatefulWidget {
  final String? donationId;

  const DonationDetails({super.key, required this.donationId});

  @override
  State<DonationDetails> createState() => _DonationDetailsState();
}

class _DonationDetailsState extends State<DonationDetails> {
  late String userId;

  void getUid() async {
    userId = FirebaseAuth.instance.currentUser!.uid;
  }

  @override
  void initState() {
    getUid();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.96),
      appBar: AppBar(
        title: const Text("Food Details"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: BlocBuilder<FoodDonationBloc, FoodDonationState>(
            builder: (context, state) {
              if (state is DonationLoadingState) {
                return const CircularProgressIndicator();
              } else if (state is DonationErrorState) {
                return Center(
                  child: Text(state.message),
                );
              } else if (state is DonationLoadedState) {
                FoodDonationModel foodDonationModel = state.foodDonationList
                    .where(
                      (element) => element.foodDonationID == widget.donationId,
                    )
                    .first;
                return _buildDonationDetails(foodDonationModel);
              } else {
                return Scaffold(
                  body: Text(widget.donationId!),
                );
              }
            },
          ),
        ),
      ),
    );
  }

  Widget _buildDonationPendingButton(FoodDonationModel foodDonationModel) {
    return InkWell(
      onTap: () async {
        //cancel the donation
        await FirebaseFirestore.instance
            .collection("food_donation")
            .doc(foodDonationModel.foodDonationID)
            .update({
          "foodDonationStatus": "OnTheWay",
          "foodRecipientId": userId,
        });
      },
      child: Container(
        height: 50,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.circular(10),
        ),
        child: const Text(
          "Receive Donation",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget _buildDonationDetails(FoodDonationModel foodDonationModel) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      physics: const ClampingScrollPhysics(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (foodDonationModel.foodImage.isNotEmpty)
            Container(
              decoration: MyStyle.containerDecoration,
              child: Column(
                children: [
                  SizedBox(
                    height: 200,
                    child: PageView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: foodDonationModel.foodImage.length,
                      itemBuilder: (context, index) => InkWell(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: const Text("Image Preview"),
                                content: Image.network(
                                  foodDonationModel.foodImage[index],
                                ),
                              );
                            },
                          );
                        },
                        child: Container(
                          margin: const EdgeInsets.all(10),
                          clipBehavior: Clip.antiAlias,
                          decoration: MyStyle.containerDecoration,
                          child: Image.network(
                            foodDonationModel.foodImage[index],
                            fit: BoxFit.cover,
                            height: 200,
                            width: double.infinity,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          const SizedBox(height: 10),
          myColumn(title: "Food Name", value: foodDonationModel.foodName),
          myColumn(
              title: "Description", value: foodDonationModel.foodDescription),
          myColumn(
              title: "Quantity",
              value:
                  "${foodDonationModel.foodQuantity} ${foodDonationModel.foodQuantity == "Raw" ? "kg" : "Meals"}"),
          myColumn(
              title: "Pickup Address",
              value: foodDonationModel.foodDonorAddress),
          myColumn(
              title: "Pickup Time",
              value: "Before ${foodDonationModel.foodExpiryDate}"),
          Visibility(
            visible: foodDonationModel.foodDonorName.isNotEmpty,
            child: myColumn(
                title: "Donor Name", value: foodDonationModel.foodDonorName),
          ),
          myColumn(
              title: "Donor Phone", value: foodDonationModel.foodDonorPhone),
          Visibility(
            visible: foodDonationModel.foodDonorEmail.isNotEmpty,
            child: myColumn(
                title: "Donor Email", value: foodDonationModel.foodDonorEmail),
          ),
          Container(
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(10),
            decoration: MyStyle.containerDecoration,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Food Donation Status ( ${foodDonationModel.foodDonationStatus} )",
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Divider(),
                (foodDonationModel.foodDonationStatus == "Delivered")
                    ? const Text("Donation is Already Done")
                    : (foodDonationModel.foodDonorUID == userId)
                        ? _completeDonationButton(foodDonationModel)
                        : (foodDonationModel.foodDonationStatus == "Pending")
                            ? _buildDonationPendingButton(foodDonationModel)
                            : _buildOnTheWayButton(foodDonationModel),
                const SizedBox(height: 10),
                (foodDonationModel.foodDonationStatus == "OnTheWay" &&
                        foodDonationModel.foodDonorUID == userId)
                    ? _buildOnTheWayButton(foodDonationModel)
                    : const SizedBox(),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget myColumn({required String title, required String value}) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(10),
      decoration: MyStyle.containerDecoration,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const Divider(),
          Text(
            value,
            style: const TextStyle(fontSize: 14),
          ),
        ],
      ),
    );
  }

  Widget _buildOnTheWayButton(FoodDonationModel foodDonationModel) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
          child: InkWell(
            onTap: () async {
              //cancel the donation
              await FirebaseFirestore.instance
                  .collection("food_donation")
                  .doc(foodDonationModel.foodDonationID)
                  .update({
                "foodDonationStatus": "Pending",
              });
            },
            child: Container(
              height: 50,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Text(
                "Cancel",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        const VerticalDivider(),
        //chat button
        Expanded(
          child: InkWell(
            onTap: () async {
              final isExist = await ChatRepository()
                  .isChatListExist(userId, foodDonationModel.foodDonorUID);
              if (!isExist) {
                ChatRepository().addChatList(
                  ChatListModel(
                    message: "Hello",
                    name: "Donor Name",
                    avatarUrl: "",
                    receiverId: foodDonationModel.foodDonorUID,
                    senderId: userId,
                  ),
                );
                ChatRepository().addChatList(
                  ChatListModel(
                    message: "Hello",
                    name: "Bhavy",
                    avatarUrl: "",
                    senderId: foodDonationModel.foodDonorUID,
                    receiverId: userId,
                  ),
                );
              }
              context.push(
                RoutePaths.chatDetailScreen
                    .replaceAll(":id", foodDonationModel.foodDonorUID),
              );
            },
            child: Container(
              height: 50,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Text(
                "Chat",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _completeDonationButton(FoodDonationModel foodDonationModel) {
    return InkWell(
      onTap: () async {
        //cancel the donation
        await FirebaseFirestore.instance
            .collection("food_donation")
            .doc(foodDonationModel.foodDonationID)
            .update({
          "foodDonationStatus": "Delivered",
        });
      },
      child: Container(
        height: 50,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.deepOrange,
          borderRadius: BorderRadius.circular(10),
        ),
        child: const Text(
          "Mark as Complete Donation",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
