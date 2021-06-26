import 'package:flutter/material.dart';
import 'package:tmdb/screens/auth/components/build_text.dart';
import 'package:tmdb/screens/auth/components/decoration_functions.dart';
import 'package:tmdb/screens/auth/components/sign_in_up_bar.dart';
import 'package:tmdb/screens/auth/components/title.dart';

class Register extends StatefulWidget {
  Register({
    Key key,
    this.onSignInPressed,
    this.submitFn,
  }) : super(key: key);

  final VoidCallback onSignInPressed;
  final void Function(
      String email, String password, bool isLogin, BuildContext ctx) submitFn;

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool showText = false;
  List<bool> crossOf = [false, false, false, false];
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
        false,
        context,
      );
    }
  }

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
              key: _formKey,
              child: ListView(
                shrinkWrap: true,
                children: [
                  Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0),
                    child: TextFormField(
                      validator: (value) {
                        if (value.isEmpty || !value.contains('@')) {
                          return 'Enter valid email';
                        }
                        return null;
                      },
                      onSaved: (newValue) => _userEmail = newValue,
                      keyboardType: TextInputType.emailAddress,
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
                      validator: (value) {
                        if (value.isEmpty || value.length < 7)
                          return 'Password should be atleast 7 characters long';
                        return null;
                      },
                      onSaved: (newValue) => _userPasswd = newValue,
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
                    onPressed: _trySubmit,
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
