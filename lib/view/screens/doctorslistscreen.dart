import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DoctorsScreen extends StatelessWidget {
  const DoctorsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 240, 240, 241),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text("Doctors"),
        centerTitle: true,
        leading: Container(
          width: 20,
          height: 26,
          decoration: BoxDecoration(
              border:
                  Border.all(color: const Color.fromARGB(255, 188, 187, 187)),
              borderRadius: BorderRadius.circular(10),
              color: Colors.white),
          child: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              size: 22,
              color: Color.fromARGB(255, 151, 151, 150),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
      ),
      body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection("doctors").snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                shrinkWrap: true,
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (BuildContext context, int index) {
                  // final category = snapshot.data?.docs[index].data();
                  // if (category != null) {
                  final doctorsdata = snapshot.data!.docs[index].data();
                  return Card(
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
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Image.network(
                                      doctorsdata['image'],
                                      fit: BoxFit.cover,
                                    ),
                                  )),
                          Expanded(
                            flex: 3,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(doctorsdata['doctorname']
                                    .toString()
                                    .toUpperCase()),
                                Text(doctorsdata['speciality']),
                                Text(doctorsdata['time']),
                              ],
                            ),
                          ),
                          const Expanded(
                              flex: 1, child: Icon(Icons.heart_broken_sharp)),
                        ],
                      ),
                    ),
                  );
                },
              );
            }
            return Container();
          }),
    );
  }
}
