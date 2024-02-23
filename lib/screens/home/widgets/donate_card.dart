import 'package:flutter/material.dart';

class DonationCards extends StatefulWidget {
  const DonationCards({super.key});

  @override
  State<DonationCards> createState() => _DonationCardsState();
}

class _DonationCardsState extends State<DonationCards> {
  @override
  Widget build(BuildContext context) {
    return Column(
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
        const SizedBox(height: 10),
        ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 5,
          itemBuilder: (context, index) {
            return Container(
              width: 275,
              margin: const EdgeInsets.symmetric(vertical: 10),
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
                      _buildChip('Exp - 1 Hour', Icons.access_time_outlined),
                      _buildChip('2Kms', Icons.location_on_outlined),
                      _buildChip('30', Icons.local_dining_outlined),
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
                        fontSize: 20,
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
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
