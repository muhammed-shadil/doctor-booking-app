import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctors_book_app/controller/searching%20bloc/bloc/search_bloc.dart';
import 'package:doctors_book_app/utility/constants.dart';
import 'package:doctors_book_app/view/screens/doctorsdetails_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchScreenWrapper extends StatelessWidget {
  const SearchScreenWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchBloc(),
      child: const SearchScreen(),
    );
  }
}

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String name = "";
  String specialty = "";
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(
      builder: (context, state) {
        if (state is SearchDoctorsState) {
          name = state.result;
          specialty = state.result;
        }
        return Scaffold(
            backgroundColor: const Color.fromARGB(255, 240, 240, 241),
            appBar: AppBar(
                automaticallyImplyLeading: false,
                backgroundColor: const Color.fromARGB(255, 240, 240, 241),
                toolbarHeight: 100,
                title: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Text("Search Doctors",
                          style: Textstyles.pagetitlestyle),
                    ),
                    TextField(autofocus: true,
                      decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(8),
                          filled: true,
                          fillColor: Colors.white.withOpacity(0.7),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14),
                            borderSide: const BorderSide(
                                width: 0, style: BorderStyle.none),
                          ),
                          suffixIcon: const Icon(Icons.search),
                          hintStyle: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w300,
                              color: Color.fromARGB(255, 186, 184, 184)),
                          hintText: 'Search your doctor.....'),
                      onChanged: (val) {
                        BlocProvider.of<SearchBloc>(context)
                            .add(SearchdoctorEvent(name: val));
                      },
                    ),
                  ],
                )),
            body: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('doctors')
                    .snapshots(),
                builder: (context, snapshots) {
                  if (snapshots.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (snapshots.hasError) {
                    return const Text('something went wrong');
                  } else if (snapshots.hasData) {
                    var filterDocs = snapshots.data!.docs.where((doc) {
                      var data = doc.data() as Map<String, dynamic>;
                      var matchesName = name.isEmpty ||
                          data['doctorname']
                              .toString()
                              .toLowerCase()
                              .contains(name.toLowerCase());
                      var matchesSpecialty = specialty.isEmpty ||
                          data['speciality']
                              .toString()
                              .toLowerCase()
                              .contains(specialty.toLowerCase());
                      return matchesName || matchesSpecialty;
                    }).toList();

                    if (filterDocs.isEmpty) {
                      return const Center(child: Text('No user found'));
                    }

                    return ListView.builder(
                        itemCount: snapshots.data!.docs.length,
                        itemBuilder: (context, index) {
                          var data = snapshots.data!.docs[index].data()
                              as Map<String, dynamic>;

                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => DoctorsDetailsScreen(
                                          doctorsdatails: data)));
                            },
                            child: ListTile(
                              title: Text(
                                data['doctorname'],
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                    color: Colors.black54,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                              subtitle: Text(
                                data['speciality'],
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                    color: Colors.black54,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400),
                              ),
                              leading: CircleAvatar(
                                backgroundImage: NetworkImage(data['image']),
                              ),
                            ),
                          );
                        });
                  }
                  return Container();
                }));
      },
    );
  }
}
