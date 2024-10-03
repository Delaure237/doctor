import 'package:flutter/material.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_grid_view.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_tile.dart';
import 'widgets/datas.dart';
import 'widgets/medecine_card.dart'; // Assurez-vous que MedecineCard est bien importé
import 'widgets/medecine_models.dart';

class Medecines extends StatefulWidget {
  const Medecines({super.key});

  @override
  State<Medecines> createState() => _MedecinesState();
}

class _MedecinesState extends State<Medecines> {
  final List<Medecine> _medecines = MedecineHandle().allDatas();

  @override
  Widget build(BuildContext context) {
    return StaggeredGridView.countBuilder(
      padding:  const EdgeInsets.all(8),
      crossAxisCount: 2,
      shrinkWrap: true, // Permet à la grille de s'adapter à l'espace
      physics: const NeverScrollableScrollPhysics(), // Désactive le défilement
      itemCount: _medecines.length,
      itemBuilder: (context, index) {
        return MedecineCard(medecine: _medecines[index]);
      },
      staggeredTileBuilder: (int index) => const StaggeredTile.count(1, 1.6),
      mainAxisSpacing: 8.0,
      crossAxisSpacing: 8.0,
    );
  }
}
