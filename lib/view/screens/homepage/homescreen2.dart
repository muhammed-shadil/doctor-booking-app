import 'package:doctors_book_app/view/widgets/homepage/specialistverticalscroll.dart';
import 'package:flutter/material.dart';

class HomeSpecialist extends StatelessWidget {
  const HomeSpecialist({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Specialist",
            style: TextStyle(fontSize: 23),
          ),
          SizedBox(
              height: 120,
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 10,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    // final category = snapshot.data?.docs[index].data();
                    // if (category != null) {
                    return const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Specialistverticalscroll(),
                    );
                  })),
        ],
      ),
    );
  }
}
