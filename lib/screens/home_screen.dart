import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newsapp/consts/vars.dart';
import 'package:newsapp/provider/dark_theme_provider.dart';
import 'package:newsapp/widgets/articles_widget.dart';
import 'package:newsapp/widgets/drawer_widget.dart';
import 'package:newsapp/widgets/loading_widget.dart';
import 'package:newsapp/widgets/tabs.dart';
import 'package:newsapp/widgets/top_trending.dart';
import 'package:newsapp/widgets/vertical_spacing.dart';
import 'package:provider/provider.dart';
import 'package:newsapp/services/utils.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var newsType = NewsType.allNews;
  int currentPageIndex = 0;
  String sortBy = SortByEnum.publishedAt.name;
  @override
  Widget build(BuildContext context) {
    Size size = Utils(context).getScreenSize;
    final themeProvider = Provider.of<DarkThemeProvider>(context);
    final Color color = Utils(context).getColor;

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
              onPressed: () {},
              icon: const Icon(IconlyLight.search),
            )
          ],
        ),
        drawer: const DrawerWidget(),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(children: [
            Row(
              children: [
                TabsWidget(
                    text: "All news",
                    color: newsType == NewsType.allNews
                        ? Theme.of(context).cardColor
                        : Colors.transparent,
                    function: () {
                      if (newsType == NewsType.allNews) {
                        return;
                      }
                      setState(() {
                        newsType = NewsType.allNews;
                      });
                    },
                    fontSize: newsType == NewsType.allNews ? 22 : 14),
                const SizedBox(
                  width: 25,
                ),
                TabsWidget(
                    text: "Top Trending",
                    color: newsType == NewsType.topTreanding
                        ? Theme.of(context).cardColor
                        : Colors.transparent,
                    function: () {
                      if (newsType == NewsType.topTreanding) {
                        return;
                      }
                      setState(() {
                        newsType = NewsType.topTreanding;
                      });
                    },
                    fontSize: newsType == NewsType.topTreanding ? 22 : 14)
              ],
            ),
            const VerticalSpacing(10),
            newsType == NewsType.topTreanding
                ? Container()
                : SizedBox(
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
            newsType == NewsType.topTreanding
                ? Container()
                : Align(
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
            if (newsType == NewsType.allNews)
              Expanded(
                child: ListView.builder(
                    itemCount: 20,
                    itemBuilder: (ctx, index) {
                      return const ArticleWidget();
                    }),
              ),
            if (newsType == NewsType.topTreanding)
              SizedBox(
                height: size.height * 0.45,
                child: Swiper(
                  autoplay: true,
                  autoplayDelay: 8000,
                  itemWidth: size.width * 0.9,
                  layout: SwiperLayout.STACK,
                  viewportFraction: 0.9,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return TopTrendingWidget();
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
