import 'package:flutter/material.dart';

class BuildRules extends StatelessWidget {
  final List<bool> crossOf;

  const BuildRules(this.crossOf);

  TextStyle _textStyle(int index) {
    return TextStyle(
      fontSize: 18,
      letterSpacing: 1.1,
      wordSpacing: 1.3,
      color: Colors.white,
      decoration:
          crossOf[index] ? TextDecoration.lineThrough : TextDecoration.none,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Has atleast 10 letters',
              style: _textStyle(0),
            ),
            Text(
              'Has atleast 1 capital alphabet',
              style: _textStyle(1),
            ),
            Text(
              'Has atleast 1 special character',
              style: _textStyle(2),
            ),
          ],
        ),
      ),
    );
  }
}
