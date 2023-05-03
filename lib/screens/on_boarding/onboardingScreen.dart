import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

import 'package:get/get.dart';
import 'package:rescue_animal/screens/on_boarding/pages_data.dart';
import 'package:rescue_animal/widgets/navbar.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../model/onboard_model.dart';
import '../../tabs/home_tab.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();

  List<OnBoardModel> onBoardingData = OnBoardModel.onBoardingData();
  int nextPage = 0;
  int previousPage = 0;

  @override
  Widget build(BuildContext context) {
    // ignore: no_leading_underscores_for_local_identifiers
    List<Widget> _pages =
        onBoardingData.map((data) => OnboardPagesData(data: data)).toList();

    var circleButton = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextButton(
            onPressed: () {},
            child: const Text('Skip',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16))),
        IconButton(
          onPressed: () {
            int currentPage = _pageController.page!.toInt();
            setState(() {
              previousPage = nextPage;
              nextPage = currentPage >= nextPage ? previousPage + 1 : nextPage;

              if (nextPage == _pages.length) {}
            });

            _pageController.animateToPage(nextPage,
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeInCubic);
          },
          icon: Icon(
            Icons.arrow_forward,
            color: Theme.of(context).primaryColor,
            size: 30,
          ),
        ),
      ],
    );
    var rectangleButton = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            fixedSize: const Size(200, 50),
            backgroundColor: Theme.of(context).primaryColor,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
          ),
          onPressed: () {
            Get.to(Navbar());
          },
          child: const Text(
            'Next',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
    var pageIndicator = Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: SmoothPageIndicator(
          controller: _pageController,
          count: _pages.length,
          effect: WormEffect(
            dotHeight: 12,
            dotWidth: 12,
            type: WormType.thin,
            activeDotColor: Theme.of(context).primaryColor,
            dotColor: Colors.grey.shade300,
          ),
        ),
      ),
    );

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: _pages.length,
                itemBuilder: (_, index) {
                  return _pages[index % _pages.length];
                },
              ),
            ),
            const SizedBox(height: 4),
            pageIndicator,
            const SizedBox(
              height: 24,
            ),
            nextPage < 2 ? circleButton : rectangleButton,
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
