import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctors_book_app/utility/constants.dart';
import 'package:doctors_book_app/view/screens/doctors_details/doctors_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({
    Key? key,
    required this.title,
  }) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Category", style: Textstyles.pagetitlestyle),
      ),
      body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection("doctors")
              .where("speciality", isEqualTo: title)
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (BuildContext context, int index) {
                  final doctorspecial = snapshot.data!.docs[index].data();
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => DoctorsDetailsScreen(
                                  doctorsdatails: doctorspecial)));
                    },
                    child: Card(
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 10, right: 10, top: 15, bottom: 15),
                        child: Row(
                          children: [
                            (doctorspecial['image'] == null)
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
                                              BorderRadius.circular(10)),
                                      child: Image.network(
                                        doctorspecial['image'],
                                        fit: BoxFit.cover,
                                      ),
                                    )),
                            const SizedBox(
                              width: 8,
                            ),
                            Expanded(
                              flex: 3,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    doctorspecial['doctorname']
                                        .toString()
                                        .toUpperCase(),
                                    style: TextStyle(
                                        fontSize: 18.sp,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 4),
                                    child: Text(
                                      doctorspecial['speciality'],
                                      style: const TextStyle(
                                          color: Color.fromARGB(
                                              255, 121, 120, 120)),
                                    ),
                                  ),
                                  Text(
                                    doctorspecial['time'],
                                    style: const TextStyle(
                                        color: Color.fromARGB(255, 75, 74, 74)),
                                  ),
                                ],
                              ),
                            ),
                            const Expanded(
                                flex: 1,
                                child: Icon(
                                  Icons.arrow_forward_ios,
                                  color: Colorpalette.primarycolor,
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
    );
  }
}
