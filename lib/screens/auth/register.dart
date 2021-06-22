import 'package:flutter/material.dart';
import 'package:tmdb/screens/auth/decoration_functions.dart';
import 'package:tmdb/screens/auth/sign_in_up_bar.dart';
import 'package:tmdb/screens/auth/title.dart';

class Register extends StatelessWidget {
  const Register({
    Key key,
    this.onSignInPressed,
  }) : super(key: key);

  final VoidCallback onSignInPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
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
            flex: 4,
            child: ListView(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  child: TextFormField(
                    decoration: registerInputDecoration(hintText: 'Email'),
                  ), //Text('Email')//EmailTextFormField(),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  child: TextFormField(
                    decoration: registerInputDecoration(hintText: 'Password'),
                  ), //Text('Email')//EmailTextFormField(),
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
                      onSignInPressed?.call();
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
        ],
      ),
    );
  }
}
