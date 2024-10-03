// ignore_for_file: public_member_api_docs, sort_constructors_first


import 'package:flutter/material.dart';

class ReportListTile extends StatelessWidget {
  final IconData? leadIcon;
  final String? title;
  const ReportListTile({super.key, 

    required this.leadIcon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: ClipOval(
        child: Icon(leadIcon),
      ),
      title: Text(title!),
      trailing:  const Icon(Icons.navigate_next, size: 18,),
    );
  }
}
