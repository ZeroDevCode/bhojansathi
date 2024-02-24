import 'package:bhojansathi/config/routePaths.dart';
import 'package:bhojansathi/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:preload_page_view/preload_page_view.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  OnboardingScreenState createState() => OnboardingScreenState();
}

class OnboardingScreenState extends State<OnboardingScreen> {
  final PreloadPageController _pageController =
      PreloadPageController(initialPage: 0);
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PreloadPageView(
            pageSnapping: true,
            physics: ClampingScrollPhysics(),
            controller: _pageController,
            onPageChanged: (index) {
              setState(
                () {
                  currentPageIndex = index;
                },
              );
            },
            preloadPagesCount: 4,
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
                color: Color(0xFFFFE1D7),
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
                color: Color(0xFFF1F0F5),
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
                color: Color(0xFFFFFFFF),
              ),
              OnboardingPage(
                imagePath: Assets.onboardingFour,
                title: 'Volunteer',
                description:
                    'Delivering joy through donated food, making hearts smile.',
                onNext: () {},
                isLastPage: true,
                color: Color(0xFFE8E8E8),
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
                        width: 100,
                        height: 100,
                        child: buildIndicators(context),
                      )
                    : SizedBox(
                        width: MediaQuery.of(context).size.width - 40,
                        height: 60,
                        child: buildGetStartedButton(context),
                      ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildIndicators(BuildContext context) {
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
      child: InkWell(
        onTap: (){
          context.go(RoutePaths.loginScreen);
        },
        child: Container(
          alignment: Alignment.center,
          height: 50,
          decoration: ShapeDecoration(
            color: Colors.deepOrange,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: const Text(
            "Get Started",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
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
  final Color color;

  const OnboardingPage({
    super.key,
    required this.imagePath,
    required this.title,
    required this.description,
    required this.onNext,
    required this.color,
    this.isLastPage = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      child: Stack(
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
                  textAlign: TextAlign.center,
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
      ),
    );
  }
}
