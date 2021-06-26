import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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

  /// Authemntication
  final _auth = FirebaseAuth.instance;
  var _isLoading = false;

  void _submitAuthForm(
    String email,
    String passwd,
    bool isLogin,
    BuildContext ctx,
  ) async {
    await Firebase.initializeApp();

    UserCredential authResult;
    try {
      setState(() {
        _isLoading = true;
      });
      if (isLogin) {
        authResult = await _auth.signInWithEmailAndPassword(
            email: email, password: passwd);
      } else {
        authResult = await _auth.createUserWithEmailAndPassword(
            email: email, password: passwd);

        await FirebaseFirestore.instance
            .collection('users')
            .doc(authResult.user.uid)
            .set({
          'email': email,
        });
      }
    } on PlatformException catch (err) {
      var message = 'An error occured, please check your credentials';
      if (err.message != null) {
        message = err.message;
      }

      ScaffoldMessenger.of(ctx).showSnackBar(SnackBar(
        content: Text(message),
        backgroundColor: Color.fromRGBO(49, 39, 79, 1),
      ));

      setState(() {
        _isLoading = true;
      });
    } catch (e) {
      print(e);

      setState(() {
        _isLoading = true;
      });
    }
  }

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
                      submitFn: _submitAuthForm,
                    );
            },
            valueListenable: showSignInPage,
          ),
        ],
      ),
    );
  }
}
