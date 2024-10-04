import 'package:doctor/bloc/my_user_bloc/my_user_bloc.dart';
import 'package:doctor/bloc/sign_in_bloc/sign_in_bloc.dart';
import 'package:doctor/src/pages/shared/constant/constant.dart';
import 'package:doctor/src/pages/userprofile_page/widgets/row_cell.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

import '../shared/widgets/appbar.dart';

class UserProfilePage extends StatefulWidget {
  const UserProfilePage({super.key});

  @override
  State<UserProfilePage> createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  // Méthode pour afficher la boîte de dialogue de confirmation de déconnexion

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: Header(context, "",[]),
      body: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          if (state is UserLoading) {
             return const Center(child: CircularProgressIndicator());
          } else if (state is UserLoaded) {
            final user = state.user;
            return SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 0),
                      height: MediaQuery.of(context).size.height * 0.3,
                      child: Stack(
                        alignment: AlignmentDirectional.topCenter,
                        children: [
                          Container(
                            color: primaryColor,
                            height: MediaQuery.of(context).size.height * 0.2,
                            width: double.infinity,
                          ),
                          const Positioned(
                            top: 70,
                            child: Hero(
                              tag: "profile",
                              child: CircleAvatar(
                                backgroundImage: AssetImage("lib/asset/images/Basile-Njei.jpg"),
                                radius: 80,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: defaultPadding, vertical: 5),
                      child: Column(
                        children: [
                          Text(
                            user.fullname,
                            style: GoogleFonts.poppins(
                              textStyle: const TextStyle(fontWeight: FontWeight.w600, fontSize: 24),
                            ),
                          ),
                          Text(
                            user.email,
                            style: GoogleFonts.poppins(
                              textStyle: const TextStyle(fontSize: 16),
                            ),
                          ),
                          Column(
                            children: [
                              ProfilField(
                                leading: Iconsax.edit,
                                title: "Edit profile",
                                trailing: const Icon(CupertinoIcons.chevron_right),
                                onTap: () {},
                              ),
                                ProfilField(
                                leading: Iconsax.wallet,
                                title: "Wallet",
                                trailing: const Icon(CupertinoIcons.chevron_right),
                                onTap: () {},
                              ),
                              ProfilField(
                                leading: Iconsax.translate5,
                                title: "Languages",
                                trailing: const Icon(CupertinoIcons.chevron_right),
                                onTap: () {},
                              ),
                              ProfilField(
                                leading: Iconsax.notification5,
                                title: "Notifications",
                                trailing: const Icon(CupertinoIcons.chevron_right),
                                onTap: () {},
                              ),
                              ProfilField(
                                leading: Iconsax.lock5,
                                title: "Security",
                                trailing: const Icon(CupertinoIcons.chevron_right),
                                onTap: () {},
                              ),
                              ProfilField(
                                leading: Iconsax.security4,
                                title: "Terms & privacy",
                                trailing: const Icon(CupertinoIcons.chevron_right),
                                onTap: () {},
                              ),
                              ProfilField(
                                leading: Iconsax.moon5,
                                title: "Dark Mode",
                                trailing: CupertinoSwitch(value: true, onChanged: (val) {}),
                                onTap: () {},
                              ),
                              // Utilisation de Builder pour s'assurer que le contexte est valide lors de l'affichage du dialogue
                            GestureDetector(
  onTap: () {
    showDialog(
      context: context,
      builder: (ctx) {
        return AlertDialog(
          title: const Text('Confirmation'),
          content: const Text(' You are going to logOut '),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel',style: TextStyle(color: Colors.black),),
              onPressed: () {
                Navigator.of(context).pop(); // Fermer le dialogue
              },
            ),
            TextButton(
              child: const Text('Log Out',style: TextStyle(color: Colors.red),),
              onPressed: () {
             context.read<SignInBloc>().add(const SignOutRequired());
             // Déclencher l'événement de déconnexion
                Navigator.of(context).pop(); // Fermer le dialogue
              },
            ),
          ],
        );
      },
    );
  },
  child: const Text(" Log Out")
),

                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          } else if (state is UserError) {
        return     Center(child: Text('Error: ${state.message}'));
          }
       return     const Center(child: Text('No user data'));
        },
      ),
    );
  }
}
