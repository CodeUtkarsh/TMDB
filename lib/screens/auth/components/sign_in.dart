import 'package:flutter/material.dart';

import 'package:tmdb/screens/auth/components/decoration_functions.dart';
import 'package:tmdb/screens/auth/components/sign_in_up_bar.dart';
import 'package:tmdb/screens/auth/components/title.dart';

class SignIn extends StatelessWidget {
  const SignIn({
    Key key,
    @required this.onRegisterClicked,
  }) : super(key: key);

  final VoidCallback onRegisterClicked;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Column(
        children: [
          Expanded(
            flex: 2,
            child: Align(
              alignment: Alignment.centerLeft,
              child: LogInTitle(
                title: 'Welcome\nBack',
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: ListView(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  child: TextFormField(
                    decoration: signInInputDecoration(hintText: 'Email'),
                  ), //Text('Email')//EmailTextFormField(),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  child: TextFormField(
                    decoration: signInInputDecoration(hintText: 'Password'),
                  ), //Text('Email')//EmailTextFormField(),
                ),
                SignInBar(
                  isLoading: false,
                  label: 'Sign In',
                  onPressed: () {},
                ),
                // Expanded(
                //   child:
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Column(
                    children: [
                      InkWell(
                        splashColor: Colors.white,
                        onTap: () {
                          onRegisterClicked?.call();
                        },
                        child: RichText(
                          text: const TextSpan(
                            text: "Don't have an account?",
                            style: TextStyle(color: Colors.black54),
                            children: <TextSpan>[
                              TextSpan(
                                text: 'SIGN UP',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),

                        // // child: const Text(
                        // //   'Sign Up',
                        // //   style: TextStyle(
                        // //     color: Palette.darkBlue,
                        // //     fontSize: 16,
                        // //     decoration: TextDecoration.underline,
                        // //   ),
                        //),
                      ),
                    ],
                  ),
                ),
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
