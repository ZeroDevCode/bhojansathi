import 'package:bhojansathi/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: OnboardingScreen(),
    );
  }
}

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  PageController _pageController = PageController(initialPage: 0);
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                currentPageIndex = index;
              });
            },
            children: [
              OnboardingPage(
                imagePath: Assets.onboardingOne,
                title: 'Donate Your Excess Food',
                description:
                    'Please consider donating your excess food to help those in need and reduce food waste.',
                onNext: () {
                  _pageController.nextPage(
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.ease,
                  );
                },
              ),
              OnboardingPage(
                imagePath: Assets.onboardingTwo,
                title: 'Reduce Food Waste',
                description:
                    'Cut down on food waste, donate excess, and make a greener impact.',
                onNext: () {
                  _pageController.nextPage(
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.ease,
                  );
                },
              ),
              OnboardingPage(
                imagePath: Assets.onboardingThree,
                title: 'Feed Together, Thrive Forever',
                description:
                    'Join hands with us to make a difference – help us help others .',
                onNext: () {
                  _pageController.nextPage(
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.ease,
                  );
                },
              ),
              OnboardingPage(
                imagePath: Assets.onboardingThree,
                title: 'Volunteer',
                description:
                    'Delivering joy through donated food, making hearts smile.',
                onNext: () {
                  context.go('/home_Screen');
                },
                isLastPage: true,
              ),
            ],
          ),
          Positioned(
              bottom: 10.00,
              left: 0,
              right: 0,
              child: Container(
                alignment: Alignment.center,
                child: SizedBox(
                  child: currentPageIndex != 3
                      ? SizedBox(
                          width: 100, height: 100, child: buildIndicators())
                      : SizedBox(
                          width: 300,
                          height: 60,
                          child: buildGetStartedButton(context)),
                ),
              )),
        ],
      ),
    );
  }

  Widget buildIndicators() {
    return Visibility(
      visible: currentPageIndex != 3,
      child: ListView.builder(
        itemCount: 4,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Container(
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color:
                    index == currentPageIndex ? Colors.deepOrange : Colors.grey,
              ),
            ),
          );
        },
      ),
    );
  }

  Widget buildGetStartedButton(BuildContext context) {
    return Visibility(
      visible: currentPageIndex == 3,
      child: Container(
        alignment: Alignment.center,
        width: 304,
        height: 50,
        decoration: ShapeDecoration(
          color: const Color(0xFFE47343),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: const Text(
          "Get Started",
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}

class OnboardingPage extends StatelessWidget {
  final String imagePath;
  final String title;
  final String description;
  final VoidCallback onNext;
  final bool isLastPage;

  const OnboardingPage({
    required this.imagePath,
    required this.title,
    required this.description,
    required this.onNext,
    this.isLastPage = false,
  }) : super();

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              imagePath,
              height: 200,
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                description,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
