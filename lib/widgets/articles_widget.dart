import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:newsapp/services/utils.dart';

class ArticleWidget extends StatelessWidget {
  const ArticleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = utils(context).getScreenSize;
    return Container(
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
              imageUrl:
                  "https://thumbor.forbes.com/thumbor/fit-in/900x510/https://www.forbes.com/uk/advisor/wp-content/uploads/2020/11/phones-switch-apps.jpg"),
        )
      ]),
    );
  }
}
