import 'package:flutter/material.dart';
import 'package:shiroko/components/adopt_button.dart';
import 'package:shiroko/components/favorite_button.dart';
import 'package:shiroko/model/model_cute_cat.dart';

class DetailMobilePage extends StatefulWidget {
  final CuteCat cuteCat;

  const DetailMobilePage({super.key, required this.cuteCat});

  @override
  _DetailMobilePageState createState() => _DetailMobilePageState();
}

class _DetailMobilePageState extends State<DetailMobilePage> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Cat Information',
          style: TextStyle(fontFamily: 'PlusJakartaSans', color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFF028583),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 70.0),
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: const Color(0xFFF1FFFF),
                          width: 5.0,
                        ),
                      ),
                      child: ClipOval(
                        child: AspectRatio(
                          aspectRatio: 1,
                          child: Image.asset(
                            widget.cuteCat.picture,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  Text(
                    widget.cuteCat.name.toUpperCase(),
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'PlusJakartaSans',
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  Text(
                    widget.cuteCat.personalityTraits,
                    style: const TextStyle(
                      fontSize: 12,
                      fontFamily: 'PlusJakartaSans',
                    ),
                    textAlign: TextAlign.left,
                  ),
                  const SizedBox(height: 24.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(16.0),
                            decoration: const BoxDecoration(
                              color: Color(0xFFF1FFFF),
                              shape: BoxShape.circle,
                            ),
                            child: Image.asset(
                              'assets/images/ic_cat.png',
                              color: const Color(0xFF028583),
                              width: 24.0,
                              height: 24.0,
                            ),
                          ),
                          const SizedBox(height: 10.0),
                          Text(
                            '${widget.cuteCat.age} years',
                            style: const TextStyle(
                              fontSize: 14,
                              fontFamily: 'PlusJakartaSans',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 5.0),
                          const Text(
                            "Age",
                            style: TextStyle(
                              fontSize: 12,
                              fontFamily: 'PlusJakartaSans',
                              color: Colors.black38,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(width: 42.0),
                      Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(16.0),
                            decoration: const BoxDecoration(
                              color: Color(0xFFF1FFFF),
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.location_on,
                              color: Color(0xFF028583),
                              size: 24.0,
                            ),
                          ),
                          const SizedBox(height: 10.0),
                          Text(
                            widget.cuteCat.location,
                            style: const TextStyle(
                              fontSize: 15,
                              fontFamily: 'PlusJakartaSans',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 5.0),
                          const Text(
                            "Location",
                            style: TextStyle(
                              fontSize: 12,
                              fontFamily: 'PlusJakartaSans',
                              color: Colors.black38,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(width: 42.0),
                      Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(16.0),
                            decoration: const BoxDecoration(
                              color: Color(0xFFF1FFFF),
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              widget.cuteCat.gender == 'Male'
                                  ? Icons.male
                                  : Icons.female,
                              color: const Color(0xFF028583),
                              size: 24.0,
                            ),
                          ),
                          const SizedBox(height: 10.0),
                          Text(
                            widget.cuteCat.gender,
                            style: const TextStyle(
                              fontSize: 14,
                              fontFamily: 'PlusJakartaSans',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 5.0),
                          const Text(
                            "Gender",
                            style: TextStyle(
                              fontSize: 12,
                              fontFamily: 'PlusJakartaSans',
                              color: Colors.black38,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 24.0),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Unique Value",
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: 'PlusJakartaSans',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      widget.cuteCat.uniqueValue,
                      style: const TextStyle(
                        fontSize: 12,
                        fontFamily: 'PlusJakartaSans',
                      ),
                    ),
                  ),
                  const SizedBox(height: 24.0),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Cat Description",
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: 'PlusJakartaSans',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      widget.cuteCat.description,
                      textAlign: TextAlign.justify,
                      style: const TextStyle(
                        fontSize: 12,
                        fontFamily: 'PlusJakartaSans',
                        height: 2.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FavoriteButton(cuteCat: widget.cuteCat),
                const SizedBox(width: 16.0),
                Expanded(child: AdoptButton(catName: widget.cuteCat.name)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
