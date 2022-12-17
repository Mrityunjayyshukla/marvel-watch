// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:marvelwatch/screens/account_page.dart';

// Custom App Bar allows a transition in its Opacity as
// the user scrolls down the app
class CustomAppBar extends StatelessWidget {
  final double scrollOffset;
  const CustomAppBar({super.key, required this.scrollOffset});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 10),
      color:
          Colors.black.withOpacity((scrollOffset / 350).clamp(0, 1).toDouble()),
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // App Bar contains the Marvel Logo and an icon
            // which are arranged with space between arrangement
            Image.asset(
              "assets/images/MarvelLogo.png",
              height: 75,
              fit: BoxFit.cover,
            ),
            IconButton(
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AccountPage())),
                icon: const Icon(
                  Icons.account_circle,
                  color: Colors.white,
                  size: 25,
                )),
          ],
        ),
      ),
    );
  }
}
