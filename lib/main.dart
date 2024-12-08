import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shiroko/model/favorite_provider.dart';
import 'package:shiroko/screens/home_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => FavoriteProvider()),
      ],
      child: const MainApp(),
    ),
  );
}


class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shiroko',
      home: HomeScreen(),
    );
  }
}
