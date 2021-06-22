import 'package:flutter/material.dart';
import 'package:tmdb/screens/auth/decoration_functions.dart';
import 'package:tmdb/screens/auth/sign_in_up_bar.dart';
import 'package:tmdb/screens/auth/title.dart';

class SignIn extends StatelessWidget {
  const SignIn({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Column(
        children: [
          Expanded(
            child: Align(
              alignment: Alignment.centerLeft,
              child: LogInTitle(
                title: 'Welcome\nBack',
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 16),
                   child: TextFormField(
                     decoration: signInInputDecoration(),
                  ),//Text('Email')//EmailTextFormField(),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 16),
                   child: TextFormField(
                     decoration: signInInputDecoration(),
                  ),//Text('Email')//EmailTextFormField(),
                ),
                SignInBar(
                  isLoading: true,
                  label: 'SignIn',
                  onPressed: (){},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
