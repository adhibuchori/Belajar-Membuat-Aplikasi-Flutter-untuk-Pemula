import 'package:flutter/material.dart';
import 'package:shiroko/components/card_cute_cat.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Scaffold(
          appBar: AppBar(
            leading: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Image.asset(
                'assets/images/shiroko_app_logo.png',
                fit: BoxFit.contain,
              ),
            ),
            title: const Text(
              'Shiroko',
              style:
                  TextStyle(fontFamily: 'PlusJakartaSans', color: Colors.white),
            ),
            centerTitle: true,
            backgroundColor: const Color(0xFF028583),
          ),
          body: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              final gridCount =
                  (constraints.maxWidth / 200).floor().clamp(2, 10);
              return CuteCatGrid(gridCount: gridCount);
            },
          ),
        );
      },
    );
  }
}
