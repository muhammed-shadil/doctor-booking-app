import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String name = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 240, 240, 241),
        appBar: AppBar(
            backgroundColor: const Color.fromARGB(255, 240, 240, 241),
            toolbarHeight: 100,
            title: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    "Search Doctors",
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        color: Color.fromARGB(255, 118, 115, 115)),
                  ),
                ),
                TextField(
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(8),
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.7),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14),
                        borderSide:
                            const BorderSide(width: 0, style: BorderStyle.none),
                      ),
                      // border: OutlineInputBorder(borderSide: BorderSide(color: Colors.transparent),borderRadius: BorderRadius.circular(10)
                      //    ),
                      suffixIcon: Icon(Icons.search),
                      hintStyle: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w300,
                          color: Color.fromARGB(255, 186, 184, 184)),
                      hintText: 'Search your doctor.....'),
                  onChanged: (val) {
                    setState(() {
                      name = val;
                    });
                  },
                ),
              ],
            )),
        body: StreamBuilder<QuerySnapshot>(
            stream:
                FirebaseFirestore.instance.collection('doctors').snapshots(),
            builder: (context, snapshots) {
              if (snapshots.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshots.hasError) {
                return Text('something went wrong');
              } else if (snapshots.hasData) {
                return ListView.builder(
                    itemCount: snapshots.data!.docs.length,
                    itemBuilder: (context, index) {
                      var data = snapshots.data!.docs[index].data()
                          as Map<String, dynamic>;

                      // if (name.isEmpty) {
                      //   return ListTile(
                      //     title: Text(
                      //       data['doctorname'],
                      //       maxLines: 1,
                      //       overflow: TextOverflow.ellipsis,
                      //       style: TextStyle(
                      //           color: Colors.black54,
                      //           fontSize: 16,
                      //           fontWeight: FontWeight.bold),
                      //     ),
                      //     subtitle: Text(
                      //       data['speciality'],
                      //       maxLines: 1,
                      //       overflow: TextOverflow.ellipsis,
                      //       style: TextStyle(
                      //           color: Colors.black54,
                      //           fontSize: 16,
                      //           fontWeight: FontWeight.bold),
                      //     ),
                      //     leading: CircleAvatar(
                      //       backgroundImage: NetworkImage(data['image']),
                      //     ),
                      //   );
                      // }
                      if (data['doctorname']
                          .toString()
                          .toLowerCase()
                          .contains(name.toLowerCase())) {
                        return ListTile(
                          title: Text(
                            data['doctorname'],
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: Colors.black54,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(
                            data['speciality'],
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: Colors.black54,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                          leading: CircleAvatar(
                            backgroundImage: NetworkImage(data['image']),
                          ),
                        );
                      }
                      return Container();
                    });
              }
              return Container();
            }));
  }
}
// ignore_for_file: prefer_const_constructors
