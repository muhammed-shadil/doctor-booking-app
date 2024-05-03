import 'package:flutter/material.dart';

class Middlecontainer extends StatelessWidget {
  const Middlecontainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: Colors.white,
      ),
      width: MediaQuery.of(context).size.width * 0.85,
      height: MediaQuery.of(context).size.height * 0.11,
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CircleAvatar(
            backgroundColor: Color.fromARGB(255, 237, 235, 235),
            child: Icon(
              Icons.people_alt,
              color: Color.fromARGB(255, 0, 148, 149),
              size: 25,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "1000+",
                style: TextStyle(
                    fontSize: 18, color: Color.fromARGB(255, 92, 91, 91)),
              ),
              Text("Patients",
                  style: TextStyle(color: Color.fromARGB(255, 148, 146, 146)))
            ],
          ),
          VerticalDivider(),
          CircleAvatar(
            backgroundColor: Color.fromARGB(255, 237, 235, 235),
            child: Icon(
              Icons.badge,
              color: Color.fromARGB(255, 0, 148, 149),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("5 Years",
                  style: TextStyle(
                      fontSize: 18, color: Color.fromARGB(255, 92, 91, 91))),
              Text("Experiences",
                  style: TextStyle(color: Color.fromARGB(255, 148, 146, 146)))
            ],
          ),
        ],
      ),
    );
  }
}
