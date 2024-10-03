
// ignore_for_file: unused_field, avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'recherche.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();
  @override
  void initState(){
  //  getClientStream();
    _searchController.addListener(_onSearchChanged);
    super.initState();
  }
  _onSearchChanged(){
    print(_searchController.text);
  }
  //list of result
  List _allResults = [];

  final List _resultList = [];
  //search function 

  searchResultList() {
    var showResults =  [];
    if(_searchController.text != ""){
      for (var clientSnapShot in _allResults) {
        var name = clientSnapShot['name'].toString().toLowerCase();
        if (name.contains(_searchController.text.toLowerCase())) {
          showResults.add(clientSnapShot);
        }
      }

    } else {
      showResults = List.from(_allResults);
    }
  }
  getClientStream() async {
    var data = await FirebaseFirestore.instance.collection("doctors").orderBy("name").get();

    setState(() {
      _allResults = data.docs;
    });
  }

  @override
  void dispose() {
    _searchController.removeListener(_onSearchChanged);
    super.dispose();
  }

  @override
  void didChangeDependencies() {
 getClientStream();
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
   appBar: AppBar(
    backgroundColor: Colors.white,
    title:  Search(context, "Search for a specialist ",_searchController),
   ), 
   body: ListView.builder(
    itemCount: _allResults.length,
    itemBuilder: (context,index) => searchResultListTile(context, _allResults[index]['name'], _allResults[index]["speciality"])
    /* ListTile(
      title: Text(_allResults[index]['name']),
      subtitle: Text(_allResults[index]["speciality"]),
    )*/
    ),
      ));
  }
}
Widget searchResultListTile ( BuildContext context,String name,String speciality){
   return InkWell(
   onTap:  (){},
   child: Container(
    decoration: const BoxDecoration(
      color:Colors.white,
    ),
    child:ListTile(
      leading:   ClipOval(
        child: Image.network(""),
        
      ),
      title: Text(name, style:Theme.of(context)
      .textTheme 
      .bodySmall!.copyWith(fontWeight: FontWeight.w300)

      ),
    subtitle: Text(name, style:Theme.of(context)
      .textTheme
      .bodySmall!.copyWith(fontWeight: FontWeight.w100,fontSize: 14,color: Colors.grey)

      ),
    )
   ),
   );
}

