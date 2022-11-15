import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:marvelwatch/utils/movie_lists.dart';
import 'package:marvelwatch/widgets/carousel_slider.dart';
import 'package:marvelwatch/widgets/horizontal_list.dart';
import '../widgets/custom_appbar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late ScrollController _scrollController;
  double _scrollOffset = 0.0;

  _scrollListener() {
    setState(() {
      _scrollOffset = _scrollController.offset;
    });
  }

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.black,
      appBar: PreferredSize(
        preferredSize: Size(screenSize.width, 70.0),
        child: CustomAppBar(scrollOffset: _scrollOffset),
      ),

      // body
      body: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          controller: _scrollController,
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const TopSlider(),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      "Movies And Shows",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const Gap(25),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      "Recommended For You",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff8b8b8b),
                      ),
                    ),
                  ),
                  const Gap(20),
                  HorizontalScroll(scrolllist: recommendedForYou),
                  const Gap(40),

                  // Avengers Assemble
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      "Avengers Assemble",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff8b8b8b),
                      ),
                    ),
                  ),
                  const Gap(20),
                  AvengersScroll(avengersScroll: avengersAssemble),
                  const Gap(40),

                  // SpiderVerse
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      "Welcome to Spider-Verse",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff8b8b8b),
                      ),
                    ),
                  ),
                  const Gap(20),
                  HorizontalScroll(scrolllist: spiderVerse),
                  const Gap(40),

                  // Defenders Saga
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      "Defenders Saga",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff8b8b8b),
                      ),
                    ),
                  ),
                  const Gap(20),
                  HorizontalScroll(scrolllist: defenderSaga),
                  const Gap(40),

                  // Avengers Assemble
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      "X-Men Movies",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff8b8b8b),
                      ),
                    ),
                  ),
                  const Gap(20),
                  HorizontalScroll(scrolllist: xmen),
                  const Gap(40),
                ],
              ),
            ),
          ]),
    );
  }
}

// Search Page

class DataSearch extends SearchDelegate {
  List<MovieModel> suggestionList = List.from(allShowsList);
  @override
  ThemeData appBarTheme(BuildContext context) {
    return Theme.of(context).copyWith(
      scaffoldBackgroundColor: Colors.black,
      appBarTheme: const AppBarTheme(color: Colors.black),
    );
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    // actions for app bar
    return [
      IconButton(
          onPressed: () {
            query = "";
          },
          icon: const Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    // leading icon on the left of the app bar
    return IconButton(
        onPressed: () {
          close(context, "");
        },
        icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow,
          progress: transitionAnimation,
        ));
  }

  @override
  Widget buildResults(BuildContext context) {
    // show some results based on the selection
    return const Center(
      child: Text("Marvel Studios"),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // show when someone searches for something
    final suggestionList = query.isEmpty
        ? recommendedInSearch
        : allShowsList
            .where((element) => element.movie_name
                .toString()
                .toLowerCase()
                .contains(query.toLowerCase()))
            .toList();
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Gap(10),
          SizedBox(
            height: 440,
            child: ListView.builder(
              itemBuilder: (context, index) => ListTile(
                onTap: () {
                  showResults(context);
                },
                leading: Image(
                    image: AssetImage(suggestionList[index].movie_poster)),
                title: Text(suggestionList[index].movie_name),
                subtitle: Text("${suggestionList[index].movie_year}"),
                trailing: Text(
                  "${suggestionList[index].movie_rating}",
                  style: const TextStyle(color: Colors.amber),
                ),
              ),
              itemCount: suggestionList.length,
            ),
          ),

          // Recent Search
          const Gap(40),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              "Recent Searches",
              style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w400),
            ),
          ),
          const Gap(25),
          HorizontalScroll(scrolllist: recentSearches),

          // Popular Grid
          const Gap(40),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              "Popular",
              style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w400),
            ),
          ),
          const Gap(25),
          HorizontalScroll(scrolllist: popularGrid),
          const Gap(40),
        ],
      ),
    );
  }
}
