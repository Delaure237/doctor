import 'package:doctor/src/pages/MedicPos/components/caterogyPicker.dart';
import 'package:doctor/src/pages/MedicPos/components/medecine_view.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../home/homepage_conponent/searchbar.dart';
import '../shared/constant/constant.dart';
import '../shared/widgets/title.dart';
import 'components/med_appbar.dart';
import 'scanninpage.dart';

class MedicPos extends StatefulWidget {
  const MedicPos({super.key});

  @override
  State<MedicPos> createState() => _MedicPosState();
}

class _MedicPosState extends State<MedicPos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MedHeader(

        context,
        "MedPOS",
        [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
             InkWell(child: AppBarAction(Iconsax.scan_barcode4),onTap: (){
              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const ScanMedecineQrCode()), (route) => false);
             },),
         const     SizedBox(width: 7,),
             AppBarAction(Iconsax.ticket),
              const  SizedBox(width: 7,),
             AppBarAction(Iconsax.d_cube_scan),  const SizedBox(width: 7,),
            ],
          ),


        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
  children: [
    const SizedBox(height: 24),
    searchBar(context,"Search for a medecine"),
    const SizedBox(height: 12),
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const title(text: "Categories"),
        GestureDetector(
          onTap: () {},
          child: subtitle(),
        ),
      ],
    ),
    const SizedBox(height: 12),
    // Ajout d'une couleur temporaire pour le débogage
    const CategoriePicker(),
    const SizedBox(height: 12),
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const title(text: "Medicines"),
        GestureDetector(
          onTap: () {},
          child: subtitle(),
        ),
      ],
    ),
    const SizedBox(height: 12),
    const Medecines()
  ],
),

        ),
      ),
    );
  }

  Widget subtitle() {
    return const Text(
      "View all",
      style: TextStyle(
        fontSize: 14,
        color: primaryColor,
      fontWeight: FontWeight.w500
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget  AppBarAction( IconData icon) {
 return Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(child: Icon(icon, color: Colors.black, size: 20)),

    );

  }
}
