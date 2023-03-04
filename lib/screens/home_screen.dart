import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newsapp/provider/dark_theme_provider.dart';
import 'package:newsapp/widgets/drawer_widget.dart';
import 'package:provider/provider.dart';
import 'package:newsapp/services/utils.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
              icon: Icon(IconlyLight.search),
            )
          ],
        ),
        drawer: DrawerWidget(),
        body: Center(child: Container()),
      ),
    );
  }
}
