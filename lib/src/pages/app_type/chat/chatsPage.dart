// ignore_for_file: unused_element, avoid_print

import 'package:doctor/bloc/appointment_bloc/get_appt_bloc/bloc/get_appt_bloc.dart';
import 'package:doctor/src/pages/app_type/chat/components/user_chat_listItem.dart';
import 'package:doctor/src/pages/shared/widgets/appbar.dart';
import 'package:doctor/src/pages/shared/widgets/title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  Future<String?> _getUserRole(BuildContext context) async {
    // Récupérer le rôle depuis le Bloc, ou une source externe
    
    return   context.read<GetApptBloc>().role; // Modifiez cela si nécessaire
  }

  @override
  Widget build(BuildContext context) {
    final userRole = context.read<GetApptBloc>().role;
    return Scaffold(
      appBar: Header(context, "Chats",[]),
      body:  BlocBuilder<GetApptBloc, GetApptState>(
            builder: (context, state) {
              if (state is GetAppLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is GetApptLoaded) {
                final appointments = state.appointments;

                if (appointments.isEmpty) {
                  return const Center(child: Text('No appointments available'));
                }

                return SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      
                          const  title(text: "Active now"), 
                   /*   ListView.separated(
                        
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemBuilder:(context,index) {
                              final appointment = appointments[index];
                        return  onlineDoctorCellView(urlPath: "lib/asset/images/Basile-Njei.jpg", name: appointment.doctorName);
                        }, separatorBuilder: (BuildContext context, int index) { 
                          return  const SizedBox(width: 12);
                         }, itemCount: appointments.length,
                         ),*/
                     const  title(text: "Recents Chats"),
                      ListView.builder(
                        physics:  const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: appointments.length,
                        itemBuilder: (context, index) {
                          final appointment = appointments[index];
                      
                          final nameToFetch = userRole == 'doctor'
                              ? appointment.patientName
                              : appointment.doctorName;
                      
                          final idToFetch = userRole == 'doctor'
                              ? appointment.patientId
                              : appointment.doctorId;
                      print(idToFetch);
                          return UserChatListItem(
                            receiverName: nameToFetch,
                            urlPath: "lib/asset/images/Basile-Njei.jpg",
                            unreadMessage: 0,
                            receiverId: idToFetch, 
                            date: appointment.date,
                            time:appointment.time, 
                            appointmentId: appointment.id,
                          );
                        },
                      ),
                    ],
                  ),
                );
              }
              return const SizedBox();
            },
      
          )
        
      
    );
  }
  
  Widget  onlineDoctorCellView(  {required String urlPath, required String name } ) {
    return Column(
      children: [
        ClipOval(
          child: Image.network(urlPath),
        ),
        Text(name)
      ],
    );
  }
}
