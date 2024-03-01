import 'package:bhojansathi/bloc/donation/donation_bloc.dart';
import 'package:bhojansathi/common/app_bar.dart';
import 'package:bhojansathi/config/routePaths.dart';
import 'package:bhojansathi/models/DonationModel.dart';
import 'package:bhojansathi/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    BlocProvider.of<FoodDonationBloc>(context).add(LoadFoodDonationEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white38,
      appBar: const CustomAppBar(),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Text(
                    "   Hunger spots near you",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Expanded(child: SizedBox()),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'See All',
                      style: TextStyle(
                        color: Colors.deepOrange,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 350,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Container(
                      width: 260,
                      margin: const EdgeInsets.symmetric(
                        vertical: 0,
                        horizontal: 5,
                      ),
                      decoration: MyStyle.containerDecoration,
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const CircleAvatar(
                                radius: 20.0,
                                backgroundImage: AssetImage(
                                  'assets/images/ngo.png',
                                ), // Replace with actual image path
                              ),
                              const SizedBox(width: 10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Karan Chaudhuri',
                                    style: MyStyle.textHeadingStyle,
                                  ),
                                  Text(
                                    'Rajkot, Gujarat',
                                    style: MyStyle.textSubHeadingStyle,
                                  ),
                                ],
                              )
                            ],
                          ),
                          const SizedBox(height: 10),
                          Container(
                            height: 130,
                            width: 260,
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: const BorderRadius.all(
                                Radius.circular(10),
                              ),
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: Image.network(
                                        "https://via.placeholder.com/100")
                                    .image,
                              ),
                            ),
                            child: Image.network(
                              'https://via.placeholder.com/100',
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            'The more contributions fundraisers bring in, the bigger the impact.'
                            ' And today, it’s easier than ever to donate to a charity.',
                            textAlign: TextAlign.justify,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            style: MyStyle.textSubHeadingStyle,
                          ),
                          Wrap(
                            crossAxisAlignment: WrapCrossAlignment.start,
                            verticalDirection: VerticalDirection.down,
                            spacing: 10,
                            alignment: WrapAlignment.start,
                            children: [
                              _buildChip(
                                  'Exp - 1 Hour', Icons.access_time_outlined),
                              _buildChip('2Kms', Icons.location_on_outlined),
                            ],
                          ),
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              minimumSize: const Size(double.infinity, 40),
                              backgroundColor: Colors.deepOrange,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: const Text(
                              'Donate Now',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 5),
              Row(
                children: [
                  Text(
                    "  Donations",
                    style: MyStyle.textHeadingStyle.copyWith(
                      fontSize: 16,
                    ),
                  ),
                  const Expanded(child: SizedBox()),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'See All',
                      style: TextStyle(
                        color: Colors.deepOrange,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              ),
              _buildDonationList(context),
              const SizedBox(height: 10),
              Text(
                '  Top NGO\'s',
                style: MyStyle.textHeadingStyle.copyWith(fontSize: 16),
              ),
              SizedBox(
                height: 10,
              ),
              const SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    NGOCircle(imageUrl: 'assets/images/ngo.png'),
                    NGOCircle(imageUrl: 'assets/images/ngo2.jpg'),
                    NGOCircle(imageUrl: 'assets/images/ngo3.jpg'),
                    NGOCircle(imageUrl: 'assets/images/ngo4.jpg'),
                    NGOCircle(imageUrl: 'assets/images/ngo.png'),
                    NGOCircle(imageUrl: 'assets/images/ngo3.jpg'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildDonationList(BuildContext context) {
  return BlocBuilder<FoodDonationBloc, FoodDonationState>(
    builder: (context, state) {
      if (state is DonationLoadingState) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      } else if (state is DonationLoadedState) {
        List<FoodDonationModel> donation = state.foodDonationList.where((donationEvent) => donationEvent.foodDonationStatus == "Pending").toList();
        return SizedBox(
          height: 310,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: donation.length,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return Container(
                width: 260,
                margin: const EdgeInsets.symmetric(vertical: 0, horizontal: 5),
                decoration: MyStyle.containerDecoration,
                padding: const EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const CircleAvatar(
                          radius: 20.0,
                          backgroundImage: AssetImage(
                            'assets/images/ngo.png',
                          ), // Replace with actual image path
                        ),
                        const SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Karan Chaudhary',
                              style: MyStyle.textHeadingStyle,
                            ),
                            Text(
                              'Rajkot, Gujarat',
                              style: MyStyle.textSubHeadingStyle,
                            ),
                          ],
                        )
                      ],
                    ),
                    const SizedBox(height: 10),
                    Container(
                      height: 130,
                      width: 260,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(10),
                        ),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: Image.network(
                                  (donation[index].foodImage.length > 0
                                      ? "${donation[index].foodImage[0]}"
                                      : "https://via.placeholder.com/150"))
                              .image,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Expanded(
                      child: Text(
                        donation[index].foodDescription,
                        style: MyStyle.textSubHeadingStyle,
                        textAlign: TextAlign.justify,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        context.push(RoutePaths.donationDetailScreen
                            .replaceAll(':id', donation[index].foodDonationID));
                      },
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(double.infinity, 40),
                        backgroundColor: Colors.deepOrange,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text(
                        'Accept Donation',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
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
  );
}

Widget _buildChip(String label, IconData icon) {
  return Chip(
    label: Text(
      label,
      style: const TextStyle(
        fontSize: 11,
        color: Color.fromARGB(255, 254, 114, 76),
      ),
    ),
    clipBehavior: Clip.none,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(8),
      ),
      side: BorderSide(
        color: Color.fromARGB(94, 221, 221, 221),
      ),
    ),
    backgroundColor: const Color.fromARGB(94, 221, 221, 221),
    visualDensity: VisualDensity.compact,
    padding: const EdgeInsets.all(1),
    avatar: Icon(
      icon,
      size: 16,
      color: const Color.fromARGB(255, 254, 114, 76),
    ),
  );
}

class NGOCircle extends StatelessWidget {
  final String imageUrl;

  const NGOCircle({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: 90,
            height: 90,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Color(0xFF9B2282),
                  Color(0xFFEEA863),
                ],
              ),
            ),
          ),
          CircleAvatar(
            backgroundImage: AssetImage(imageUrl),
            radius: 40.0,
          ),
        ],
      ),
    );
  }
}
