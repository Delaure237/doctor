import 'package:doctor/src/pages/report/widgets/type_listtile.dart';
import 'package:doctor/src/pages/shared/widgets/appbar.dart';
import 'package:flutter/material.dart';


class Report extends StatelessWidget {
  const Report({super.key});

  @override
  Widget build(BuildContext context) {
    final Map<ReportType , String> items = {
       ReportType.hospitaReport : "Hospital Report",
      ReportType.laboratoryReport :"Laboratory Report",
      ReportType.prescriptionReport :"Prescription",
      
    };

    final Map<ReportType, IconData> icons ={
           ReportType.hospitaReport :  Icons.local_hospital_rounded,
    ReportType.laboratoryReport : Icons.local_pharmacy_sharp,
    ReportType.prescriptionReport : Icons.report,
    };
    return  Scaffold(
      appBar: Header(context, "Reports",[]),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: items.entries.map((e) {
          final reportType= e.key;
            return GestureDetector(
              onTap: (){},
            child: ReportListTile(leadIcon: icons[reportType], title: items[reportType]),
            );
        }).toList() 
      ),
    );
    
    
  }
}
enum ReportType{
  laboratoryReport,
  hospitaReport,
  prescriptionReport
}