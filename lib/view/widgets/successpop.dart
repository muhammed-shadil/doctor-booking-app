import 'package:doctors_book_app/view/widgets/alertconfirmbutton.dart';
import 'package:doctors_book_app/view/widgets/mainbutton.dart';
import 'package:flutter/material.dart';

class Successpop extends StatelessWidget {
  const Successpop(
      {super.key,
      required this.msg,
      this.iconColor,
      required this.icon,
      required this.onConfirm,
      required this.onReject});

  final String msg;
  final Color? iconColor;

  final IconData icon;
  final VoidCallback onConfirm;
  final VoidCallback onReject;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: AlertDialog(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(27)),
              side: BorderSide(color: Color.fromARGB(255, 44, 176, 176))),
          icon: Icon(
            icon,
            color: iconColor,
            size: 50,
          ),
          backgroundColor: Colors.white,
          title: Padding(
            padding: const EdgeInsets.only(top: 30, bottom: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "SUCCESS ",
                  style: TextStyle(
                      color: Color.fromARGB(255, 44, 176, 176),
                      fontWeight: FontWeight.w600,
                      fontSize: 29),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10, top: 10),
                  child: Text(msg,
                      style: const TextStyle(
                        fontSize: 21,
                        color: Color.fromARGB(255, 116, 116, 115),
                      ),
                      textAlign: TextAlign.center),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 13),
                  child: Alerlconfirmtbutton(
                    buttontext: "OK",
                    color: const Color.fromARGB(255, 115, 118, 145),
                    onpressed: onConfirm,
                  ),
                ),
              ],
            ),
          ),
          // actions: [

          // ],
        ),
      ),
    );
  }
}
