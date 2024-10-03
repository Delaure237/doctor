// ignore_for_file: non_constant_identifier_names




import 'package:doctor/src/models/doctor.dart';

List<Doctor> getSpecialistsData() {

  List<Doctor> doc = [];
  doc.add(Doctor(name: "Dr Basile Njie", speciality: "Gynaecologist", way: 2,star: 4.6,path: "lib/asset/images/Basile-Njei.jpg"));
  doc.add( Doctor(name: "Dr Claudel Noubissie", speciality: "Chirugien", way: 10, star: 4.9, path: "lib/asset/images/cn.jpg"));
  doc.add( Doctor(name: "Dr Carla Dupont", speciality: "neuro-chirugienne", way: 3, star: 4.5,path: "lib/asset/images/nr.jpg"));
  doc.add(Doctor(name: "Dr.Katie Edwards", speciality: "Practitionner", way: 3, star: 4.5, path:"lib/asset/images/gynecologue.jpg"));
  doc.add(Doctor(name: "Dr.Katie Edwards", speciality: "Practitionner", way: 3, star: 4.5, path:"lib/asset/images/bl.jpg"));

  return doc;


}

List<Doctor> research(String string) {
  final lowercase = string.toLowerCase();
  final all = getSpecialistsData();
  List<Doctor> result = [];
  for (var Specialist in all) {
    //final specialist = Specialist.name.toLowerCase();
    if (Specialist.name.contains(lowercase)) {
      result.add(Specialist);
    }
  }
  return result;
}





