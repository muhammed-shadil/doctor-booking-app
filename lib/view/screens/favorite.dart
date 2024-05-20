import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctors_book_app/controller/favorite/bloc/favorite_bloc.dart';
import 'package:doctors_book_app/utility/constants.dart';
import 'package:doctors_book_app/view/screens/doctorsdetails_screen.dart';
import 'package:favorite_button/favorite_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FavoriteScreenWrpper extends StatelessWidget {
  const FavoriteScreenWrpper({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FavoriteBloc(),
      child: FavoriteScreen(),
    );
  }
}

class FavoriteScreen extends StatelessWidget {
  FavoriteScreen({super.key});

  final user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 240, 240, 241),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text("FAVORITES", style: Textstyles.pagetitlestyle),
          centerTitle: true,
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection("users")
                    .doc(user!.uid)
                    .collection('favorite')
                    .snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                    return const Center(
                        child: Text("No favorite doctors found."));
                  }
                  final favoriteIds =
                      snapshot.data!.docs.map((doc) => doc.id).toList();
                  if (snapshot.data == null) {
                    return Container();
                  } else {
                    return Column(children: [
                      StreamBuilder(
                          stream: FirebaseFirestore.instance
                              .collection("doctors")
                              .where("uid", whereIn: favoriteIds)
                              .snapshots(),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return SizedBox(
                                width: MediaQuery.of(context).size.width * 0.88,
                                height:
                                    MediaQuery.of(context).size.height * 0.6,
                                child: const Center(
                                  child: CircularProgressIndicator(),
                                ),
                              );
                            } else if (!snapshot.hasData ||
                                snapshot.data!.docs.isEmpty) {
                              return const Center(
                                  child: Text("No favorite doctors found."));
                            } else if (snapshot.hasData) {
                              return BlocBuilder<FavoriteBloc, FavoriteState>(
                                builder: (context, state) {
                                  final favorite =
                                      BlocProvider.of<FavoriteBloc>(context);

                                  return ListView.builder(
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount: snapshot.data!.docs.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      final doctorsdata =
                                          snapshot.data!.docs[index].data();
                                      return GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (_) =>
                                                      DoctorsDetailsScreen(
                                                          doctorsdatails:
                                                              doctorsdata)));
                                        },
                                        child: Card(
                                          color: Colors.white,
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 10,
                                                right: 10,
                                                top: 15,
                                                bottom: 15),
                                            child: Row(
                                              children: [
                                                (doctorsdata['image'] == null)
                                                    ? const Expanded(
                                                        flex: 1,
                                                        child: CircleAvatar(
                                                          child: Icon(
                                                              Icons.person),
                                                        ))
                                                    : Expanded(
                                                        flex: 1,
                                                        child: Container(
                                                          width: 50,
                                                          height: 70,
                                                          clipBehavior:
                                                              Clip.antiAlias,
                                                          decoration: BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10)),
                                                          child: Image.network(
                                                            doctorsdata[
                                                                'image'],
                                                            fit: BoxFit.cover,
                                                          ),
                                                        )),
                                                const SizedBox(
                                                  width: 8,
                                                ),
                                                Expanded(
                                                  flex: 3,
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        doctorsdata[
                                                                'doctorname']
                                                            .toString()
                                                            .toUpperCase(),
                                                        style:  TextStyle(
                                                            fontSize: 18.sp,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            color:
                                                                const Color.fromRGBO(
                                                                    122,
                                                                    118,
                                                                    118,
                                                                    1)),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .symmetric(
                                                                vertical: 4),
                                                        child: Text(
                                                          doctorsdata[
                                                              'speciality'],
                                                          style:
                                                              const TextStyle(
                                                                  color: Color
                                                                      .fromARGB(
                                                                          255,
                                                                          121,
                                                                          120,
                                                                          120)),
                                                        ),
                                                      ),
                                                      Text(
                                                        doctorsdata['time'],
                                                        style: const TextStyle(
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    75,
                                                                    74,
                                                                    74)),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Expanded(
                                                    flex: 1,
                                                    child: FavoriteButton(
                                                      iconSize: 35,
                                                      iconColor: Colorpalette
                                                          .primarycolor,
                                                      valueChanged:
                                                          (valueChanged) {
                                                        favorite.add(
                                                            DocFavoriteEvent(
                                                                isFavorite:
                                                                    valueChanged,
                                                                doctorid:
                                                                    doctorsdata[
                                                                        'uid']));
                                                      },
                                                      isFavorite: (snapshot
                                                              .data!
                                                              .docs
                                                              .isEmpty)
                                                          ? false
                                                          : true,
                                                    )),
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                },
                              );
                            }
                            return Container();
                          }),
                    ]);
                  }
                }),
          ),
        ));
  }
}
