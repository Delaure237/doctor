// ignore_for_file: non_constant_identifier_names

import 'medecine_models.dart';

class MedecineHandle{

   final  Medecine toux =  const Medecine(urlPath: "lib/asset/images/sirop toux.jpeg", medecineName:  "Sirop toux", description: "take this four time and get health", price: 19.5);
     final  Medecine para =  const Medecine(urlPath: "lib/asset/images/paracetamol.jpeg", medecineName:  "paracetamol", description: "take this four time and get health", price: 19.5);
    final  Medecine efferalgan =  const Medecine(urlPath: "lib/asset/images/efferalgan-1g-fruits-rouges-8-comprimes-effervescents-i211583.jpg", medecineName:  "efferalgan", description: "take this four time and get health", price: 19.5);
    final  Medecine anti_rv =  const Medecine(urlPath: "lib/asset/images/anti rv.jpeg", medecineName:  "fragile", description: "take this four time and get health", price: 19.5);
    final  Medecine doliprane =  const Medecine(urlPath: "lib/asset/images/Doliprane.jpeg", medecineName:  "kramadol", description: "take this four time and get health", price: 19.5);
     final  Medecine cerave =  const Medecine(urlPath: "lib/asset/images/cerave2.jpeg", medecineName:  "Cerave", description: "take this four time and get health", price: 19.5);
      final  Medecine flucazol =  const Medecine(urlPath: "lib/asset/images/flucazol.jpeg", medecineName:  " Flucazol", description: "take this four time and get health", price: 19.5);
       final  Medecine litacold =  const Medecine(urlPath: "lib/asset/images/litacold.jpeg", medecineName:  "Litacol", description: "take this four time and get health", price: 19.5);
      final  Medecine collyre =  const Medecine(urlPath: "lib/asset/images/collyre.jpeg", medecineName:  "Collyre", description: "take this four time and get health", price: 19.5);
  List<Medecine> allDatas() {
  final List<Medecine> allMedecine = [];
allMedecine.add(para);
allMedecine.add(efferalgan);
allMedecine.add(doliprane);
allMedecine.add(anti_rv);
allMedecine.add(collyre);
allMedecine.add(cerave);
allMedecine.add(flucazol);
allMedecine.add(litacold);
allMedecine.add(toux);
  return allMedecine;
}
}