
// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:doctor/bloc/account_type/bloc/account_type_bloc.dart';
import 'package:doctor/bloc/my_user_bloc/my_user_bloc.dart';
import 'package:doctor/bloc/doctor_bloc/my_doctor_bloc/bloc/my_doctor_bloc.dart';
import '../doctor/all_doctor_page.dart';
import '../shared/widgets/title.dart';
import 'homepage_conponent/appbar.dart';
import 'homepage_conponent/searchbar.dart';
import 'homepage_conponent/upcoming_schedule.dart';
import 'homepage_conponent/recommend_doctor_part/doctors_container.dart';
import '../shared/constant/constant.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {



  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
      final  userRole = context.read<AccountTypeBloc>().role;
    return Scaffold(
      appBar: header(context),
      body: userRole == "doctor" ? _buildDoctorView(context) : _buildPatientView(context)
    );
  }




  Widget _buildPatientView(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        String greeting = "Hi there \u{1F44B}";

        if (state is UserLoaded) {
          final firstName = state.user.fullname.split(' ').first;
          greeting = "Hi, $firstName \u{1F44B}";
        } else if (state is UserLoading) {
          greeting = "Loading...";
        } else if (state is UserError) {
          greeting = "Error loading user data";
        }

        return _buildCommonView(greeting, state, TypeOfAccount.patient);
      },
    );
  }

  Widget _buildDoctorView(BuildContext context) {
    return BlocBuilder<MyDoctorBloc, MyDoctorState>(
      builder: (context, state) {
        String greeting = "Hi Dr\u{1F44B}";

        if (state is DoctorLoaded) {
          final firstName = state.doctor.name.split(' ').first;
          greeting = "Dr $firstName \u{1F44B}";
        } else if (state is DoctorLoading) {
          greeting = "Loading...";
        } else if (state is DoctorError) {
          greeting = "Error loading user data";
        }

        return _buildCommonView(greeting, state, TypeOfAccount.doctor);
      },
    );
  }

  Widget _buildCommonView(String greeting, dynamic state, TypeOfAccount userRole) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: defaultPadding, horizontal: defaultPadding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: defaultPadding),
            state is UserLoading || state is DoctorLoading
                ? Shimmer.fromColors(
                    baseColor: Colors.grey[300]!,
                    highlightColor: Colors.grey[100]!,
                    child: Container(height: 20, width: 150, color: Colors.white),
                  )
                : Text(
                    greeting,
                    textAlign: TextAlign.start,
                    style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
            const SizedBox(height: 24),
            searchBar(context, "Search for a specialist "),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const title(text: "Upcoming Schedule"),
                subtitle(page: const Schedule()),
              ],
            ),
            const SizedBox(height: 10),
            const Schedule(),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                title(
                  text: userRole == TypeOfAccount.patient ? "Recommended Specialist" : "Top Doctors",
                ),
                subtitle(page: const AllDoctorPage()),
              ],
            ),
            const DoctorContainer(),
          ],
        ),
      ),
    );
  }

  Widget subtitle({required Widget page}) {
    return GestureDetector(
      onTap: () {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (BuildContext context) => page),
          (route) => false,
        );
      },
      child: const Text(
        "View all",
        style: TextStyle(
          fontSize: 14,
          color: Colors.grey,
          fontWeight: FontWeight.w200,
        ),
      ),
    );
  }
}
