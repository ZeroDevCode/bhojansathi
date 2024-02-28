import 'package:bhojansathi/common/app_bar.dart';
import 'package:bhojansathi/utils/style.dart';
import 'package:flutter/material.dart';

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
                height: 365,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Container(
                      width: 260,
                      margin: const EdgeInsets.symmetric(
                          vertical: 0, horizontal: 5,),
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
                                    'assets/images/ngo.png'), // Replace with actual image path
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
  return SizedBox(
    height: 345,
    child: ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemCount: 5,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        return Container(
          width: 260,
          margin: const EdgeInsets.symmetric(
              vertical: 0, horizontal: 5),
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
                        'assets/images/ngo.png'), // Replace with actual image path
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
              const Text(
                'The more contributions fundraisers bring in, the bigger the impact. And today, it’s easier than ever to donate to a charity.',
                textAlign: TextAlign.justify,
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
