import 'package:doctor/src/pages/shared/constant/constant.dart';
import 'package:flutter/material.dart';

class CategoriePicker extends StatefulWidget {
  const CategoriePicker({super.key});

  @override
  State<CategoriePicker> createState() => _CategoriePickerState();
}

class _CategoriePickerState extends State<CategoriePicker> {
   final List<String> _category = [
    "All",
    "Tablet",
    "Capsule",
    "Suppository",
    "Eye drops",
    "Gelcaps",
    "Powder",
    "Syrup",
    "Oral solution",
    "Cream",
    "Ointment",
    "Vaginal Suppository",
    "Aerosol",
    "Suspension",
    "Transdermal patch"
  ];

  int selectedIndex = 0; // Sélection par défaut

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60, // Augmenter la hauteur globale
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _category.length,
        itemBuilder: (context, index) {
          bool isSelected = (index == selectedIndex);
          return GestureDetector(
            onTap: () {
              setState(() {
                // Mettre à jour l'élément sélectionné
                selectedIndex = index;

                // Déplacer l'élément sélectionné en première position
                String selectedCategory = _category.removeAt(index);
                _category.insert(0, selectedCategory);
                selectedIndex = 0; // L'index sélectionné devient le premier élément
              });
            },
            child: Container(
              height: 70, // Augmenter la hauteur des conteneurs individuels
              alignment: Alignment.center,
              margin: const EdgeInsets.symmetric(horizontal: 6, vertical: 16), // Augmenter l'espace vertical
              padding: const EdgeInsets.symmetric(horizontal: 16), // Augmenter le padding horizontal
              decoration: BoxDecoration(
                border: isSelected
                    ? Border.all(color: primaryColor)
                    : Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(30),
                color: isSelected ? primaryColor : Colors.transparent,
              ),
              child: Text(
                _category[index],
                style: TextStyle(
                  color: isSelected ? Colors.white : Colors.grey,
                  fontSize: 16,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
