import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shiroko/model/favorite_provider.dart';
import 'package:shiroko/model/model_cute_cat.dart';

class FavoriteButton extends StatelessWidget {
  final CuteCat cuteCat;
  final double width;
  final double height;

  const FavoriteButton({
    super.key, 
    required this.cuteCat, 
    this.width = 50.0,
    this.height = 50.0,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<FavoriteProvider>(
      builder: (context, favoriteProvider, child) {
        bool isFavorite = favoriteProvider.isFavorite(cuteCat.name);

        return Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: Colors.grey,
              width: 0.5,
            ),
          ),
          child: IconButton(
            icon: Icon(
              isFavorite ? Icons.favorite : Icons.favorite_border,
              color: Colors.red,
            ),
            iconSize: 24.0,
            onPressed: () {
              favoriteProvider.toggleFavorite(cuteCat);

              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Row(
                    children: [
                      Icon(
                        isFavorite ? Icons.favorite_border : Icons.favorite,
                        color: Colors.white,
                        size: 20.0,
                      ),
                      const SizedBox(width: 8.0),
                      Text(
                        isFavorite
                            ? 'Removed ${cuteCat.name} from Favorite'
                            : 'Added ${cuteCat.name} to Favorite',
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  backgroundColor: isFavorite ? Colors.red : Colors.green,
                  behavior: SnackBarBehavior.floating,
                  duration: const Duration(seconds: 2),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100.0),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
