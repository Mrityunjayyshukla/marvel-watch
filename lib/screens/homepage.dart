import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:marvelwatch/utils/movie_lists.dart';
import 'package:marvelwatch/widgets/carousel_slider.dart';
import 'package:marvelwatch/widgets/horizontal_list.dart';
import '../widgets/custom_appbar.dart';

// Home Page is the page that shows
// at default when user opens the app
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Scroll Offset is used for the purpose
  // of opacity of App Bar
  // When scroll is at the top, opacity is 0%
  // While scrolling down, opacity increases till 100%
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
                  // Top Slider shows a carousel of randomly
                  // showing movies and TV Shows
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

                  // Recommended TV Shows and Movies
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
// Search Page uses a Delegate which contains 4 functions
// buildActions, buildLeading, buildResults, buildSuggestions
class DataSearch extends SearchDelegate {
  List<MovieModel> suggestionList = List.from(allShowsList);

  // This Function defines the layout of the Interface of the Search Page
  @override
  ThemeData appBarTheme(BuildContext context) {
    return Theme.of(context).copyWith(
      scaffoldBackgroundColor: Colors.black,
      appBarTheme: const AppBarTheme(color: Colors.black),
    );
  }

  // buildActions functions shows the action shown
  // when clear icon is clicked.
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = "";
          },
          icon: const Icon(Icons.clear))
    ];
  }

  // buildLeading functions initializes the icon to
  // left of search panel. When clicked, it sets to homepage.
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

  // buildResults function shows the result when the search
  // result is clicked.
  @override
  Widget buildResults(BuildContext context) {
    // show some results based on the selection
    return Container();
  }

  // buildSuggestions shows the result when some text is
  // typed in the search panel. The search result is based
  // on what is searched on the search panel
  @override
  Widget buildSuggestions(BuildContext context) {
    // show when someone searches for something.
    // The Search result shows Movie Name, Movie Poster,
    // Movie Release Year and IMDB rating
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
