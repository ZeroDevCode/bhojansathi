import 'package:bhojansathi/common/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
                      "Hunger spots near you",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Expanded(child: SizedBox()),
                    TextButton(
                      onPressed: () {
                        // Handle See All button tap
                      },
                      child: const Text(
                        'See All',
                        style: TextStyle(
                          color: Colors.deepOrange,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 470,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Container(
                        width: 275,
                        height: 300,
                        margin: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: const BorderRadius.all(
                            Radius.circular(10),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.1),
                              blurRadius: 5.0,
                              spreadRadius: 2.0,
                              offset: const Offset(0.0, 1.0),
                            ),
                          ],
                        ),
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Row(
                              children: [
                                CircleAvatar(
                                  radius: 20.0,
                                  backgroundImage: AssetImage(
                                      'assets/images/ngo.png'), // Replace with actual image path
                                ),
                                SizedBox(width: 10),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Karan Chaudhary',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16.0,
                                      ),
                                    ),
                                    Text(
                                      'Rajkot, Gujarat',
                                      style: TextStyle(
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            const SizedBox(height: 10),
                            Container(
                              clipBehavior: Clip.antiAlias,
                              height: 150,
                              width: double.infinity,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                              ),
                              child: Image.asset(
                                'assets/images/donate_food.jpg',
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(height: 10),
                            const Text(
                              'The more contributions fundraisers bring in, the bigger the impact. And today, it’s easier than ever to donate to a charity.',
                              textAlign: TextAlign.justify,
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
                                _buildChip('30', Icons.local_dining_outlined),
                              ],
                            ),
                            ElevatedButton(
                              onPressed: () =>
                                  context.go("/detailDonationScreen"),
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
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 20),
                const Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 20.0,
                      backgroundImage: AssetImage('assets/images/ngo.png'),
                    ),
                    SizedBox(width: 10.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Karan Chaudhary',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16.0,
                          ),
                        ),
                        // Text(
                        //   'Rajkot, Gujarat',
                        //   style: TextStyle(
                        //     color: Colors.grey,
                        //   ),
                        // ),
                      ],
                    ),
                    Spacer(),
                    Icon(Icons.more_horiz),
                  ],
                ),
                const SizedBox(height: 10),
                Image.asset(
                  'assets/images/donate.jpg', // Replace with actual image path
                  height: 300.0,
                  fit: BoxFit.cover,
                ),
                const SizedBox(height: 20),
                const Text(
                  'Top NGO\'s',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
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
        ));
  }
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
