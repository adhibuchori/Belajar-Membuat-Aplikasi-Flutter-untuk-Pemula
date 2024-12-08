import 'package:flutter/material.dart';

class AdoptButton extends StatelessWidget {
  final String catName;
  final double width;  // Required parameter for width
  final double height; // Required parameter for height

  const AdoptButton({
    super.key,
    required this.catName,
    this.width = 200.0,  // Default width if not provided
    this.height = 50.0,  // Default height if not provided
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,  // Set the width of the button
      height: height, // Set the height of the button
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF028583),
          padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
        ),
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Row(
                children: [
                  const Icon(
                    Icons.check_circle,
                    color: Colors.white,
                    size: 20.0,
                  ),
                  const SizedBox(width: 8.0),
                  Text(
                    'Successfully adopted $catName',
                    style: const TextStyle(color: Colors.white),
                  ),
                ],
              ),
              backgroundColor: Colors.green,
              behavior: SnackBarBehavior.floating,
              duration: const Duration(seconds: 2),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100.0),
              ),
            ),
          );
        },
        child: const Text(
          'Adopt Me',
          style: TextStyle(
            fontFamily: 'PlusJakartaSans',
            fontSize: 16.0,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
