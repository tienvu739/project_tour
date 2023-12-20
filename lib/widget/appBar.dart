import 'package:flutter/material.dart';
import 'package:project_tour/core/color_palatte.dart';
import 'package:project_tour/core/dimension_constants.dart';

class appbar extends StatelessWidget {
  const appbar({
    super.key,
    required this.child,
    this.title,
    this.titleString,
    this.implementLeaning = false,
    this.implemenTraling = false,
  });

  final Widget child;
  final Widget? title;
  final String? titleString;
  final bool implementLeaning;
  final bool implemenTraling;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: 186,
            child: AppBar(
              centerTitle: true,
              automaticallyImplyLeading: false,
              elevation: 0,
              toolbarHeight: 90,
              backgroundColor: Colors.white,
              title: title ??
                  Row(
                    children: [
                      if (implementLeaning)
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(
                                Radius.circular(kDefaultPadding)),
                          ),
                          padding: EdgeInsets.all(kItemPadding),
                          child: Icon(
                            Icons.arrow_back,
                            color: Colors.black,
                            size: kDefaultIconSize,
                          ),
                        ),
                      Expanded(
                          child: Center(
                        child: Column(
                          children: [
                            Text(
                              titleString ?? '',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            )
                          ],
                        ),
                      ),
                      ),
                      if(implemenTraling)
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(
                                Radius.circular(kDefaultPadding)),
                          ),
                          padding: EdgeInsets.all(kItemPadding),
                          child: Icon(
                            Icons.add_alert,
                            color: Colors.black,
                            size: kDefaultIconSize,
                          ),
                        ),
                    ],
                  ),
              flexibleSpace: Stack(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                        gradient: Gradients.defaultGradientBackground,
                        borderRadius:
                            BorderRadius.only(bottomLeft: Radius.circular(45))),
                  )
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 146),
            padding: EdgeInsets.symmetric(horizontal: kMediumPadding),
            child: child,
          )
        ],
      ),
    );
    ;
  }
}
