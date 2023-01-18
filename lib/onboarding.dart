import 'package:dribble_clone_3/intro_screen.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  final PageController _controller = PageController();
  bool onLastPage = false;
  bool onSecondPage = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(children: [
          PageView(
            onPageChanged: (value) {
              setState(() {
                onLastPage = (value == 2);
                onSecondPage = (value >= 1);
              });
            },
            controller: _controller,
            children: const [
              IntroScreen(
                  title: 'Customize your own fast menu',
                  subtitle:
                      'Put your own menu at the front page for faster access',
                  imgLoc: 'images/menu.png'),
              IntroScreen(
                  title: 'Set your goal with financial record',
                  subtitle: 'Automatically record your finance in an instant',
                  imgLoc: 'images/finance.png'),
              IntroScreen(
                  title: 'Find local banks and ATMs around you',
                  subtitle: 'Find the closest banks and ATMs around you',
                  imgLoc: 'images/bank.png')
            ],
          ),
          Container(
            alignment: const Alignment(0, 0.80),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                onSecondPage
                    ? IconButton(
                        onPressed: (() {
                          _controller.previousPage(
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.easeIn);
                        }),
                        icon: const Icon(Icons.arrow_back_ios))
                    : IconButton(
                        onPressed: (() {}),
                        icon: const Icon(Icons.arrow_back_ios)),
                SmoothPageIndicator(
                  controller: _controller,
                  count: 3,
                ),
                onLastPage
                    ? IconButton(
                        onPressed: (() {}),
                        icon: const Icon(Icons.arrow_forward_ios))
                    : IconButton(
                        onPressed: (() {
                          _controller.nextPage(
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.easeIn);
                        }),
                        icon: const Icon(Icons.arrow_forward_ios))
              ],
            ),
          )
        ]),
      ),
    );
  }
}
