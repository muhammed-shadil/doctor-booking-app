import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctors_book_app/view/screens/doctorsdetails_screen.dart';
import 'package:flutter/material.dart';

class DoctorsScreen extends StatelessWidget {
  const DoctorsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: const Color.fromARGB(255, 240, 240, 241),
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            title: const Text(
              "DOCTORS",
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: Color.fromARGB(255, 118, 115, 115)),
            ),
            centerTitle: true,
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(children: [
                const Row(
                  children: [],
                ),
                StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection("doctors")
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return SizedBox(
                          width: MediaQuery.of(context).size.width * 0.88,
                          height: MediaQuery.of(context).size.height * 0.6,
                          child: const Center(
                            child: CircularProgressIndicator(),
                          ),
                        );
                      }
                      if (snapshot.hasData) {
                        return ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: snapshot.data!.docs.length,
                          itemBuilder: (BuildContext context, int index) {
                            final doctorsdata =
                                snapshot.data!.docs[index].data();
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => DoctorsDetailsScreen(
                                            doctorsdatails: doctorsdata)));
                              },
                              child: Card(
                                color: Colors.white,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10, right: 10, top: 15, bottom: 15),
                                  child: Row(
                                    children: [
                                      (doctorsdata['image'] == null)
                                          ? const Expanded(
                                              flex: 1,
                                              child: CircleAvatar(
                                                child: Icon(Icons.person),
                                              ))
                                          : Expanded(
                                              flex: 1,
                                              child: Container(
                                                width: 50,
                                                height: 70,
                                                clipBehavior: Clip.antiAlias,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10)),
                                                child: Image.network(
                                                  doctorsdata['image'],
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
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              doctorsdata['doctorname']
                                                  .toString()
                                                  .toUpperCase(),
                                              style: const TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w500,color: Color.fromARGB(255, 122, 118, 118)),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 4),
                                              child: Text(
                                                doctorsdata['speciality'],
                                                style: const TextStyle(
                                                    color: Color.fromARGB(
                                                        255, 121, 120, 120)),
                                              ),
                                            ),
                                            Text(
                                              doctorsdata['time'],
                                              style: const TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 75, 74, 74)),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const Expanded(
                                          flex: 1,
                                          child: Icon(
                                            Icons.favorite_border,
                                            color: Color.fromARGB(
                                                255, 0, 148, 149),
                                          )),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      }
                      return Container();
                    }),
              ]),
            ),
          )),
    );
  }
}
