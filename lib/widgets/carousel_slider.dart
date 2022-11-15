import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:marvelwatch/utils/movie_lists.dart';

class TopSlider extends StatefulWidget {
  const TopSlider({super.key});

  @override
  State<TopSlider> createState() => _TopSliderState();
  static builder(
      {required itemCount, required itemBuilder, required options}) {}
}

class _TopSliderState extends State<TopSlider> {
  Widget buildImage(String urlImage, int index) => Container(
        color: Colors.grey,
        child: Image.asset(
          urlImage,
          fit: BoxFit.cover,
          width: MediaQuery.of(context).size.width,
        ),
      );

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
        itemCount: urlImages.length,
        itemBuilder: (BuildContext context, int index, int realIndex) {
          final urlImage = urlImages[index];
          return Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 600,
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage(urlImage),
                  fit: BoxFit.cover,
                )),
              ),
              Container(
                height: 600,
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Colors.black, Colors.transparent],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter)),
              ),
              Positioned(
                bottom: 80,
                child: Column(
                  children: [
                    SizedBox(
                      width: 250,
                      child: Image.asset(urlTitles[index]),
                    ),
                    const Gap(25),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.add,
                              size: 25,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        const Gap(20),
                        _PlayButton(),
                        const Gap(20),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.share,
                              size: 25,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          );
        },
        options: CarouselOptions(
          height: 600,
          autoPlay: true,
          autoPlayInterval: const Duration(seconds: 5),
          viewportFraction: 1,
        ));
  }
}

class _PlayButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(25)),
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
      child: Column(
        children: [
          GestureDetector(
            onTap: null,
            child: const Text(
              "Play",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}
