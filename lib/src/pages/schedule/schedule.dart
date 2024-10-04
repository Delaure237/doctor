import 'package:animated_segmented_tab_control/animated_segmented_tab_control.dart';
import 'package:appointment_repository/appointment_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import '../../../bloc/appointment_bloc/create_appt_bloc/bloc/book_appt_bloc.dart';
import '../../../bloc/appointment_bloc/get_appt_bloc/bloc/get_appt_bloc.dart';
import '../shared/constant/constant.dart';
import '../shared/widgets/appbar.dart';
import 'doctor_schedule_cell_view.dart';
import 'user_schedule_cell_view.dart';


class SchedulePage extends StatefulWidget {
  const SchedulePage({super.key});

  @override
  State<SchedulePage> createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> with SingleTickerProviderStateMixin {
  late TabController _tabcontroller;

  @override
  void initState() {
    super.initState();
    _tabcontroller = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabcontroller.dispose();
    super.dispose();
  }

  // Fonction pour formater la date
  String formatDate(DateTime date) {
    return DateFormat('dd/MM/yyyy').format(date); // Format: jj/mm/aaaa
  }

  // Fonction pour formater l'heure
  String formatTime(TimeOfDay time) {
    final now = DateTime.now();
    final dateTime = DateTime(now.year, now.month, now.day, time.hour, time.minute);
    return DateFormat('H:mm').format(dateTime); // Format: h:m
  }

  // Fonction pour filtrer les rendez-vous en fonction de leur statut
  List<Appointment> filterAppointmentsByStatus(
      List<Appointment> appointments, List<AppointmentStatus> statuses) {
    return appointments.where((appt) => statuses.contains(appt.status)).toList();
  }

  @override
  Widget build(BuildContext context) {
    final userRole = context.read<GetApptBloc>().role; 

    if (userRole == null) {
      return const Center(child: Text('User role not defined'));
    }

    return Scaffold(
      appBar: Header(context, "Schedule", []),
      body: BlocBuilder<GetApptBloc, GetApptState>(
        builder: (context, state) {
          List<Appointment> upcomingAppointments = [];
          List<Appointment> completedAppointments = [];
          List<Appointment> canceledAppointments = [];

          // Gestion des états de chargement et d'erreurs
          if (state is GetAppLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is GetApptLoaded) {
            final appointments = state.appointments;

            // Filtrage des rendez-vous par statut
            upcomingAppointments = filterAppointmentsByStatus(
                appointments, [AppointmentStatus.pending, AppointmentStatus.confirmed]);
            completedAppointments = filterAppointmentsByStatus(
                appointments, [AppointmentStatus.completed]);
            canceledAppointments = filterAppointmentsByStatus(
                appointments, [AppointmentStatus.canceled]);
          } else if (state is GetAppError) {
            return Center(child: Text('Error: ${state.error}'));
          }

          // Affichage des SegmentTab même si les listes sont vides
          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
              child: Stack(
                children: [
                  DefaultTabController(
                    length: 3,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: defaultPadding),
                      child: SegmentedTabControl(
                        controller: _tabcontroller,
                        indicatorDecoration: const BoxDecoration(color: primaryColor),
                        tabPadding: const EdgeInsets.all(defaultPadding),
                        selectedTabTextColor: bgColor,
                        tabTextColor: primaryColor,
                        height: KToolbarHeight,
                        barDecoration: BoxDecoration(
                          boxShadow: const [
                            BoxShadow(
                              color: Color.fromARGB(26, 0, 0, 0),
                              blurRadius: 7,
                              offset: Offset(0, 1.5),
                            ),
                          ],
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.grey[400],
                        ),
                        tabs: const [
                          SegmentTab(
                            textColor: primaryTextColor,
                            label: "Upcoming",
                          ),
                          SegmentTab(
                            label: "Completed", 
                            textColor: primaryTextColor,
                          ),
                          SegmentTab(
                            label: "Canceled", 
                            textColor: primaryTextColor,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 80),
                    child: TabBarView(
                      controller: _tabcontroller,
                      physics: const BouncingScrollPhysics(),
                      children: [
                        // Onglet "Upcoming" (inclut pending et confirmed)
                        buildAppointmentList(
                          userRole,
                          upcomingAppointments,
                          'No upcoming appointments',
                        ),
                        // Onglet "Completed"
                        buildAppointmentList(
                          userRole,
                          completedAppointments,
                          'No completed appointments',
                        ),
                        // Onglet "Canceled"
                        buildAppointmentList(
                          userRole,
                          canceledAppointments,
                          'No canceled appointments',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  // Fonction utilitaire pour afficher la liste ou un message vide
  Widget buildAppointmentList(String userRole, List<Appointment> appointments, String emptyMessage) {
    return appointments.isEmpty
        ? Center(
            child: Text(
              emptyMessage,
              style: const TextStyle(fontSize: 18),
            ),
          )
        : ListView.separated(
            itemBuilder: (context, index) {
              final appointment = appointments[index];
              final formattedDate = formatDate(appointment.date);
              final formattedTime = formatTime(appointment.time);

              return userRole == "doctor"
                  ? DrScheduleCellView(
                      name: appointment.patientName,
                      date: formattedDate,
                      time: formattedTime,
                      urlPath: "", 
                      status: appointment.status,
                      onConfirm: () {
                        context.read<BookApptBloc>().add(
                          UpdateAppointmentInfo(
                            appointment.copyWith(status: AppointmentStatus.confirmed),
                          ),
                        );
                      },
                    )
                  : ScheduleCellView(
                      name: appointment.doctorName,
                      date: formattedDate,
                      time: formattedTime,
                      urlPath: "",
                      speciality: appointment.speciality,
                      status: appointment.status,
                    );
            },
            separatorBuilder: (context, index) => const SizedBox(height: 12),
            itemCount: appointments.length,
          );
  }
}
