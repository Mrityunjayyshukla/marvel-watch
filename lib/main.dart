import 'package:custom_floating_action_button/custom_floating_action_button.dart';
import 'package:flutter/material.dart';
import 'package:marvelwatch/screens/account_page.dart';
import 'package:marvelwatch/screens/homepage.dart';
import 'package:marvelwatch/screens/movies_and_shows.dart';

void main() {
  runApp(const MarvelWatch());
}

class MarvelWatch extends StatelessWidget {
  const MarvelWatch({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Marvel-Watch",
      theme: ThemeData(brightness: Brightness.dark),
      debugShowCheckedModeBanner: false,
      home: const MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return CustomFloatingActionButton(
      body: const Scaffold(
        backgroundColor: Colors.black,
        body: HomePage(),
      ),
      options: [
        Row(
          children: [
            const Text("Settings"),
            IconButton(
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AccountPage())),
                icon: const Icon(
                  Icons.account_circle,
                  size: 28,
                )),
          ],
        ),
        Row(
          children: [
            const Text("Search"),
            IconButton(
                onPressed: () =>
                    showSearch(context: context, delegate: DataSearch()),
                icon: const Icon(
                  Icons.search,
                  size: 28,
                )),
          ],
        ),
        Row(
          children: [
            const Text("Movies And TV Shows"),
            IconButton(
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const MoviesAndShows())),
                icon: const Icon(
                  Icons.movie,
                  size: 28,
                )),
          ],
        ),
      ],
      type: CustomFloatingActionButtonType.verticalUp,
      openFloatingActionButton: const Icon(Icons.menu),
      closeFloatingActionButton: const Icon(Icons.close),
      floatinButtonColor: Colors.black,
      spaceFromBottom: 15,
      spaceFromRight: 15,
    );
  }
}
