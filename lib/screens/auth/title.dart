import 'package:flutter/material.dart';

class LogInTitle extends StatelessWidget {
  const LogInTitle({
    Key key,
    @required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w600,
        fontSize:34,
      ),
    );
  }
}
