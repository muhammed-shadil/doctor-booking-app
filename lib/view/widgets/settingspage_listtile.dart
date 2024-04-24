import 'package:flutter/material.dart';

class SettingsListTile extends StatelessWidget {
  const SettingsListTile({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 80,
      width: 370,
      child: ListTile(
        trailing: Icon(Icons.arrow_forward_ios),
        title: Text(
          "About Us",
        ),
        titleTextStyle:
            TextStyle(fontSize: 20, color: Color.fromARGB(255, 118, 114, 114)),
        leading: CircleAvatar(
          backgroundColor: Color.fromARGB(255, 207, 230, 231),
          radius: 30,
          child: Icon(
            Icons.info,
            size: 33,
            color: Color.fromARGB(255, 0, 148, 149),
          ),
        ),
        // tileColor: Color.fromARGB(255, 205, 204, 200),
      ),
    );
  }
}
