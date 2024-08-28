import 'package:flutter/material.dart';
import 'package:plant_app/constants.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController(initialPage: 0);
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text('Onboarding Screen'),
          backgroundColor: Colors.white,
          elevation: 0.0,
          actions: [
            Padding(
                padding: const EdgeInsets.only(right: 20, top: 20),
                child: InkWell(
                    onTap: () => null, // to login screen
                    child: const Text(
                      'Skip',
                      style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w400,
                          fontSize: 16.0),
                    )))
          ],
        ),
        body: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            PageView(
              onPageChanged: (int page) {
                setState(() {
                  currentIndex = page;
                });
              },
              controller: _pageController,
              children: [
                Container(
                    padding: EdgeInsets.only(left: 50, right: 50, bottom: 80),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                            height: 350,
                            child: Image.asset('assets/images/plant-one.png')),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(Constants.titleOne,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Constants.primaryColor,
                                fontSize: 30,
                                fontWeight: FontWeight.bold)),
                        const SizedBox(height: 20),
                        Text(Constants.descriptionOne,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w400)),
                        const SizedBox(height: 20),
                      ],
                    ))
              ],
            )
          ],
        ));
  }
}
