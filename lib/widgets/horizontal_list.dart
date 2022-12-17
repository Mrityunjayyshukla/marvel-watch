// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:marvelwatch/screens/series_page.dart';

class HorizontalScroll extends StatelessWidget {
  final scrolllist;
  const HorizontalScroll({Key? mykey, required this.scrolllist})
      : super(key: mykey);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 159.19,
      child: ListView.separated(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 8),
          itemCount: scrolllist.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () => const SeriesPage(),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image(
                  image: AssetImage(scrolllist[index]),
                  //height: 200,
                  width: 120,
                  fit: BoxFit.cover,
                ),
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) => const SizedBox(
                width: 12,
              )),
    );
  }
}

class AvengersScroll extends StatelessWidget {
  final avengersScroll;
  const AvengersScroll({super.key, required this.avengersScroll});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 265.35,
      child: ListView.separated(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          padding: const EdgeInsets.symmetric(horizontal: 8),
          itemBuilder: (BuildContext context, int index) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image(
                image: AssetImage(avengersScroll[index]),
                width: 200,
                fit: BoxFit.cover,
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) => const SizedBox(
                width: 12,
              ),
          itemCount: avengersScroll.length),
    );
  }
}
