import 'package:cookipidia/cookipidia_theme.dart';
import 'package:cookipidia/main.dart';
import 'package:flutter/material.dart';
import 'package:cookipidia/cookipidia_theme.dart';

class Card1 extends StatelessWidget {
  const Card1({Key? key}) : super(key: key);

// 1
  final String category = 'Editor\'s Choice';
  final String title = 'The Art of Dough';
  final String description = 'Learn to make the perfect Naan.';
  final String chef = 'Shubham Mahajan';

// 2
  @override
  Widget build(BuildContext context) {
// 3
    return Center(
// TODO: Card1 Decorate Container
      child: Container(
        child: Stack(
          children: [
// 8
            Text(
              category,
              style: CookipidiaTheme.darkTextTheme.bodyText1,
            ),
// 9
            Positioned(
              child: Text(
                title,
                style: CookipidiaTheme.darkTextTheme.headline2,
              ),
              top: 20,
            ),
// 10
            Positioned(
              child: Text(
                description,
                style: CookipidiaTheme.darkTextTheme.bodyText1,
              ),
              bottom: 30,
              right: 0,
            ),
// 11
            Positioned(
              child: Text(
                chef,
                style: CookipidiaTheme.darkTextTheme.bodyText1,
              ),
              bottom: 10,
              right: 0,
            )
          ],
        ),
// 1
        padding: const EdgeInsets.all(16),
// 2
        constraints: const BoxConstraints.expand(
          width: 350,
          height: 450,
        ),
// 3
        decoration: const BoxDecoration(
// 4
          image: DecorationImage(
// 5
            image: AssetImage('assets/mag1.jpg'),
// 6
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(
              10.0,
            ),
          ),
        ),
      ),
    );
  }
}
