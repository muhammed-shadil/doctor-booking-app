import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctors_book_app/controller/authentication/bloc/auth_bloc.dart';
import 'package:doctors_book_app/view/screens/edit_screen.dart';
import 'package:doctors_book_app/view/screens/login_screen.dart';
import 'package:doctors_book_app/view/widgets/alertbutton.dart';
import 'package:doctors_book_app/view/widgets/common_popup.dart';
import 'package:doctors_book_app/view/widgets/settingspage_listtile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class settingsScreenWrapper extends StatelessWidget {
  const settingsScreenWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(),
      child: SettingsScreen(),
    );
  }
}

class SettingsScreen extends StatelessWidget {
  SettingsScreen({super.key});
  final user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    final authBloc = BlocProvider.of<AuthBloc>(context);

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 240, 240, 241),
      body: SingleChildScrollView(
        child: BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is UnAuthenticated) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Sign out"),
                ),
              );
            } else if (state is LogoutConfirm) {
              showDialog(
                  context: context,
                  builder: (context) => ConfirmAlert(
                      msg: "Are you sure you want to log out?",
                      icon: Icons.logout_outlined,
                      iconColor: const Color.fromARGB(255, 231, 93, 127),
                      onConfirm: () {
                        authBloc.add(LogoutEvent());
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const LoginscreenWrapper()),
                            (route) => false);
                      },
                      onReject: () {
                        Navigator.pop(context);
                      },
                      title: "Logout!!"));
            }
          },
          child: Column(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.3,
                child: BlocBuilder<AuthBloc, AuthState>(
                  builder: (context, state) {
                    return Stack(
                      children: [
                        Container(
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(40),
                                bottomRight: Radius.circular(40)),
                            color: Color.fromARGB(255, 0, 148, 149),
                          ),
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 0.18,
                        ),
                        Positioned(
                          top: MediaQuery.of(context).size.width * 0.12,
                          left: MediaQuery.of(context).size.width * 0.38,
                          child: const Text(
                            "Settings",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 24,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Positioned(
                            top: MediaQuery.of(context).size.width * 0.24,
                            left: MediaQuery.of(context).size.width * 0.062,
                            child: StreamBuilder<DocumentSnapshot>(
                                stream: FirebaseFirestore.instance
                                    .collection("users")
                                    .doc(user!.uid)
                                    .snapshots(),
                                builder: (context, snapshot) {
                                  if (snapshot.connectionState ==
                                      ConnectionState.waiting) {
                                    return SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.88,
                                      height:
                                          MediaQuery.of(context).size.width *
                                              0.235,
                                      child: const Center(
                                        child: CircularProgressIndicator(),
                                      ),
                                    );
                                  }
                                  if (snapshot.hasData) {
                                    final userData = snapshot.data?.data()
                                        as Map<String, dynamic>?;
                                    print(userData);
                                    if (userData != null) {
                                      return Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: Colors.white,
                                        ),
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.88,
                                        height:
                                            MediaQuery.of(context).size.width *
                                                0.235,
                                        child: SingleChildScrollView(
                                          scrollDirection: Axis.horizontal,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 13,
                                                            right: 20),
                                                    child: SizedBox(
                                                      width: 65,
                                                      height: 65,
                                                      child: (userData[
                                                                  'image'] ==
                                                              null)
                                                          ? const Icon(Icons
                                                              .person_4_outlined)
                                                          : ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10),
                                                              child:
                                                                  Image.network(
                                                                userData[
                                                                    'image'],
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            ),
                                                    ),
                                                  ),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      const Text(
                                                        "Hello!",
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w300,
                                                          fontSize: 20,
                                                          color: Color.fromARGB(
                                                              255, 0, 148, 149),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: 179,
                                                        child: Text(
                                                          "${userData['username']}"
                                                              .toUpperCase(),
                                                          maxLines: 1,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          style:
                                                              const TextStyle(
                                                            fontWeight:
                                                                FontWeight.w900,
                                                            fontSize: 23,
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    0,
                                                                    148,
                                                                    149),
                                                          ),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ],
                                              ),
                                              Container(
                                                width: 33,
                                                height: 36,
                                                margin: const EdgeInsets.only(
                                                    right: 7),
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                    color: const Color.fromARGB(
                                                        255, 226, 235, 237)),
                                                child: IconButton(
                                                    onPressed: () {
                                                      Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder: (_) =>
                                                                  EditScreenWrapper(
                                                                    userDatas:
                                                                        userData,
                                                                  )));
                                                    },
                                                    icon: const Icon(
                                                      Icons.edit,
                                                      size: 27,
                                                      color: Color.fromARGB(
                                                          255, 0, 148, 149),
                                                    )),
                                              )
                                            ],
                                          ),
                                        ),
                                      );
                                    }
                                  }
                                  return Container();
                                }))
                      ],
                    );
                  },
                ),
              ),
              const SettingsListTile(
                content: 'About Us',
                contentIcon: Icons.info,
              ),
              const SettingsListTile(
                content: 'Privacy policy',
                contentIcon: Icons.privacy_tip_sharp,
              ),
              const SettingsListTile(
                content: 'Feedback and support',
                contentIcon: Icons.thumb_up_alt,
              ),
              const SettingsListTile(
                content: 'FAQs',
                contentIcon: Icons.question_answer,
              ),
              const SettingsListTile(
                content: 'Help',
                contentIcon: Icons.live_help,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.04,
              ),
              Alerltbutton(
                buttontext: "Log out",
                onpressed: () {
                  authBloc.add(LogoutConfirmEvent());
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
