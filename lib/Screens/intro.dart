import 'dart:async';

import 'package:flutter/material.dart';
import 'package:project_tour/core/dimension_constants.dart';
import 'package:project_tour/helpers/assets.dart';
import 'package:project_tour/helpers/image_helper.dart';
import 'package:project_tour/loginUi/login.dart';
import 'package:project_tour/widget/button_widget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class introScreen extends StatefulWidget {
  const introScreen({super.key});

  static const routeName = "home_screen";

  @override
  State<introScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<introScreen> {
  final PageController _pageController = PageController();
  final StreamController<int> _pageStream = StreamController<int>.broadcast();

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      _pageStream.add(_pageController.page!.toInt());
    });
  }

  Widget _pageIntro(String image, String title, String description) {
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        ImageHelper.loadFromAsset(image,
            height: 375, width: 300, fit: BoxFit.fitHeight),
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: kMediumPadding),
          child: Column(
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: Colors.black,
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Text(description,
                  style: const TextStyle(
                    color: Colors.black,
                  ))
            ],
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        PageView(
          controller: _pageController,
          children: [
            _pageIntro(
                Assets.imageIntro1, "test lan 1", "test thu co chay khong"),
            _pageIntro(
                Assets.imageIntro2, "test lan 1", "test thu co chay khong"),
            _pageIntro(
                Assets.imageIntro3, "test lan 1", "test thu co chay khong"),
          ],
        ),
        Positioned(
            left: kMediumPadding,
            right: kMediumPadding,
            bottom: kMediumPadding * 3,
            child: Row(
              children: [
                Expanded(
                  flex: 7,
                  child: SmoothPageIndicator(
                    controller: _pageController,
                    count: 3,
                    effect: const ExpandingDotsEffect(
                        dotWidth: kMinPadding,
                        dotHeight: kMinPadding,
                        activeDotColor: Colors.blue),
                  ),
                ),
                StreamBuilder<int>(
                    initialData: 0,
                    stream: _pageStream.stream,
                    builder: (context, snapshot) {
                      return Expanded(
                        flex: 3,
                        child: button_widget(
                            ontap: () {
                              if (_pageController.page != 2)
                                _pageController.nextPage(
                                    duration: Duration(microseconds: 200),
                                    curve: Curves.easeIn);
                              else
                                Navigator.of(context)
                                    .pushNamed(LoginScreen.routeName);
                            },
                            title: snapshot.data != 2 ? 'next' : 'get started'),
                      );
                    })
              ],
            ))
      ],
    ));
  }
}
