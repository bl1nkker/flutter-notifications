import 'package:flutter/material.dart';

import 'circle_image.dart';
import 'fooderlich_theme.dart';

// Author Card from Card2
class AuthorCard extends StatelessWidget {
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

  // 2
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
              imageProvider: imageProvider,
              imageRadius: 28,
            ),
            // Space between the Avatar and AuthorName
            const SizedBox(width: 8),
            // Author Info column
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  authorName,
                  style: FooderlichTheme.darkTextTheme.headline2,
                ),
                Text(
                  title,
                  style: FooderlichTheme.darkTextTheme.headline3,
                )
              ],
            ),
          ]),
          // Like icon button
          IconButton(
            icon: const Icon(Icons.favorite_border),
            iconSize: 30,
            color: Colors.grey[400],
            onPressed: () {
              // SnackBar (cool item!)
              const snackBar = SnackBar(content: Text('Favorite Pressed'));
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            },
          ),
        ],
      ),
    );
  }
}
