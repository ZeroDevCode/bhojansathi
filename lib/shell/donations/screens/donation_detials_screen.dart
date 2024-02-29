import 'package:bhojansathi/bloc/donation/donation_bloc.dart';
import 'package:bhojansathi/bloc/user/register/user_register_bloc.dart';
import 'package:bhojansathi/config/routePaths.dart';
import 'package:bhojansathi/generated/assets.dart';
import 'package:bhojansathi/models/DonationModel.dart';
import 'package:bhojansathi/utils/style.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  body: Text(widget.donationId! ?? "no id passed"),
                );
              }
            },
          ),
        ),
      ),
    );
  }

  Widget _buildDonationDetails(FoodDonationModel foodDonationModel) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      physics: const BouncingScrollPhysics(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            clipBehavior: Clip.antiAlias,
            decoration: MyStyle.containerDecoration,
            child: (foodDonationModel.foodImage.length < 0)
                ? Image.network(
                    foodDonationModel.foodImage[0]!,
                    fit: BoxFit.cover,
                    height: 200,
                    width: double.infinity,
                  )
                : Image.asset(
                    Assets.imagesDonateFood,
                    fit: BoxFit.cover,
                    height: 200,
                    width: double.infinity,
                  ),
          ),
          const SizedBox(height: 10),
          const Text(
            "Food Name",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const Divider(),
          Text(
            foodDonationModel.foodName,
            style: const TextStyle(fontSize: 14),
          ),
          const SizedBox(height: 10),
          const Text(
            "Description",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const Divider(),
          Text(
            foodDonationModel.foodDescription,
            style: const TextStyle(fontSize: 14),
            textAlign: TextAlign.justify,
          ),
          const SizedBox(height: 10),
          const Text(
            "Quantity",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const Divider(),
          Text(
            "${foodDonationModel.foodQuantity} ${foodDonationModel.foodQuantity == "Raw" ? "kg" : "Meals"}",
            style: const TextStyle(fontSize: 14),
          ),
          const SizedBox(height: 10),
          const Text(
            "Pickup Address",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const Divider(),
          Text(
            foodDonationModel.foodDonorAddress,
            style: const TextStyle(fontSize: 14),
          ),
          const SizedBox(height: 10),
          const Text(
            "Pickup Time",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const Divider(),
          Text(
            "Before ${foodDonationModel.foodExpiryDate}",
            style: const TextStyle(fontSize: 14),
          ),
          const SizedBox(height: 10),
          Visibility(
            visible: foodDonationModel.foodDonorName.isNotEmpty,
            child: Column(
              children: [
                const Text(
                  "Donor Name",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(
                  foodDonationModel.foodDonorName,
                  style: const TextStyle(fontSize: 14),
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
          const Text(
            "Donor Phone",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const Divider(),
          Text(
            foodDonationModel.foodDonorPhone,
            style: const TextStyle(fontSize: 14),
          ),
          const SizedBox(height: 10),
          Visibility(
            visible: foodDonationModel.foodDonorEmail.isNotEmpty,
            child: Column(
              children: [
                const Text(
                  "Donor Email",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const Divider(),
                Text(
                  foodDonationModel.foodDonorEmail,
                  style: const TextStyle(fontSize: 14),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            "Pickup Address",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const Divider(),
          Text(
            foodDonationModel.foodDonorAddress,
            style: const TextStyle(fontSize: 14),
          ),
          const SizedBox(height: 10),
          Column(
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
              //if status is onTheWay show cancel and chat button in row and below that show delivered button
              if(foodDonationModel.foodDonationStatus == "Pending")
                _buildDonationPendingButton(foodDonationModel),
              if (foodDonationModel.foodDonationStatus == "OnTheWay")
                _buildOnTheWayButton(foodDonationModel),
              if (foodDonationModel.foodDonationStatus == "Delivered")
                const Text(
                  "Food Delivered",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildDonationPendingButton(FoodDonationModel foodDonationModel) {
    print("Pending Button");
    return InkWell(
      onTap: () async {
        //cancel the donation
        await FirebaseFirestore.instance
            .collection("food_donation")
            .doc(foodDonationModel.foodDonationID)
            .update({
          "foodDonationStatus": "OnTheWay",
          "foodRecipientId": "123",
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
          "Accept Donation",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
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
      ],
    );
  }
}
