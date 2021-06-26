import 'package:flutter/material.dart';

import 'package:tmdb/screens/auth/components/decoration_functions.dart';
import 'package:tmdb/screens/auth/components/sign_in_up_bar.dart';
import 'package:tmdb/screens/auth/components/title.dart';

class SignIn extends StatefulWidget {
  const SignIn({
    Key key,
    @required this.onRegisterClicked,
    this.submitFn,
  }) : super(key: key);

  final VoidCallback onRegisterClicked;
  final void Function(
      String email, String password, bool isLogin, BuildContext ctx) submitFn;

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  bool showCheckList = false;
  final _formKey = GlobalKey<FormState>();
  String _userEmail = '';
  String _userPasswd = '';

  void _trySubmit() {
    final isValid = _formKey.currentState.validate();
    FocusScope.of(context).unfocus();

    if (isValid) {
      _formKey.currentState.save();
      widget.submitFn(
        _userEmail.trim(),
        _userPasswd.trim(),
        true,
        context,
      );
    }
  }

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
            child: Form(
              key: _formKey,
              child: ListView(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    child: TextFormField(
                      validator: (value) {
                        if (value.isEmpty || !value.contains('@')) {
                          return 'Enter valid email';
                        }
                        return null;
                      },
                      onSaved: (newValue) => _userEmail = newValue,
                      keyboardType: TextInputType.emailAddress,
                      decoration: signInInputDecoration(hintText: 'Email'),
                    ), //Text('Email')//EmailTextFormField(),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    child: TextFormField(
                      validator: (value) {
                        if (value.isEmpty || value.length < 8) {
                          return 'Enter atleast 8 letters';
                        }
                        return null;
                      },
                      onSaved: (newValue) => _userPasswd = newValue,
                      decoration: signInInputDecoration(hintText: 'Password'),
                    ), //Text('Email')//EmailTextFormField(),
                  ),
                  SizedBox(
                    height: 10,
                  ),

                  SignInBar(
                    isLoading: false,
                    label: 'Sign In',
                    onPressed: _trySubmit,
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
                            widget.onRegisterClicked?.call();
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
          ),
        ],
      ),
    );
  }
}
