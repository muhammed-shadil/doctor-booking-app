import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctors_book_app/controller/authentication/bloc/auth_bloc.dart';
import 'package:doctors_book_app/controller/dummycontroller/bloc/dummy_bloc.dart';
import 'package:doctors_book_app/utility/dummydoctors.dart';
import 'package:doctors_book_app/view/screens/homepage/homescreen2.dart';
import 'package:doctors_book_app/view/widgets/home_textfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreenWrapper extends StatelessWidget {
  const HomeScreenWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthBloc(),
        ),
        BlocProvider(
          create: (context) => DummyBloc(),
        )
      ],
      child: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    // final authBloc = BlocProvider.of<AuthBloc>(context);

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 240, 240, 241),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                // color: Colors.black26,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.230,
                child: Stack(
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(40),
                            bottomRight: Radius.circular(40)),
                        color: Color.fromARGB(255, 207, 230, 231),
                      ),
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.18,
                    ),
                    Positioned(
                        top: MediaQuery.of(context).size.height * 0.14,
                        left: MediaQuery.of(context).size.width * 0.094,
                        child: Container(
                            // color: Colors.amber,
                            width: MediaQuery.of(context).size.width * 0.8,
                            height: MediaQuery.of(context).size.height * 0.08,
                            child: HomeTextfield1(
                              icon1: const Icon(Icons.search_rounded),
                              hint: "Search doctors,category..........",
                              validator: (value) {},
                            ))),
                    Positioned(
                        child: StreamBuilder<DocumentSnapshot>(
                            stream: FirebaseFirestore.instance
                                .collection("users")
                                .doc(user!.uid)
                                .snapshots(),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              }
                              if (snapshot.hasData) {
                                final userData = snapshot.data?.data()
                                    as Map<String, dynamic>?;
                                print(userData);
                                if (userData != null) {
                                  return Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    width: MediaQuery.of(context).size.width,
                                    height: MediaQuery.of(context).size.width *
                                        0.235,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      // crossAxisAlignment: CrossAxisAlignment.end,
                                      children: [
                                        Row(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 17, right: 20),
                                              child: SizedBox(
                                                width: 48,
                                                height: 48,
                                                child: (userData['image'] ==
                                                        null)
                                                    ? const Icon(
                                                        Icons.person_4_outlined)
                                                    : ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        child: Image.network(
                                                          userData['image'],
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                              ),
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Container(
                                                  width: 179,
                                                  child: Text(
                                                    "${userData['username']}"
                                                        .toUpperCase(),
                                                    maxLines: 1,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.w900,
                                                      fontSize: 23,
                                                      color: Color.fromARGB(
                                                          255, 0, 148, 149),
                                                    ),
                                                  ),
                                                ),
                                                const Text(
                                                  "Find your best doctor here",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w300,
                                                    fontSize: 18,
                                                    color: Color.fromARGB(
                                                        255, 0, 148, 149),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        IconButton(
                                            onPressed: () {
                                              // BlocProvider.of<DummyBloc>(
                                              //         context)
                                              //     .add(uploaddDummyEvent());
                                            },
                                            icon: const Icon(
                                              Icons.favorite_sharp,
                                              size: 30,
                                              color: Color.fromARGB(
                                                  255, 0, 148, 149),
                                            ))
                                      ],
                                    ),
                                  );
                                }
                              }
                              return Container();
                            }))
                  ],
                ),
              ),
              HomeSpecialist(),
            ],
          ),
        ),
      ),
    );
  }
}
