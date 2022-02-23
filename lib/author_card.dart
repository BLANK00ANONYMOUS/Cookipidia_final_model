import 'package:flutter/material.dart';
import 'cookipidia_theme.dart';
import 'circle_image.dart';

class AuthorCard extends StatelessWidget {
  final String authorName;
  final String title;
  final ImageProvider? imageProvider;

  const AuthorCard({
    Key? key,
    required this.authorName,
    required this.title,
    this.imageProvider,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
// 1
          Row(
            children: [
              CircleImage(
                imageProvider: imageProvider,
                imageRadius: 25,
              ),
// 2
              const SizedBox(width: 8),
// 3
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    authorName,
                    style: CookipidiaTheme.lightTextTheme.headline3,
                  ),
                  Text(
                    title,
                    style: CookipidiaTheme.lightTextTheme.bodyText1,
                  )
                ],
              ),

            ],
          ),
          IconButton(
// 4
              icon: const Icon(Icons.favorite_border),
              iconSize: 30,
              color: Colors.grey[400],
// 5
              onPressed: () {
                const snackBar = SnackBar(content: Text('Favorite Pressed'));
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              }),
        ],
      ),
    );
  }
}
