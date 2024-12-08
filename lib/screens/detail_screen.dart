import 'package:flutter/material.dart';
import 'package:shiroko/page/detail_mobile_page.dart';
import 'package:shiroko/page/detail_web_page.dart';
import 'package:shiroko/model/model_cute_cat.dart';

class DetailScreen extends StatelessWidget {
  final CuteCat cuteCat;

  const DetailScreen({super.key, required this.cuteCat});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constrains) {
        if (constrains.maxWidth > 800) {
          return DetailWebPage(cuteCat: cuteCat);
        } else {
          return DetailMobilePage(cuteCat: cuteCat);
        }
      },
    );
  }
}