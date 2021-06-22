import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tmdb/config/palette.dart';
import 'constants.dart';
import './widgets/page1.dart';
import 'widgets/page2.dart';
import 'widgets/page3.dart';

class OnboadingScreen extends StatefulWidget {
  const OnboadingScreen({Key key}) : super(key: key);

  @override
  _OnboadingScreenState createState() => _OnboadingScreenState();
}

class _OnboadingScreenState extends State<OnboadingScreen> {
  final _numPages = 3;
  int _currentPage = 0;
  final _pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    Widget _indicator(bool isActive) {
      return AnimatedContainer(
        duration: Duration(microseconds: 150),
        height: 8.0,
        margin: EdgeInsets.symmetric(horizontal: 8.0),
        width: isActive ? 24.0 : 16.0,
        decoration: BoxDecoration(
          color: isActive ? Colors.white : klightShade,
          borderRadius: BorderRadius.all(Radius.circular(12.0)),
        ),
      );
    }

    List<Widget> buildPageIndicator() {
      List<Widget> list = [];
      for (var i = 0; i < _numPages; i++) {
        list.add(_indicator(i == _currentPage));
      }
      return list;
    }

    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Container(
          decoration: BoxDecoration(color: Palette.darkBlue),
          child: Column(
            children: [
              Container(
                height: size.height / 8.82,
                padding: const EdgeInsets.only(top: 20),
                alignment: Alignment.centerRight,
                child: Container(
                  child: _currentPage != _numPages - 1
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CupertinoButton(
                              child: Row(
                                children: [
                                  Text(
                                    'Next ',
                                    style: TextStyle(
                                        color: ktextColor,
                                        fontSize: 20.0,
                                        fontFamily:
                                            GoogleFonts.dmSans().fontFamily),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Icon(
                                    CupertinoIcons.arrow_right,
                                    color: ktextColor,
                                  ),
                                ],
                              ),
                              onPressed: () {
                                _pageController.nextPage(
                                  duration: Duration(microseconds: 500),
                                  curve: Curves.ease,
                                );
                              },
                            ),
                            CupertinoButton(
                              child: Text(
                                'Skip',
                                style: TextStyle(
                                    color: ktextColor,
                                    fontSize: 20.0,
                                    fontFamily:
                                        GoogleFonts.dmSans().fontFamily),
                              ),
                              onPressed: () {
                                _pageController.jumpToPage(2);
                              },
                            ),
                          ],
                        )
                      : null,
                ),
              ),
              SizedBox(
                height: size.height / 7.5,
              ),
              Container(
                height: size.height / 1.33,
                child: PageView(
                  physics: ClampingScrollPhysics(),
                  controller: _pageController,
                  onPageChanged: (page) {
                    setState(() {
                      _currentPage = page;
                    });
                  },
                  children: [
                    Page1(
                      size: size,
                      indicators: buildPageIndicator(),
                    ),
                    Page2(
                      size: size,
                      indicators: buildPageIndicator(),
                    ),
                    Page3(
                      size: size,
                      indicators: buildPageIndicator(),
                    ),
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
