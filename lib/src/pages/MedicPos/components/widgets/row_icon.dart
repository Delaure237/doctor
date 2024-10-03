import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CircularIconRow extends StatelessWidget {
  const CircularIconRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Icone de retour
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.5), // Fond semi-transparent
            shape: BoxShape.circle,
          ),
          child: IconButton(
            icon:  const Icon(CupertinoIcons.back, color: Colors.white),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        // Icone de favoris
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.5), // Fond semi-transparent
            shape: BoxShape.circle,
          ),
          child: IconButton(
            icon: const Icon(Icons.favorite_border, color: Colors.white),
            onPressed: () {

            },
          ),
        ),
      ],
    );
  }
}

