// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:newsapp/inner_screens/article_view.dart';
import 'package:page_transition/page_transition.dart';

import 'package:newsapp/consts/vars.dart';
import 'package:newsapp/inner_screens/news_details_webview.dart';
import 'package:newsapp/services/utils.dart';
import 'package:newsapp/widgets/vertical_spacing.dart';

class ArticleWidget extends StatelessWidget {
  String imageUrl;
  String title;
  String publishedAt;
  String url;
  ArticleWidget({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.publishedAt,
    required this.url,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = Utils(context).getScreenSize;
    var height = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        color: Theme.of(context).cardColor,
        child: InkWell(
          onTap: () {},
          child: Stack(
            children: [
              Container(
                height: 60,
                width: 60,
                color: Theme.of(context).colorScheme.secondary,
              ),
              Positioned(
                right: 0,
                bottom: 0,
                child: Container(
                  height: 60,
                  width: 60,
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
              Container(
                color: Theme.of(context).cardColor,
                padding: const EdgeInsets.all(10.0),
                margin: const EdgeInsets.all(10.0),
                child: Row(children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: FancyShimmerImage(
                        height: size.height * 0.12,
                        width: size.height * 0.12,
                        boxFit: BoxFit.fill,
                        imageUrl: imageUrl),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(title,
                              textAlign: TextAlign.justify,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: smallTextStyle),
                          const VerticalSpacing(5),
                          FittedBox(
                            child: Row(
                              children: [
                                IconButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        PageTransition(
                                            type:
                                                PageTransitionType.rightToLeft,
                                            child: NewsDetailsWebView(
                                              webLink: url,
                                            ),
                                            inheritTheme: true,
                                            ctx: context));
                                  },
                                  icon: Icon(
                                    Icons.link_outlined,
                                    color: Colors.blue,
                                  ),
                                ),
                                Text(publishedAt, style: smallTextStyle)
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
