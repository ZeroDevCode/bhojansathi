import 'package:bhojansathi/common/app_bar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 255, 239, 233),
        appBar: const CustomAppBar(),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Hunger spots near you",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
                ),
                const SizedBox(height: 10),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Container(
                        width: 275,
                        height: 420,
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        child: Stack(
                          children: [
                            Positioned(
                              top: 10,
                              left: 10,
                              child: Container(
                                width: 55,
                                height: 55,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    image: AssetImage('assets/images/ngo2.jpg'),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            const Positioned(
                                top: 15,
                                left: 75,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Jyoti Day Care',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      'Rajkot, Gujarat',
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                  ],
                                )),
                            Positioned(
                              top: 80,
                              left: 13,
                              child: Container(
                                clipBehavior: Clip.antiAlias,
                                width: 247,
                                height: 150,
                                decoration: const BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                child: Image.asset(
                                  'assets/images/donate_food.jpg',
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            const Positioned(
                                left: 13,
                                top: 240,
                                right: 10,
                                child: Text(
                                  'The more contributions fundraisers bring in, the bigger the impact. And today, it’s easier than ever to donate to a charity.',
                                  textAlign: TextAlign.justify,
                                )),
                            Positioned(
                              top: 330,
                              left: 10,
                              right: 10,
                              child: Row(
                                children: [
                                  // First Container
                                  Container(
                                    width: 94,
                                    height: 22,
                                    decoration: const BoxDecoration(
                                        color:
                                            Color.fromARGB(94, 221, 221, 221),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(8))),
                                    child: const Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(Icons.access_time,
                                            size: 16,
                                            color: Color.fromARGB(
                                                255, 254, 114, 76)),
                                        SizedBox(width: 5),
                                        Text('Exp - 1 hour',
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: Color.fromARGB(
                                                    255, 254, 114, 76))),
                                      ],
                                    ),
                                  ),

                                  const SizedBox(width: 10),

                                  // Second Container
                                  Container(
                                    width: 60,
                                    height: 20,
                                    decoration: const BoxDecoration(
                                        color:
                                            Color.fromARGB(94, 221, 221, 221),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(8))),
                                    child: const Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(Icons.location_on,
                                            size: 16, color: Colors.black),
                                        SizedBox(width: 5),
                                        Text('2 km',
                                            style: TextStyle(fontSize: 12)),
                                      ],
                                    ),
                                  ),

                                  const SizedBox(width: 10),

                                  // Third Container
                                  Container(
                                    width: 80,
                                    height: 20,
                                    decoration: const BoxDecoration(
                                        color:
                                            Color.fromARGB(94, 221, 221, 221),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(8))),
                                    child: const Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(Icons.local_dining,
                                            size: 16, color: Colors.black),
                                        SizedBox(width: 5),
                                        Text('30 meals',
                                            style: TextStyle(fontSize: 12)),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Positioned(
                                top: 365,
                                left: 13,
                                child: SizedBox(
                                  width: 250,
                                  height: 40,
                                  child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.deepOrange,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                      ),
                                      onPressed: () {},
                                      child: const Text(
                                        'Donate Now',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 20),
                                      )),
                                ))
                          ],
                        ),
                      ),
                      const SizedBox(width: 8),
                      Container(
                        width: 275,
                        height: 420,
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        child: Stack(
                          children: [
                            Positioned(
                              top: 10,
                              left: 10,
                              child: Container(
                                width: 55,
                                height: 55,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    image: AssetImage('assets/images/ngo3.jpg'),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            const Positioned(
                                top: 15,
                                left: 75,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Jyoti Day Care',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      'Rajkot, Gujarat',
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                  ],
                                )),
                            Positioned(
                              top: 80,
                              left: 13,
                              child: Container(
                                clipBehavior: Clip.antiAlias,
                                width: 247,
                                height: 150,
                                decoration: const BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                child: Image.asset(
                                  'assets/images/donate_food.jpg',
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            const Positioned(
                                left: 13,
                                top: 240,
                                right: 10,
                                child: Text(
                                  'The more contributions fundraisers bring in, the bigger the impact. And today, it’s easier than ever to donate to a charity.',
                                  textAlign: TextAlign.justify,
                                )),
                            Positioned(
                              top: 330,
                              left: 10,
                              right: 10,
                              child: Row(
                                children: [
                                  // First Container
                                  Container(
                                    width: 94,
                                    height: 22,
                                    decoration: const BoxDecoration(
                                        color:
                                            Color.fromARGB(94, 221, 221, 221),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(8))),
                                    child: const Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(Icons.access_time,
                                            size: 16,
                                            color: Color.fromARGB(
                                                255, 254, 114, 76)),
                                        SizedBox(width: 5),
                                        Text('Exp - 1 hour',
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: Color.fromARGB(
                                                    255, 254, 114, 76))),
                                      ],
                                    ),
                                  ),

                                  const SizedBox(width: 10),

                                  // Second Container
                                  Container(
                                    width: 60,
                                    height: 20,
                                    decoration: const BoxDecoration(
                                        color:
                                            Color.fromARGB(94, 221, 221, 221),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(8))),
                                    child: const Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(Icons.location_on,
                                            size: 16, color: Colors.black),
                                        SizedBox(width: 5),
                                        Text('2 km',
                                            style: TextStyle(fontSize: 12)),
                                      ],
                                    ),
                                  ),

                                  const SizedBox(width: 10),

                                  // Third Container
                                  Container(
                                    width: 80,
                                    height: 20,
                                    decoration: const BoxDecoration(
                                        color:
                                            Color.fromARGB(94, 221, 221, 221),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(8))),
                                    child: const Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(Icons.local_dining,
                                            size: 16, color: Colors.black),
                                        SizedBox(width: 5),
                                        Text('30 meals',
                                            style: TextStyle(fontSize: 12)),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Positioned(
                                top: 365,
                                left: 13,
                                child: SizedBox(
                                  width: 250,
                                  height: 40,
                                  child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.deepOrange,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                      ),
                                      onPressed: () {},
                                      child: const Text(
                                        'Donate Now',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 20),
                                      )),
                                ))
                          ],
                        ),
                      ),
                      const SizedBox(width: 8),
                      Container(
                        width: 275,
                        height: 420,
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        child: Stack(
                          children: [
                            Positioned(
                              top: 10,
                              left: 10,
                              child: Container(
                                width: 55,
                                height: 55,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    image: AssetImage('assets/images/ngo4.jpg'),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            const Positioned(
                                top: 15,
                                left: 75,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Jyoti Day Care',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      'Rajkot, Gujarat',
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                  ],
                                )),
                            Positioned(
                              top: 80,
                              left: 13,
                              child: Container(
                                clipBehavior: Clip.antiAlias,
                                width: 247,
                                height: 150,
                                decoration: const BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                child: Image.asset(
                                  'assets/images/donate_food.jpg',
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            const Positioned(
                                left: 13,
                                top: 240,
                                right: 10,
                                child: Text(
                                  'The more contributions fundraisers bring in, the bigger the impact. And today, it’s easier than ever to donate to a charity.',
                                  textAlign: TextAlign.justify,
                                )),
                            Positioned(
                              top: 330,
                              left: 10,
                              right: 10,
                              child: Row(
                                children: [
                                  // First Container
                                  Container(
                                    width: 94,
                                    height: 22,
                                    decoration: const BoxDecoration(
                                        color:
                                            Color.fromARGB(94, 221, 221, 221),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(8))),
                                    child: const Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(Icons.access_time,
                                            size: 16,
                                            color: Color.fromARGB(
                                                255, 254, 114, 76)),
                                        SizedBox(width: 5),
                                        Text('Exp - 1 hour',
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: Color.fromARGB(
                                                    255, 254, 114, 76))),
                                      ],
                                    ),
                                  ),

                                  const SizedBox(width: 10),

                                  // Second Container
                                  Container(
                                    width: 60,
                                    height: 20,
                                    decoration: const BoxDecoration(
                                        color:
                                            Color.fromARGB(94, 221, 221, 221),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(8))),
                                    child: const Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(Icons.location_on,
                                            size: 16, color: Colors.black),
                                        SizedBox(width: 5),
                                        Text('2 km',
                                            style: TextStyle(fontSize: 12)),
                                      ],
                                    ),
                                  ),

                                  const SizedBox(width: 10),

                                  // Third Container
                                  Container(
                                    width: 80,
                                    height: 20,
                                    decoration: const BoxDecoration(
                                        color:
                                            Color.fromARGB(94, 221, 221, 221),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(8))),
                                    child: const Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(Icons.local_dining,
                                            size: 16, color: Colors.black),
                                        SizedBox(width: 5),
                                        Text('30 meals',
                                            style: TextStyle(fontSize: 12)),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Positioned(
                                top: 365,
                                left: 13,
                                child: SizedBox(
                                  width: 250,
                                  height: 40,
                                  child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.deepOrange,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                      ),
                                      onPressed: () {},
                                      child: const Text(
                                        'Donate Now',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 20),
                                      )),
                                ))
                          ],
                        ),
                      ),
                      const SizedBox(width: 8),
                      Container(
                        width: 275,
                        height: 420,
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        child: Stack(
                          children: [
                            Positioned(
                              top: 10,
                              left: 10,
                              child: Container(
                                width: 55,
                                height: 55,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    image: AssetImage('assets/images/ngo2.jpg'),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            const Positioned(
                                top: 15,
                                left: 75,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Jyoti Day Care',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      'Rajkot, Gujarat',
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                  ],
                                )),
                            Positioned(
                              top: 80,
                              left: 13,
                              child: Container(
                                clipBehavior: Clip.antiAlias,
                                width: 247,
                                height: 150,
                                decoration: const BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                child: Image.asset(
                                  'assets/images/donate_food.jpg',
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            const Positioned(
                                left: 13,
                                top: 240,
                                right: 10,
                                child: Text(
                                  'The more contributions fundraisers bring in, the bigger the impact. And today, it’s easier than ever to donate to a charity.',
                                  textAlign: TextAlign.justify,
                                )),
                            Positioned(
                              top: 330,
                              left: 10,
                              right: 10,
                              child: Row(
                                children: [
                                  // First Container
                                  Container(
                                    width: 94,
                                    height: 22,
                                    decoration: const BoxDecoration(
                                        color:
                                            Color.fromARGB(94, 221, 221, 221),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(8))),
                                    child: const Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(Icons.access_time,
                                            size: 16,
                                            color: Color.fromARGB(
                                                255, 254, 114, 76)),
                                        SizedBox(width: 5),
                                        Text('Exp - 1 hour',
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: Color.fromARGB(
                                                    255, 254, 114, 76))),
                                      ],
                                    ),
                                  ),

                                  const SizedBox(width: 10),

                                  // Second Container
                                  Container(
                                    width: 60,
                                    height: 20,
                                    decoration: const BoxDecoration(
                                        color:
                                            Color.fromARGB(94, 221, 221, 221),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(8))),
                                    child: const Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(Icons.location_on,
                                            size: 16, color: Colors.black),
                                        SizedBox(width: 5),
                                        Text('2 km',
                                            style: TextStyle(fontSize: 12)),
                                      ],
                                    ),
                                  ),

                                  const SizedBox(width: 10),

                                  // Third Container
                                  Container(
                                    width: 80,
                                    height: 20,
                                    decoration: const BoxDecoration(
                                        color:
                                            Color.fromARGB(94, 221, 221, 221),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(8))),
                                    child: const Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(Icons.local_dining,
                                            size: 16, color: Colors.black),
                                        SizedBox(width: 5),
                                        Text('30 meals',
                                            style: TextStyle(fontSize: 12)),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Positioned(
                                top: 365,
                                left: 13,
                                child: SizedBox(
                                  width: 250,
                                  height: 40,
                                  child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.deepOrange,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                      ),
                                      onPressed: () {},
                                      child: const Text(
                                        'Donate Now',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 20),
                                      )),
                                ))
                          ],
                        ),
                      ),
                      const SizedBox(width: 8),
                      Container(
                        width: 275,
                        height: 420,
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        child: Stack(
                          children: [
                            Positioned(
                              top: 10,
                              left: 10,
                              child: Container(
                                width: 55,
                                height: 55,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    image: AssetImage('assets/images/ngo.png'),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            const Positioned(
                                top: 15,
                                left: 75,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Jyoti Day Care',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      'Rajkot, Gujarat',
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                  ],
                                )),
                            Positioned(
                              top: 80,
                              left: 13,
                              child: Container(
                                clipBehavior: Clip.antiAlias,
                                width: 247,
                                height: 150,
                                decoration: const BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                child: Image.asset(
                                  'assets/images/donate_food.jpg',
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            const Positioned(
                                left: 13,
                                top: 240,
                                right: 10,
                                child: Text(
                                  'The more contributions fundraisers bring in, the bigger the impact. And today, it’s easier than ever to donate to a charity.',
                                  textAlign: TextAlign.justify,
                                )),
                            Positioned(
                              top: 330,
                              left: 10,
                              right: 10,
                              child: Row(
                                children: [
                                  // First Container
                                  Container(
                                    width: 94,
                                    height: 22,
                                    decoration: const BoxDecoration(
                                        color:
                                            Color.fromARGB(94, 221, 221, 221),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(8))),
                                    child: const Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(Icons.access_time,
                                            size: 16,
                                            color: Color.fromARGB(
                                                255, 254, 114, 76)),
                                        SizedBox(width: 5),
                                        Text('Exp - 1 hour',
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: Color.fromARGB(
                                                    255, 254, 114, 76))),
                                      ],
                                    ),
                                  ),

                                  const SizedBox(width: 10),

                                  // Second Container
                                  Container(
                                    width: 60,
                                    height: 20,
                                    decoration: const BoxDecoration(
                                        color:
                                            Color.fromARGB(94, 221, 221, 221),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(8))),
                                    child: const Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(Icons.location_on,
                                            size: 16, color: Colors.black),
                                        SizedBox(width: 5),
                                        Text('2 km',
                                            style: TextStyle(fontSize: 12)),
                                      ],
                                    ),
                                  ),

                                  const SizedBox(width: 10),

                                  // Third Container
                                  Container(
                                    width: 80,
                                    height: 20,
                                    decoration: const BoxDecoration(
                                        color:
                                            Color.fromARGB(94, 221, 221, 221),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(8))),
                                    child: const Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(Icons.local_dining,
                                            size: 16, color: Colors.black),
                                        SizedBox(width: 5),
                                        Text('30 meals',
                                            style: TextStyle(fontSize: 12)),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Positioned(
                                top: 365,
                                left: 13,
                                child: SizedBox(
                                  width: 250,
                                  height: 40,
                                  child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.deepOrange,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                      ),
                                      onPressed: () {},
                                      child: const Text(
                                        'Donate Now',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 20),
                                      )),
                                ))
                          ],
                        ),
                      ),
                      const SizedBox(width: 8),
                      Container(
                        width: 275,
                        height: 420,
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        child: Stack(
                          children: [
                            Positioned(
                              top: 10,
                              left: 10,
                              child: Container(
                                width: 55,
                                height: 55,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    image: AssetImage('assets/images/ngo2.jpg'),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            const Positioned(
                                top: 15,
                                left: 75,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Jyoti Day Care',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      'Rajkot, Gujarat',
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                  ],
                                )),
                            Positioned(
                              top: 80,
                              left: 13,
                              child: Container(
                                clipBehavior: Clip.antiAlias,
                                width: 247,
                                height: 150,
                                decoration: const BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                child: Image.asset(
                                  'assets/images/donate_food.jpg',
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            const Positioned(
                                left: 13,
                                top: 240,
                                right: 10,
                                child: Text(
                                  'The more contributions fundraisers bring in, the bigger the impact. And today, it’s easier than ever to donate to a charity.',
                                  textAlign: TextAlign.justify,
                                )),
                            Positioned(
                              top: 330,
                              left: 10,
                              right: 10,
                              child: Row(
                                children: [
                                  // First Container
                                  Container(
                                    width: 94,
                                    height: 22,
                                    decoration: const BoxDecoration(
                                        color:
                                            Color.fromARGB(94, 221, 221, 221),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(8))),
                                    child: const Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(Icons.access_time,
                                            size: 16,
                                            color: Color.fromARGB(
                                                255, 254, 114, 76)),
                                        SizedBox(width: 5),
                                        Text('Exp - 1 hour',
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: Color.fromARGB(
                                                    255, 254, 114, 76))),
                                      ],
                                    ),
                                  ),

                                  const SizedBox(width: 10),

                                  // Second Container
                                  Container(
                                    width: 60,
                                    height: 20,
                                    decoration: const BoxDecoration(
                                        color:
                                            Color.fromARGB(94, 221, 221, 221),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(8))),
                                    child: const Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(Icons.location_on,
                                            size: 16, color: Colors.black),
                                        SizedBox(width: 5),
                                        Text('2 km',
                                            style: TextStyle(fontSize: 12)),
                                      ],
                                    ),
                                  ),

                                  const SizedBox(width: 10),

                                  // Third Container
                                  Container(
                                    width: 80,
                                    height: 20,
                                    decoration: const BoxDecoration(
                                        color:
                                            Color.fromARGB(94, 221, 221, 221),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(8))),
                                    child: const Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(Icons.local_dining,
                                            size: 16, color: Colors.black),
                                        SizedBox(width: 5),
                                        Text('30 meals',
                                            style: TextStyle(fontSize: 12)),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Positioned(
                                top: 365,
                                left: 13,
                                child: SizedBox(
                                  width: 250,
                                  height: 40,
                                  child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.deepOrange,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                      ),
                                      onPressed: () {},
                                      child: const Text(
                                        'Donate Now',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 20),
                                      )),
                                ))
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                const Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // User profile picture
                    CircleAvatar(
                      radius: 20.0,
                      backgroundImage: AssetImage(
                          'assets/images/ngo.png'), // Replace with actual image path
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

class NGOCircle extends StatelessWidget {
  final String imageUrl;

  const NGOCircle({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 80,
        height: 80,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            image: AssetImage(imageUrl),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
