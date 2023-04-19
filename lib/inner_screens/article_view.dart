// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticleView extends StatefulWidget {
  String blogUrl;
  ArticleView({
    Key? key,
    required this.blogUrl,
  }) : super(key: key);

  @override
  State<ArticleView> createState() => _ArticleViewState();
}

class _ArticleViewState extends State<ArticleView> {
  @override
  Widget build(BuildContext context) {
    return Container(child: WebViewWidget(controller: WebViewController()));
  }
}
