import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Page3 extends StatelessWidget {
  final Size size;
  final List<Widget> indicators;

  const Page3({@required this.size, @required this.indicators});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Positioned(
          bottom: 0,
          child: Container(
            height: size.height / 1.7,
            width: size.width - 32,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40.0),
                topRight: Radius.circular(40.0),
              ),
              gradient: LinearGradient(
                begin: Alignment(0.0, -1.0),
                end: Alignment(0.0, 0.81),
                colors: [const Color(0xffbddbd6), const Color(0xffbdbddb)],
                stops: [0.0, 1.0],
              ),
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: size.height / 4.6,
              ),
              Text(
                'Lets get started',
                style: TextStyle(
                  fontFamily: 'DM Sans',
                  fontSize: 52,
                  color: const Color(0xff586f7c),
                  fontWeight: FontWeight.w700,
                  height: 1.5,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: size.height / 6,
              ),
              Row(
                children: indicators,
              ),
            ],
          ),
        ),
        // Adobe XD layer: 'movie_icon' (shape)
        Positioned(
          top: 0,
          left: size.width / 7,
          child: // Adobe XD layer: 'Group 6' (shape)
              Container(
            height: 2 * size.height / 8,
            width: size.width / 1.5,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: const AssetImage('assets/images/page3.png'),
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: CupertinoButton(
            padding: EdgeInsets.only(right: 20, bottom: 10),
            onPressed: () {
              Navigator.popAndPushNamed(context, 'auth-screen');
            },
            child: Container(
              height: size.height / 11,
              width: size.height / 11,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0xff0f161a),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0x52000000),
                    offset: Offset(3, 5),
                    blurRadius: 6,
                  ),
                ],
              ),
              alignment: Alignment.center,
              child: Icon(CupertinoIcons.arrow_right),
            ),
          ),
        )
      ],
    );
  }
}
