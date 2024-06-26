import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctors_book_app/controller/authentication/bloc/auth_bloc.dart';
import 'package:doctors_book_app/utility/constants.dart';
import 'package:doctors_book_app/view/screens/favorite.dart';
import 'package:doctors_book_app/view/screens/homepage/home_screen2.dart';
import 'package:doctors_book_app/view/screens/homepage/widgets/home_textfield.dart';
import 'package:doctors_book_app/view/screens/search_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreenWrapper extends StatelessWidget {
  const HomeScreenWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthBloc(),
        ),
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
    return Scaffold(
      backgroundColor: Colorpalette.secondarycolor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
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
                      height: MediaQuery.of(context).size.height * 0.17,
                    ),
                    Positioned(
                        top: MediaQuery.of(context).size.height * 0.13,
                        left: MediaQuery.of(context).size.width * 0.093,
                        child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.83,
                            height: MediaQuery.of(context).size.height * 0.074,
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) =>
                                            const SearchScreenWrapper()));
                              },
                              child: HomeTextfield1(
                                icon1: const Icon(Icons.search_rounded),
                                hint: "Search doctors,category..........",
                                validator: (_) {},
                              ),
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
                                                SizedBox(
                                                  width: 179,
                                                  child: Text(
                                                    "${userData['username']}"
                                                        .toUpperCase(),
                                                    maxLines: 1,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w900,
                                                      fontSize: 23.sp,
                                                      color:
                                                          const Color.fromARGB(
                                                              255, 0, 148, 149),
                                                    ),
                                                  ),
                                                ),
                                                Text(
                                                  "Find your best doctor here",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w300,
                                                    fontSize: 18.sp,
                                                    color: const Color.fromARGB(
                                                        255, 0, 148, 149),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            color: Colors.white,
                                          ),
                                          padding: const EdgeInsets.all(4),
                                          margin:
                                              const EdgeInsets.only(right: 10),
                                          child: GestureDetector(
                                              onTap: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (_) =>
                                                            const FavoriteScreenWrpper()));
                                              },
                                              child: const Icon(
                                                Icons.favorite_sharp,
                                                size: 28,
                                                color: Color.fromARGB(
                                                    255, 0, 148, 149),
                                              )),
                                        )
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
