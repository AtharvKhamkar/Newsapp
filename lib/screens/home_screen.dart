import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newsapp/consts/vars.dart';
import 'package:newsapp/inner_screens/search_screen.dart';
import 'package:newsapp/models/businessModel.dart';
import 'package:newsapp/models/generalModel.dart';
import 'package:newsapp/models/healthModel.dart';
import 'package:newsapp/models/scienceModel.dart';
import 'package:newsapp/models/sportModel.dart';
import 'package:newsapp/models/technologyModel.dart';
import 'package:newsapp/provider/dark_theme_provider.dart';
import 'package:newsapp/services/states_services.dart';
import 'package:newsapp/widgets/articles_widget.dart';
import 'package:newsapp/widgets/drawer_widget.dart';
import 'package:newsapp/widgets/loading_widget.dart';
import 'package:newsapp/widgets/tabs.dart';
import 'package:newsapp/widgets/top_trending.dart';
import 'package:newsapp/widgets/vertical_spacing.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:newsapp/services/utils.dart';
import 'package:shimmer/shimmer.dart';
import 'package:newsapp/models/entertainmentModel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var newsType = NewsType.Business;

  int currentPageIndex = 0;
  String sortBy = SortByEnum.publishedAt.name;
  @override
  Widget build(BuildContext context) {
    Size size = Utils(context).getScreenSize;
    final themeProvider = Provider.of<DarkThemeProvider>(context);
    final Color color = Utils(context).getColor;
    StatesServices statesServices = StatesServices();

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          iconTheme: IconThemeData(color: color),
          centerTitle: true,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          title: Text(
            "News app",
            style: GoogleFonts.lobster(
              textStyle:
                  TextStyle(fontSize: 20, letterSpacing: 0.6, color: color),
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    PageTransition(
                        type: PageTransitionType.rightToLeft,
                        child: SearchScreen(),
                        inheritTheme: true,
                        ctx: context));
              },
              icon: const Icon(IconlyLight.search),
            )
          ],
        ),
        drawer: const DrawerWidget(),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  TabsWidget(
                      text: "Business",
                      color: newsType == NewsType.Business
                          ? Theme.of(context).cardColor
                          : Colors.transparent,
                      function: () {
                        if (newsType == NewsType.Business) {
                          return;
                        }
                        setState(() {
                          newsType = NewsType.Business;
                        });
                      },
                      fontSize: newsType == NewsType.Business ? 22 : 14),
                  const SizedBox(
                    width: 25,
                  ),
                  TabsWidget(
                      text: "Entertainment",
                      color: newsType == NewsType.Entertainment
                          ? Theme.of(context).cardColor
                          : Colors.transparent,
                      function: () {
                        if (newsType == NewsType.Entertainment) {
                          return;
                        }
                        setState(() {
                          newsType = NewsType.Entertainment;
                        });
                      },
                      fontSize: newsType == NewsType.Entertainment ? 22 : 14),
                  TabsWidget(
                      text: "General",
                      color: newsType == NewsType.General
                          ? Theme.of(context).cardColor
                          : Colors.transparent,
                      function: () {
                        if (newsType == NewsType.General) {
                          return;
                        }
                        setState(() {
                          newsType = NewsType.General;
                        });
                      },
                      fontSize: newsType == NewsType.General ? 22 : 14),
                  TabsWidget(
                      text: "Health",
                      color: newsType == NewsType.Health
                          ? Theme.of(context).cardColor
                          : Colors.transparent,
                      function: () {
                        if (newsType == NewsType.Health) {
                          return;
                        }
                        setState(() {
                          newsType = NewsType.Health;
                        });
                      },
                      fontSize: newsType == NewsType.Health ? 22 : 14),
                  TabsWidget(
                      text: "Science",
                      color: newsType == NewsType.Science
                          ? Theme.of(context).cardColor
                          : Colors.transparent,
                      function: () {
                        if (newsType == NewsType.Science) {
                          return;
                        }
                        setState(() {
                          newsType = NewsType.Science;
                        });
                      },
                      fontSize: newsType == NewsType.Science ? 22 : 14),
                  TabsWidget(
                      text: "Sports",
                      color: newsType == NewsType.Sport
                          ? Theme.of(context).cardColor
                          : Colors.transparent,
                      function: () {
                        if (newsType == NewsType.Sport) {
                          return;
                        }
                        setState(() {
                          newsType = NewsType.Sport;
                        });
                      },
                      fontSize: newsType == NewsType.Sport ? 22 : 14),
                  TabsWidget(
                      text: "Technology",
                      color: newsType == NewsType.Technology
                          ? Theme.of(context).cardColor
                          : Colors.transparent,
                      function: () {
                        if (newsType == NewsType.Technology) {
                          return;
                        }
                        setState(() {
                          newsType = NewsType.Technology;
                        });
                      },
                      fontSize: newsType == NewsType.Technology ? 22 : 14)
                ],
              ),
            ),
            const VerticalSpacing(10),
            SizedBox(
              height: kBottomNavigationBarHeight,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  PaginationButtons(
                      function: () {
                        if (currentPageIndex == 0) {
                          return;
                        }
                        setState(() {
                          currentPageIndex -= 1;
                        });
                      },
                      text: "Prev"),
                  Flexible(
                    flex: 2,
                    child: ListView.builder(
                        itemCount: 5,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: ((context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Material(
                              color: currentPageIndex == index
                                  ? Colors.blue
                                  : Theme.of(context).cardColor,
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    currentPageIndex = index;
                                  });
                                },
                                child: Center(
                                    child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text("${index + 1}"),
                                )),
                              ),
                            ),
                          );
                        })),
                  ),
                  PaginationButtons(
                      function: () {
                        setState(() {
                          if (currentPageIndex == 4) {
                            return;
                          }
                          currentPageIndex += 1;
                        });
                        print('$currentPageIndex index');
                      },
                      text: "Next")
                ],
              ),
            ),
            const VerticalSpacing(10),
            Align(
              alignment: Alignment.topRight,
              child: Material(
                color: Theme.of(context).cardColor,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: DropdownButton(
                      value: sortBy,
                      items: dropDownItems,
                      onChanged: (String? value) {}),
                ),
              ),
            ),
            if (newsType == NewsType.Business)
              Expanded(
                child: FutureBuilder(
                  future: statesServices.fetchBusinessNews(),
                  builder: (context, AsyncSnapshot<businessModel> snapshot) {
                    if (!snapshot.hasData) {
                      return ListView.builder(
                          itemCount: 4,
                          itemBuilder: (context, index) {
                            return Shimmer.fromColors(
                              baseColor: Colors.grey.shade700,
                              highlightColor: Colors.grey.shade100,
                              child: Column(
                                children: [
                                  ListTile(
                                    title: Container(
                                        height: 10,
                                        width: 90,
                                        color: Colors.white),
                                    subtitle: Container(
                                        height: 10,
                                        width: 20,
                                        color: Colors.white),
                                    leading: Container(
                                        height: 50,
                                        width: 50,
                                        color: Colors.white),
                                  )
                                ],
                              ),
                            );
                          });
                    } else {
                      return ListView.builder(
                          itemCount: snapshot.data!.totalResults,
                          itemBuilder: (context, index) {
                            return ArticleWidget(
                              imageUrl: snapshot
                                  .data!.articles![index].urlToImage
                                  .toString(),
                              title: snapshot.data!.articles![index].title
                                  .toString(),
                              publishedAt: snapshot
                                  .data!.articles![index].publishedAt
                                  .toString(),
                              url: snapshot.data!.articles![index].url
                                  .toString(),
                            );
                          });
                    }
                  },
                ),
              ),
            if (newsType == NewsType.Entertainment)
              Expanded(
                child: FutureBuilder(
                  future: statesServices.fetchEntertainmentNews(),
                  builder:
                      (context, AsyncSnapshot<entertainmentModel> snapshot) {
                    if (!snapshot.hasData) {
                      return ListView.builder(
                          itemCount: 4,
                          itemBuilder: (context, index) {
                            return Shimmer.fromColors(
                              baseColor: Colors.grey.shade700,
                              highlightColor: Colors.grey.shade100,
                              child: Column(
                                children: [
                                  ListTile(
                                    title: Container(
                                        height: 10,
                                        width: 90,
                                        color: Colors.white),
                                    subtitle: Container(
                                        height: 10,
                                        width: 20,
                                        color: Colors.white),
                                    leading: Container(
                                        height: 50,
                                        width: 50,
                                        color: Colors.white),
                                  )
                                ],
                              ),
                            );
                          });
                    } else {
                      return ListView.builder(
                          itemCount: snapshot.data!.totalResults,
                          itemBuilder: (context, index) {
                            return ArticleWidget(
                              imageUrl: snapshot
                                  .data!.articles![index].urlToImage
                                  .toString(),
                              title: snapshot.data!.articles![index].title
                                  .toString(),
                              publishedAt: snapshot
                                  .data!.articles![index].publishedAt
                                  .toString(),
                              url: snapshot.data!.articles![index].url
                                  .toString(),
                            );
                          });
                    }
                  },
                ),
              ),
            if (newsType == NewsType.General)
              Expanded(
                child: FutureBuilder(
                  future: statesServices.fetchGeneralNews(),
                  builder: (context, AsyncSnapshot<generalModel> snapshot) {
                    if (!snapshot.hasData) {
                      return ListView.builder(
                          itemCount: 4,
                          itemBuilder: (context, index) {
                            return Shimmer.fromColors(
                              baseColor: Colors.grey.shade700,
                              highlightColor: Colors.grey.shade100,
                              child: Column(
                                children: [
                                  ListTile(
                                    title: Container(
                                        height: 10,
                                        width: 90,
                                        color: Colors.white),
                                    subtitle: Container(
                                        height: 10,
                                        width: 20,
                                        color: Colors.white),
                                    leading: Container(
                                        height: 50,
                                        width: 50,
                                        color: Colors.white),
                                  )
                                ],
                              ),
                            );
                          });
                    } else {
                      return ListView.builder(
                          itemCount: snapshot.data!.totalResults,
                          itemBuilder: (context, index) {
                            return ArticleWidget(
                              imageUrl: snapshot
                                  .data!.articles![index].urlToImage
                                  .toString(),
                              title: snapshot.data!.articles![index].title
                                  .toString(),
                              publishedAt: snapshot
                                  .data!.articles![index].publishedAt
                                  .toString(),
                              url: snapshot.data!.articles![index].url
                                  .toString(),
                            );
                          });
                    }
                  },
                ),
              ),
            if (newsType == NewsType.Health)
              Expanded(
                child: FutureBuilder(
                  future: statesServices.fetchHealthNews(),
                  builder: (context, AsyncSnapshot<healthModel> snapshot) {
                    if (!snapshot.hasData) {
                      return ListView.builder(
                          itemCount: 4,
                          itemBuilder: (context, index) {
                            return Shimmer.fromColors(
                              baseColor: Colors.grey.shade700,
                              highlightColor: Colors.grey.shade100,
                              child: Column(
                                children: [
                                  ListTile(
                                    title: Container(
                                        height: 10,
                                        width: 90,
                                        color: Colors.white),
                                    subtitle: Container(
                                        height: 10,
                                        width: 20,
                                        color: Colors.white),
                                    leading: Container(
                                        height: 50,
                                        width: 50,
                                        color: Colors.white),
                                  )
                                ],
                              ),
                            );
                          });
                    } else {
                      return ListView.builder(
                          itemCount: snapshot.data!.totalResults,
                          itemBuilder: (context, index) {
                            return ArticleWidget(
                              imageUrl: snapshot
                                  .data!.articles![index].urlToImage
                                  .toString(),
                              title: snapshot.data!.articles![index].title
                                  .toString(),
                              publishedAt: snapshot
                                  .data!.articles![index].publishedAt
                                  .toString(),
                              url: snapshot.data!.articles![index].url
                                  .toString(),
                            );
                          });
                    }
                  },
                ),
              ),
            if (newsType == NewsType.Science)
              Expanded(
                child: FutureBuilder(
                  future: statesServices.fetchScienceNews(),
                  builder: (context, AsyncSnapshot<scienceModel> snapshot) {
                    if (!snapshot.hasData) {
                      return ListView.builder(
                          itemCount: 4,
                          itemBuilder: (context, index) {
                            return Shimmer.fromColors(
                              baseColor: Colors.grey.shade700,
                              highlightColor: Colors.grey.shade100,
                              child: Column(
                                children: [
                                  ListTile(
                                    title: Container(
                                        height: 10,
                                        width: 90,
                                        color: Colors.white),
                                    subtitle: Container(
                                        height: 10,
                                        width: 20,
                                        color: Colors.white),
                                    leading: Container(
                                        height: 50,
                                        width: 50,
                                        color: Colors.white),
                                  )
                                ],
                              ),
                            );
                          });
                    } else {
                      return ListView.builder(
                          itemCount: snapshot.data!.totalResults,
                          itemBuilder: (context, index) {
                            return ArticleWidget(
                              imageUrl: snapshot
                                  .data!.articles![index].urlToImage
                                  .toString(),
                              title: snapshot.data!.articles![index].title
                                  .toString(),
                              publishedAt: snapshot
                                  .data!.articles![index].publishedAt
                                  .toString(),
                              url: snapshot.data!.articles![index].url
                                  .toString(),
                            );
                          });
                    }
                  },
                ),
              ),
            if (newsType == NewsType.Sport)
              Expanded(
                child: FutureBuilder(
                  future: statesServices.fetchSportNews(),
                  builder: (context, AsyncSnapshot<sportModel> snapshot) {
                    if (!snapshot.hasData) {
                      return ListView.builder(
                          itemCount: 4,
                          itemBuilder: (context, index) {
                            return Shimmer.fromColors(
                              baseColor: Colors.grey.shade700,
                              highlightColor: Colors.grey.shade100,
                              child: Column(
                                children: [
                                  ListTile(
                                    title: Container(
                                        height: 10,
                                        width: 90,
                                        color: Colors.white),
                                    subtitle: Container(
                                        height: 10,
                                        width: 20,
                                        color: Colors.white),
                                    leading: Container(
                                        height: 50,
                                        width: 50,
                                        color: Colors.white),
                                  )
                                ],
                              ),
                            );
                          });
                    } else {
                      return ListView.builder(
                          itemCount: snapshot.data!.totalResults,
                          itemBuilder: (context, index) {
                            return ArticleWidget(
                              imageUrl: snapshot
                                  .data!.articles![index].urlToImage
                                  .toString(),
                              title: snapshot.data!.articles![index].title
                                  .toString(),
                              publishedAt: snapshot
                                  .data!.articles![index].publishedAt
                                  .toString(),
                              url: snapshot.data!.articles![index].url
                                  .toString(),
                            );
                          });
                    }
                  },
                ),
              ),
            if (newsType == NewsType.Technology)
              Expanded(
                child: FutureBuilder(
                  future: statesServices.fetchTechnologyNews(),
                  builder: (context, AsyncSnapshot<technologyModel> snapshot) {
                    if (!snapshot.hasData) {
                      return ListView.builder(
                          itemCount: 4,
                          itemBuilder: (context, index) {
                            return Shimmer.fromColors(
                              baseColor: Colors.grey.shade700,
                              highlightColor: Colors.grey.shade100,
                              child: Column(
                                children: [
                                  ListTile(
                                    title: Container(
                                        height: 10,
                                        width: 90,
                                        color: Colors.white),
                                    subtitle: Container(
                                        height: 10,
                                        width: 20,
                                        color: Colors.white),
                                    leading: Container(
                                        height: 50,
                                        width: 50,
                                        color: Colors.white),
                                  )
                                ],
                              ),
                            );
                          });
                    } else {
                      return ListView.builder(
                          itemCount: snapshot.data!.totalResults,
                          itemBuilder: (context, index) {
                            return ArticleWidget(
                              imageUrl: snapshot
                                  .data!.articles![index].urlToImage
                                  .toString(),
                              title: snapshot.data!.articles![index].title
                                  .toString(),
                              publishedAt: snapshot
                                  .data!.articles![index].publishedAt
                                  .toString(),
                              url: snapshot.data!.articles![index].url
                                  .toString(),
                            );
                          });
                    }
                  },
                ),
              )
          ]),
        ),
      ),
    );
  }

  List<DropdownMenuItem<String>> get dropDownItems {
    List<DropdownMenuItem<String>> menuItem = [
      DropdownMenuItem(
        value: SortByEnum.relvancy.name,
        child: Text(SortByEnum.relvancy.name),
      ),
      DropdownMenuItem(
        value: SortByEnum.publishedAt.name,
        child: Text(SortByEnum.publishedAt.name),
      ),
      DropdownMenuItem(
        value: SortByEnum.popularity.name,
        child: Text(SortByEnum.popularity.name),
      )
    ];
    return menuItem;
  }

  Widget PaginationButtons({required Function function, required String text}) {
    return ElevatedButton(
      onPressed: () {
        function();
      },
      child: Text(text),
      style: ElevatedButton.styleFrom(
          primary: Colors.blue,
          padding: const EdgeInsets.all(6),
          textStyle:
              const TextStyle(fontSize: 18, fontWeight: FontWeight.w400)),
    );
  }
}
