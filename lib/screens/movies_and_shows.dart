import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:marvelwatch/utils/movie_lists.dart';
import 'package:marvelwatch/widgets/horizontal_list.dart';

class MoviesAndShows extends StatefulWidget {
  const MoviesAndShows({super.key});

  @override
  State<MoviesAndShows> createState() => _MoviesAndShowsState();
}

class _MoviesAndShowsState extends State<MoviesAndShows> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Column(children: [
              Stack(
                children: [
                  Image(
                    image: const AssetImage("assets/images/avengersbanner.png"),
                    width: MediaQuery.of(context).size.width,
                  ),
                  Positioned(
                      left: 5,
                      top: 5,
                      child: IconButton(
                        icon: const Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        ),
                        onPressed: () => Navigator.pop(context),
                      )),
                  Positioned(
                    top: MediaQuery.of(context).size.height / 12,
                    child: const Image(
                      image: AssetImage("assets/images/MarvelLogo.png"),
                      width: 200,
                      height: 88.16,
                    ),
                  )
                ],
              ),
              const Gap(60),

              // Marvel Cinematic Universe
              const Text(
                "Marvel Cinematic Universe",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              const Gap(20),
              HorizontalScroll(scrolllist: mcutitles),
              const Gap(40),

              // MCU Phase 1
              const Text(
                "Marvel Cinematic Universe Phase 1",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              const Gap(20),
              HorizontalScroll(scrolllist: mcuphase1),
              const Gap(40),

              // MCU Phase 2
              const Text(
                "Marvel Cinematic Universe Phase 2",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              const Gap(20),
              HorizontalScroll(scrolllist: mcuphase2),
              const Gap(40),

              // MCU Phase 3
              const Text(
                "Marvel Cinematic Universe Phase 3",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              const Gap(20),
              HorizontalScroll(scrolllist: mcuphase3),
              const Gap(40),

              // MCU Phase 4
              const Text(
                "Marvel Cinematic Universe Phase 4",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              const Gap(20),
              HorizontalScroll(scrolllist: mcuphase4),
              const Gap(40),

              // SpiderVerse
              const Text(
                "Welcome to the Spider-Verse",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              const Gap(20),
              HorizontalScroll(scrolllist: spiderVerse),
              const Gap(40),

              // Defenders Saga
              const Text(
                "Marvel's Defenders Saga",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              const Gap(20),
              HorizontalScroll(scrolllist: defenderSaga),
              const Gap(40),

              // Legacy Movies
              const Text(
                "Marvel Legacy Movies",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              const Gap(20),
              HorizontalScroll(scrolllist: legacymovies),
              const Gap(40),
            ]),
          ),
        ),
      ),
    );
  }
}
