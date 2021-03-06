import 'package:flutter/material.dart';

import 'author_card.dart';
import 'fooderlich_theme.dart';

// Card2
class Card2 extends StatelessWidget {
  const Card2({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        // Constraints == size (i think so)
        constraints: const BoxConstraints.expand(
          width: 350,
          height: 450,
        ),
        decoration: const BoxDecoration(
          // BackgroundImage
          image: DecorationImage(
            image: AssetImage('assets/mag5.jpg'),
            fit: BoxFit.cover,
          ),
          // Border Radius of the Background Image
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
        ),
        child: Column(
          children: [
            // Author Container
            const AuthorCard(
              authorName: 'Madina Zhunusova',
              title: 'Tokio Co-Founder',
              imageProvider: AssetImage('assets/author_katz.png'),
            ),
            // Main content
            // With Expanded, you fill in the remaining available space.
            Expanded(
              // Apply a Stack widget to position the texts on top of each other (!).
              child: Stack(
                children: [
                  // Position the first text 16 pixels from the bottom and 16 pixels from the right.
                  Positioned(
                    bottom: 16,
                    right: 16,
                    child: Text(
                      'Passion',
                      style: FooderlichTheme.darkTextTheme.headline1,
                    ),
                  ),
                  // Finally, position the second text 70 pixels from the bottom and 16 pixels from the left.
                  // Also apply a RotatedBox widget, which rotates the text clockwise three quarterTurns. This makes it appear vertical.
                  Positioned(
                    bottom: 70,
                    left: 16,
                    child: RotatedBox(
                      quarterTurns: 3,
                      child: Text(
                        'Aesthetics',
                        style: FooderlichTheme.darkTextTheme.headline1,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
