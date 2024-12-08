import 'package:flutter/material.dart';
import 'package:shiroko/components/adopt_button.dart';
import 'package:shiroko/components/favorite_button.dart';
import 'package:shiroko/model/model_cute_cat.dart';

class DetailWebPage extends StatefulWidget {
  final CuteCat cuteCat;

  const DetailWebPage({super.key, required this.cuteCat});

  @override
  _DetailWebPageState createState() => _DetailWebPageState();
}

class _DetailWebPageState extends State<DetailWebPage> {
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
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.all(48.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
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
                          fontSize: 16,
                          fontFamily: 'PlusJakartaSans',
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 32.0),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            _buildDetailColumn(
                              icon: Image.asset(
                                'assets/images/ic_cat.png',
                                color: const Color(0xFF028583),
                                width: 32.0,
                                height: 32.0,
                              ),
                              value: '${widget.cuteCat.age} years',
                              label: 'Age',
                            ),
                            const SizedBox(width: 42.0),
                            _buildDetailColumn(
                              icon: const Icon(
                                Icons.location_on,
                                color: Color(0xFF028583),
                                size: 32.0,
                              ),
                              value: widget.cuteCat.location,
                              label: 'Location',
                            ),
                            const SizedBox(width: 42.0),
                            _buildDetailColumn(
                              icon: Icon(
                                widget.cuteCat.gender == 'Male'
                                    ? Icons.male
                                    : Icons.female,
                                color: const Color(0xFF028583),
                                size: 32.0,
                              ),
                              value: widget.cuteCat.gender,
                              label: 'Gender',
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.all(48.0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Card.outlined(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                            side: BorderSide(
                              width: 1.0,
                              color: Colors.grey.shade300,
                            ),
                          ),
                          color: Colors.transparent,
                          child: Padding(
                            padding: const EdgeInsets.all(32.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Unique Value",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontFamily: 'PlusJakartaSans',
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 16.0),
                                Text(
                                  widget.cuteCat.uniqueValue,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontFamily: 'PlusJakartaSans',
                                  ),
                                ),
                                const SizedBox(height: 32.0),
                                const Text(
                                  "Cat Description",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontFamily: 'PlusJakartaSans',
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 16.0),
                                Text(
                                  widget.cuteCat.description,
                                  textAlign: TextAlign.justify,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontFamily: 'PlusJakartaSans',
                                    height: 1.6,
                                  ),
                                ),
                                const SizedBox(height: 32.0),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 16.0),
                          child: Row(
                            children: [
                              FavoriteButton(
                                cuteCat: widget.cuteCat,
                                width: 56,
                                height: 56,
                              ),
                              const SizedBox(width: 16.0),
                              Expanded(
                                child: AdoptButton(
                                  catName: widget.cuteCat.name,
                                  width: double.infinity,
                                  height: 50,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDetailColumn({
    required Widget icon,
    required String value,
    required String label,
  }) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(16.0),
          decoration: const BoxDecoration(
            color: Color(0xFFF1FFFF),
            shape: BoxShape.circle,
          ),
          child: icon,
        ),
        const SizedBox(height: 10.0),
        Text(
          value,
          style: const TextStyle(
            fontSize: 16,
            fontFamily: 'PlusJakartaSans',
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 5.0),
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            fontFamily: 'PlusJakartaSans',
            color: Colors.black38,
          ),
        ),
      ],
    );
  }
}
