import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newsapp/inner_screens/bookmarks_screen.dart';
import 'package:newsapp/provider/dark_theme_provider.dart';
import 'package:newsapp/widgets/vertical_spacing.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({super.key});

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<DarkThemeProvider>(context);
    return Drawer(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      child: ListView(children: [
        DrawerHeader(
          decoration: BoxDecoration(color: Theme.of(context).primaryColor),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                child: Image.asset(
                  'assets/images/newspaper.png',
                  height: 60,
                  width: 60,
                ),
              ),
              VerticalSpacing(20),
              Flexible(
                child: Text(
                  "News app",
                  style: GoogleFonts.lobster(
                      textStyle: TextStyle(fontSize: 20, letterSpacing: 0.6)),
                ),
              ),
            ],
          ),
        ),
        VerticalSpacing(20),
        ListTilesWidget(
          label: "Home",
          icon: IconlyBold.home,
          fct: () {},
        ),
        ListTilesWidget(
          label: "Bookmark",
          icon: IconlyBold.bookmark,
          fct: () {
            Navigator.push(
                context,
                PageTransition(
                    type: PageTransitionType.rightToLeft,
                    child: BookmarkScreen(),
                    inheritTheme: true,
                    ctx: context));
          },
        ),
        Divider(
          thickness: 5,
        ),
        SwitchListTile(
          title: Text(
            themeProvider.getDarkTheme ? 'Dark' : 'Light',
            style: TextStyle(fontSize: 20),
          ),
          secondary: Icon(
            themeProvider.getDarkTheme
                ? Icons.dark_mode_rounded
                : Icons.light_mode_outlined,
            color: Theme.of(context).colorScheme.secondary,
          ),
          onChanged: (bool value) {
            setState(() {
              themeProvider.setDarkTheme = value;
            });
          },
          value: themeProvider.getDarkTheme,
        ),
      ]),
    );
  }
}

class ListTilesWidget extends StatelessWidget {
  const ListTilesWidget({
    super.key,
    required this.label,
    required this.fct,
    required this.icon,
  });
  final String label;
  final Function fct;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        color: Theme.of(context).colorScheme.secondary,
      ),
      title: Text(
        label,
        style: TextStyle(fontSize: 20),
      ),
      onTap: () {
        fct();
      },
    );
  }
}
