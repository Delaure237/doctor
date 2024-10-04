// ignore_for_file: non_constant_identifier_names

import 'package:appointment_repository/appointment_repository.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:doctor/bloc/appointment_bloc/create_appt_bloc/bloc/book_appt_bloc.dart';
import 'package:doctor/src/pages/appointment_page/widgets/my_text_field.dart';
import 'package:doctor/src/pages/appointment_page/widgets/type_of_ap.dart';
import 'package:doctor/src/pages/shared/constant/constant.dart';
import 'package:doctor/src/pages/shared/widgets/appbar.dart';
import 'package:doctor_repository/doctor_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';
import 'package:shimmer/shimmer.dart';

import '../../../bloc/my_user_bloc/my_user_bloc.dart';
import '../auth/authentication_conponents/my_button.dart';

class AppointmentInfo extends StatefulWidget {
  final MyDoctor doctor; // Ajoutez ce paramètre pour le médecin

  const AppointmentInfo({super.key, required this.doctor});

  @override
  State<AppointmentInfo> createState() => AppointmentInfoState();
}

class AppointmentInfoState extends State<AppointmentInfo> {
  String formattedTime = DateFormat.Hm().format(DateTime.now());
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();
  AppointmentType? selectedAppointmentType;
  final dateController = TextEditingController();
  final timeController = TextEditingController();
  var uuid = const Uuid();

  late String doctorId;
  late String patientId;
  late String doctorName;
  late String doctorSpeciality;
  String? patientName;

  @override
  void initState() {
    super.initState();
    dateController.text = DateFormat('dd/MM/y').format(DateTime.now());
    timeController.text = formattedTime;
    doctorId = widget.doctor.userId;
    doctorName = widget.doctor.name;
    patientId = FirebaseAuth.instance.currentUser!.uid;
    doctorSpeciality = widget.doctor.speciality;

    // Chargement du nom du patient via le UserBloc
    _loadPatientName();
  }

  void _loadPatientName() {
    // Appel au bloc pour récupérer les infos du patient
    BlocProvider.of<UserBloc>(context).add(LoadUser());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(context, "Appointment Info",[]),
      body: BlocListener<BookApptBloc, BookApptState>(
        listener: (context, state) {
          if (state is BookAppSuccess) {
            Navigator.pop(context);
          } else if (state is BookAppFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                duration: Duration(seconds: 5),
                dismissDirection: DismissDirection.down,
                content: Text('Add information failed'),
              ),
            );
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(defaultPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Title("Date"),
              DatePicker(
                DateTime.now(),
                height: 97,
                initialSelectedDate: DateTime.now(),
                selectionColor: primaryColor,
                selectedTextColor: Colors.white,
                onDateChange: (date) {
                  setState(() {
                    selectedDate = date;
                  });
                },
              ),
              Title("Time"),
              MyTextfield(
                onTap: _startTimePicker,
                controller: timeController,
                icon: Iconsax.clock5,
                readOnly: true,
              ),
              Title("Type"),
              TypeOfAppointment(
                doctor: widget.doctor,
                onSelectedType: (AppointmentType type) {
                  setState(() {
                    selectedAppointmentType = type;
                  });
                },
              ),
              const SizedBox(height: 20),
              BlocBuilder<UserBloc, UserState>(
                builder: (context, state) {
                  if (state is UserLoading) {
                    return _buildShimmer();
                  } else if (state is UserLoaded) {
                    patientName = state.user.fullname; // Met à jour le nom du patient
                    return _buildNextButton(context);
                  } else if (state is UserError) {
                    return Text('Error: ${state.message}');
                  } else {
                    return const Text('Please wait, loading patient data...');
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildShimmer() {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            height: 50,
            color: Colors.white,
          ),
           const SizedBox(height: 10),
          Container(
            width: double.infinity,
            height: 50,
            color: Colors.white,
          ),
        ],
      ),
    );
  }

 Widget _buildNextButton(BuildContext context) {
  return SizedBox(
    width: double.infinity,
    child: BlocBuilder<BookApptBloc, BookApptState>(
      builder: (context, state) {
        return MyButton(
          onTap: () {
            if (selectedAppointmentType == null || patientName == null) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Please select an appointment type and wait for patient name to load'),
                ),
              );
              return;
            }

            // Création de l'objet Appointment avec les valeurs récupérées
          // Dans la méthode _buildNextButton

// Dans la méthode _buildNextButton
Appointment appointment = Appointment.empty.copyWith(
  speciality: doctorSpeciality,
  patientName: patientName,
  doctorName: doctorName,
  id: uuid.v1(),
  patientId: patientId,
  doctorId: doctorId,
  type: selectedAppointmentType,
  time: selectedTime, // Utilisez selectedTime directement
  date: selectedDate, // Utilisez selectedDate directement
  status: AppointmentStatus.pending,
);

// Méthode pour formater le temps


            // Ajouter l'événement au Bloc
            BlocProvider.of<BookApptBloc>(context).add(
              UpdateAppointmentInfo(appointment),
            );
          },
          title: "Next", // Afficher le titre normal par défaut
          isLoading: state is BookAppProcess, // Passer l'état de chargement
        );
      },
    ),
  );
}


  void _startTimePicker() async {
    TimeOfDay? newTime = await showTimePicker(
      context: context,
      initialTime: selectedTime,
      initialEntryMode: TimePickerEntryMode.dial,
    );
    if (newTime != null) {
      setState(() {
        selectedTime = newTime;
        formattedTime = selectedTime.format(context);
        timeController.text = formattedTime;
      });
    }
  }

  Widget Title(String text) {
    return Text(
      text,
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        letterSpacing: -1,
        fontSize: 18,
        color: primaryColor,
      ),
    );
  }

}