import 'package:flutter/material.dart';
import 'package:tmdb/screens/auth/components/register.dart';

import '../background_paint.dart';
import 'components/sign_in.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key key}) : super(key: key);

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  ValueNotifier<bool> showSignInPage = ValueNotifier<bool>(true);

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox.expand(
            child: CustomPaint(
              painter: BackgroundPainter(
                animation: _controller.view,
              ),
            ),
          ),
          ValueListenableBuilder<bool>(
            builder: (context, value, child) {
              return value
                  ? SignIn(onRegisterClicked: () {
                      showSignInPage.value = false;
                      _controller.forward();
                    })
                  : Register(
                      onSignInPressed: () {
                        showSignInPage.value = true;
                        _controller.reverse();
                      },
                    );
            },
            valueListenable: showSignInPage,
          ),
        ],
      ),
    );
  }
}
