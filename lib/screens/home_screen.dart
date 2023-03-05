import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newsapp/consts/vars.dart';
import 'package:newsapp/provider/dark_theme_provider.dart';
import 'package:newsapp/widgets/drawer_widget.dart';
import 'package:newsapp/widgets/tabs.dart';
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
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<DarkThemeProvider>(context);
    final Color color = utils(context).getColor;

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
                        PaginationButtons(function: () {}, text: "Prev"),
                        PaginationButtons(function: () {}, text: "Next")
                      ],
                    ),
                  )
          ]),
        ),
      ),
    );
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
