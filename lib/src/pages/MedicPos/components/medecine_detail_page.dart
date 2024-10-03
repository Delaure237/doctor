import 'package:doctor/src/pages/appointment_page/payement_page.dart';
import 'package:doctor/src/pages/onboarding_page/components/next_button.dart';
import 'package:doctor/src/pages/shared/constant/constant.dart';
import 'package:flutter/material.dart';


import 'widgets/row_icon.dart';

class MedecineDetailPage extends StatefulWidget {
  final String path;
  final String name;

  const MedecineDetailPage({super.key, required this.path, required this.name});
  @override
  State<MedecineDetailPage> createState() => MedecineDetailPageState();
}

class MedecineDetailPageState extends State<MedecineDetailPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            // Image qui occupe tout le haut de la page
            Container(
             clipBehavior: Clip.antiAlias,
              height: MediaQuery.of(context).size.height * 0.5,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(widget.path),
                  fit: BoxFit.cover,
                  scale: 0.8,

                ),
              ),
            ),
            // Contenu avec bords arrondis et effet d'ombre au-dessus de l'image
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.50,
                padding: const EdgeInsets.all(defaultPadding),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                  // Ajout de l'ombre
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.15), // Ombre légère
                      spreadRadius: 2,
                      blurRadius: 10,
                      offset: const Offset(0, -3), // Ombre vers le haut
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 24), // Espace pour l'arrondi
                    title(widget.name),
                    const Text(
                      "price",
                      style: TextStyle(
                        color: Colors.green,
                      ),
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      "Lorem ipsum dolor sit, amet consectetur adipisicing elit. "
                      "Voluptatem perferendis quibusdam saepe, sit suscipit voluptate ullam veniam minima "
                      "corrupti, inventore nam eum delectus nulla necessitatibus alias explicabo recusandae "
                      "molestiae. Dolorum!",
                    ),
                    const SizedBox(height: 24),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Bouton -
                        Container(
                          width: 50,
                          decoration: const BoxDecoration(
                            color: Colors.grey,
                            shape: BoxShape.circle,
                          ),
                          child: const Center(
                            child: Text(
                              "-",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),

                        const Text(
                          "2",
                          style: TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),

                        // Bouton +
                        Container(
                          width: 50,
                          decoration: const BoxDecoration(
                            color: Colors.grey,
                            shape: BoxShape.circle,
                          ),
                          child: const Center(
                            child: Text(
                              "+",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                         const SizedBox(width: 7,),
                        // Bouton "Add to cart"
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.6,
                          child: NextButton(
                            title: "Add to cart",
                            onPressed: () {},
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            // Icônes en haut de l'image
            const Padding(
              padding: EdgeInsets.all(8),
              child: CircularIconRow(),
            ),
          ],
        ),
      ),
    );
  }
}
