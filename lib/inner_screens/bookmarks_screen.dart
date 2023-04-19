import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newsapp/services/utils.dart';
import 'package:newsapp/widgets/articles_widget.dart';
import 'package:newsapp/widgets/empty_screen.dart';
import 'package:page_transition/page_transition.dart';

class BookmarkScreen extends StatefulWidget {
  const BookmarkScreen({super.key});

  @override
  State<BookmarkScreen> createState() => _BookmarkScreenState();
}

class _BookmarkScreenState extends State<BookmarkScreen> {
  @override
  Widget build(BuildContext context) {
    final Color color = Utils(context).getColor;
    Size size = Utils(context).getScreenSize;
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          iconTheme: IconThemeData(color: color),
          centerTitle: true,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          title: Text(
            "Bookmarks",
            style: GoogleFonts.lobster(
              textStyle:
                  TextStyle(fontSize: 20, letterSpacing: 0.6, color: color),
            ),
          ),
        ),
        body: EmptyNewsWidget(
            text: "You did\'t add anything yet to your bokmarks",
            imagePath: "assets/images/bookmark.png")

        // ListView.builder(
        //     itemCount: 20,
        //     itemBuilder: (ctx, index) {
        //       return const ArticleWidget();
        //     }), 
        );
  }
}
