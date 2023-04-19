import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:newsapp/consts/vars.dart';
import 'package:newsapp/services/utils.dart';
import 'package:newsapp/widgets/empty_screen.dart';
import 'package:newsapp/widgets/vertical_spacing.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late final TextEditingController _searchTextEditingController;
  late final FocusNode focusNode;
  @override
  void initState() {
    _searchTextEditingController = TextEditingController();
    focusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    if (mounted) {
      _searchTextEditingController.dispose();
      focusNode.dispose();
    }
    super.dispose();
  }

  Widget build(BuildContext context) {
    Size size = Utils(context).getScreenSize;
    final Color color = Utils(context).getColor;

    return SafeArea(
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
            body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      focusNode.unfocus();
                      Navigator.pop(context);
                    },
                    child: const Icon(IconlyLight.arrowLeft2),
                  ),
                  Flexible(
                    child: TextField(
                      focusNode: focusNode,
                      controller: _searchTextEditingController,
                      style: TextStyle(color: color),
                      autofocus: true,
                      textInputAction: TextInputAction.search,
                      keyboardType: TextInputType.text,
                      onEditingComplete: () {},
                      decoration: InputDecoration(
                          contentPadding: const EdgeInsets.only(bottom: 8 / 5),
                          hintText: "Search",
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          suffix: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(
                              onTap: () {
                                _searchTextEditingController.clear();
                                focusNode.unfocus();
                                setState(() {});
                              },
                              child: const Icon(
                                IconlyLight.closeSquare,
                                size: 24,
                                color: Colors.black,
                              ),
                            ),
                          )),
                    ),
                  ),
                ],
              ),
            ),
            VerticalSpacing(20),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: MasonryGridView.count(
                  itemCount: searchkeyWords.length,
                  crossAxisCount: 4,
                  mainAxisSpacing: 4,
                  crossAxisSpacing: 4,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      child: Container(
                        margin: EdgeInsets.all(4.0),
                        decoration: BoxDecoration(
                            border: Border.all(color: color),
                            borderRadius: BorderRadius.circular(30)),
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            searchkeyWords[index],
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            EmptyNewsWidget(text: "Ops! No result found", imagePath:"assets/images/search.png" )
          ],
        )),
      ),
    );
  }
}
