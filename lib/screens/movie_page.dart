import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class MoviePage extends StatefulWidget {
  const MoviePage({super.key});

  @override
  State<MoviePage> createState() => _MoviePageState();
}

class _MoviePageState extends State<MoviePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              movieWidget(context),
              const Gap(32),

              // Title And Rating
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Avengers: Endgame",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 22),
                      ),
                      const Gap(12),
                      movieTags(context),
                    ],
                  ),
                  Row(
                    children: const [
                      Icon(
                        Icons.star_outline,
                        size: 32,
                        color: Colors.yellow,
                      ),
                      Gap(5),
                      Text(
                        "8.7/10",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      )
                    ],
                  )
                ],
              ),
              const Gap(20),

              // Description
              const Text(
                "An Industrialist constructs a high-tech armoured and decides to use his suit to fight against evil forces and save the world.",
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              const Gap(32),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  optionButtons(context, "Download"),
                  optionButtons(context, "Wishlist"),
                  optionButtons(context, "Share"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget optionButtons(BuildContext context, String optionText) {
  return Container(
      width: (MediaQuery.of(context).size.width / 3) - 20,
      decoration: BoxDecoration(
        color: Colors.grey.shade800,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Center(child: Text(optionText)));
}

Widget movieTags(BuildContext context) {
  return Row(
    children: const [
      Text(
        "Superhero",
        style: TextStyle(color: Colors.grey),
      ),
      Gap(10),
      Text(
        "Action",
        style: TextStyle(color: Colors.grey),
      ),
      Gap(10),
      Text(
        "2008",
        style: TextStyle(color: Colors.grey),
      ),
      Gap(10),
      Text(
        "U/A 13+",
        style: TextStyle(color: Colors.grey),
      ),
    ],
  );
}

Widget movieWidget(BuildContext context) {
  final movieWidth = MediaQuery.of(context).size.width;
  final movieHeight = movieWidth * (198 / 353);
  return Stack(
    children: [
      ClipRRect(
        borderRadius: BorderRadius.circular(25),
        child: Image.asset(
          "assets/images/avengersbanner.png",
          width: movieWidth,
          height: movieHeight,
          fit: BoxFit.cover,
        ),
      ),
      Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          gradient: LinearGradient(
            colors: [Colors.transparent, Colors.black.withOpacity(.8)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        height: movieHeight,
        width: movieWidth,
      ),
      Positioned(
        top: 20,
        left: 15,
        child: GestureDetector(
          child: const Icon(Icons.arrow_back),
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ),
      Positioned(
          bottom: 20,
          left: 15,
          child: Row(
            children: const [
              Icon(
                Icons.play_arrow_rounded,
                size: 32,
              ),
              Gap(5),
              Text(
                "Watch Movie",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
              )
            ],
          )),
      const Positioned(
        top: 20,
        right: 15,
        child: Icon(
          Icons.add,
          size: 25,
        ),
      )
    ],
  );
}
