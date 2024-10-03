// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

class AppPages {
  final  RouteObserver<Route> observer = RouteObserver();
  static List<String> history = [];
  static List<PageEntity> Routes() {
    return [
      
     
    ];
  }
  List<dynamic> Blocer(BuildContext context){
   List<dynamic> blocerList = <dynamic>[];
   for (var blocer in Routes()) {
      blocerList.add(blocer.bloc);
   }
   return blocerList;
}
 /*MaterialPageRoute GenerateRouteSetting(RouteSettings settings){
if (settings.name!=null) {
  var result = Routes().where((element) => element.path == settings.name);
  if (result.isNotEmpty) {
    //first open the App
    bool deviceFirstOpen = Global.sto
  }

}
 }*/

}
 

class PageEntity<T> {
  String path;
  Widget page;
  dynamic bloc;
   PageEntity({
 required this.path,
 required  this.page,
   required this.bloc
  });
}