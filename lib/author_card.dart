import 'package:flutter/material.dart';

import 'circle_image.dart';
import 'fooderlich_theme.dart';

// Author Card from Card2
class AuthorCard extends StatefulWidget {
  // 1
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
      // Author Card main Row between Author info and Like icon
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Secondary row between Author Avatar and Author Info
          Row(children: [
            // Custom Widget (Author Avatar)
            CircleImage(
              imageProvider: widget.imageProvider,
              imageRadius: 28,
            ),
            // Space between the Avatar and AuthorName
            const SizedBox(width: 8),
            // Author Info column
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.authorName,
                  style: FooderlichTheme.darkTextTheme.headline2,
                ),
                Text(
                  widget.title,
                  style: FooderlichTheme.darkTextTheme.headline3,
                )
              ],
            ),
          ]),
          // Like icon button
          IconButton(
            // First, it checks if the user has favorited this recipe card. If true, it shows a filled heart. If false, it shows an outlined heart.
            icon: Icon(_isFavorited ? Icons.favorite : Icons.favorite_border),
            iconSize: 30,
            // It changes the color to red to give the app more life.
            color: Colors.red[400],
            onPressed: () {
              // When the user presses the IconButton, it toggles the _isFavorited state via a call to setState().
              setState(() {
                _isFavorited = !_isFavorited;
              });
            },
          )
        ],
      ),
    );
  }
}
