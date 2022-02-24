import 'package:flutter/material.dart';
import 'cookipidia_theme.dart';
import 'circle_image.dart';

class AuthorCard extends StatefulWidget {
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
  State<AuthorCard> createState() => _AuthorCardState();
}

class _AuthorCardState extends State<AuthorCard> {
  bool _isFavorited = false;
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
                imageProvider: widget.imageProvider,
                imageRadius: 25,
              ),
// 2
              const SizedBox(width: 8),
// 3
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.authorName,
                    style: CookipidiaTheme.lightTextTheme.headline3,
                  ),
                  Text(
                    widget.title,
                    style: CookipidiaTheme.lightTextTheme.bodyText1,
                  )
                ],
              ),

            ],
          ),
          IconButton(
// 4
              icon: Icon(_isFavorited ? Icons.favorite : Icons.favorite_border),
              iconSize: 30,
              color: Colors.red[400],
// 5
              onPressed: () {
                setState(() {
                  _isFavorited = !_isFavorited;
                });
              }),
        ],
      ),
    );
  }
}
