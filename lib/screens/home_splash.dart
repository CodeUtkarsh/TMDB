import 'package:flutter/material.dart';
import './onboarding/constants.dart';

class HomeSplash extends StatefulWidget {
  const HomeSplash({Key key}) : super(key: key);

  @override
  _HomeSplashState createState() => _HomeSplashState();
}

class _HomeSplashState extends State<HomeSplash> {
  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 30),
            alignment: Alignment.center,
            child: Image.asset(
              'assets/images/tmdb_icon.png',
              color: kprimaryColor,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            height: _size.height / 8,
          ),
          CircularProgressIndicator.adaptive(
            strokeWidth: 5.0,
            backgroundColor: kprimaryColor,
          ),
        ],
      ),
    );
  }
}
