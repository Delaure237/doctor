import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:doctor_repository/doctor_repository.dart';
import '../../../../../bloc/doctor_bloc/my_doctor_bloc/bloc/my_doctor_bloc.dart';
import '../../../doctorprofile_page/profile_page.dart';
import '../../../shared/widgets/slide_transition.dart';
import 'doctor_cell_view.dart'; // Assurez-vous que le chemin est correct

class DoctorContainer extends StatelessWidget {
  const DoctorContainer({super.key});



  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MyDoctorBloc, MyDoctorState>(
      builder: (context, state) {
        if (state is MyDoctorLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is MyDoctorError) {
          return Center(child: Text('Error: ${state.message}'));
        } else if (state is MyDoctorLoaded) {
          final List<MyDoctor> doctors = state.doctors;

          return ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              final MyDoctor doctor = doctors[index];
              return GestureDetector(
                child: DoctorCellView(doctor: doctor),
                onTap: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                SlideTransition2(ProfilePage(doctor: doctor)),
                    (Route<dynamic> route) => false);
                  
                },
              );
            },
            separatorBuilder: (BuildContext context, int index) => const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Divider(thickness: 1),
            ),
            itemCount: doctors.length,
          );
        } else {
          return const Center(child: Text('No doctors available'));
        }
      },
    );
  }
}
