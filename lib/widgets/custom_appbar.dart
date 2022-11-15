// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:marvelwatch/screens/account_page.dart';

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

/*class VerticalIconButton extends StatelessWidget {
  final IconData icon;
  final String title;
  final Function onTap;
  const VerticalIconButton(
      {super.key,
      required this.icon,
      required this.title,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap(),
      child: Column(
        children: [
          Icon(
            icon,
            color: Colors.white,
          ),
          const SizedBox(
            height: 2.0,
          ),
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          )
        ],
      ),
    );
  }
}*/
