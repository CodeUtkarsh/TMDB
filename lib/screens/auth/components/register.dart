import 'package:flutter/material.dart';
import 'package:tmdb/screens/auth/components/build_text.dart';
import 'package:tmdb/screens/auth/components/decoration_functions.dart';
import 'package:tmdb/screens/auth/components/sign_in_up_bar.dart';
import 'package:tmdb/screens/auth/components/title.dart';

class Register extends StatefulWidget {
  Register({
    Key key,
    this.onSignInPressed,
  }) : super(key: key);

  final VoidCallback onSignInPressed;

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool showText = false;
  List<bool> crossOf = [false, false, false, false];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 32.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 3,
            child: Align(
              alignment: Alignment.centerLeft,
              child: LogInTitle(
                title: 'Create\nAccount',
              ),
            ),
          ),
          Expanded(
            flex: 7,
            child: Form(
              child: ListView(
                shrinkWrap: true,
                children: [
                  Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0),
                    child: TextFormField(
                      style: TextStyle(fontSize: 22.0, color: Colors.white),
                      decoration: registerInputDecoration(hintText: 'Email'),
                    ), //Text('Email')//EmailTextFormField(),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0),
                    child: TextFormField(
                      style: TextStyle(fontSize: 22.0, color: Colors.white),
                      onTap: () {
                        setState(() {
                          showText = true;
                        });
                      },
                      onChanged: (value) {
                        if (value.length >= 8) {
                          setState(() {
                            crossOf[0] = true;
                          });
                        } else {
                          setState(() {
                            crossOf[0] = false;
                          });
                        }
                        if (value.contains(RegExp(r'[A-Z]'))) {
                          setState(() {
                            crossOf[1] = true;
                          });
                        } else {
                          setState(() {
                            crossOf[1] = false;
                          });
                        }
                        if (value.contains(RegExp(r'[!@#$%^&.,<>]'))) {
                          setState(() {
                            crossOf[2] = true;
                          });
                        } else {
                          setState(() {
                            crossOf[2] = false;
                          });
                        }
                      },
                      decoration: registerInputDecoration(hintText: 'Password'),
                    ), //Text('Email')//EmailTextFormField(),
                  ),
                  Container(
                    padding: EdgeInsets.all(10.0),
                    child: showText ? BuildRules(crossOf) : null,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  SignUpBar(
                    isLoading: false,
                    label: 'Sign Up',
                    onPressed: () {},
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: InkWell(
                      splashColor: Colors.white,
                      onTap: () {
                        widget.onSignInPressed?.call();
                      },
                      child: const Text(
                        'Sign In',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
