import 'package:doctors_book_app/utility/constants.dart';
import 'package:flutter/material.dart';
import 'package:doctors_book_app/view/screens/doctorsdetails/widgets/endcontainer.dart';
import 'package:doctors_book_app/view/screens/doctorsdetails/widgets/middlecontainer.dart';

class DoctorsDetailsScreen extends StatelessWidget {
  const DoctorsDetailsScreen({
    Key? key,
    required this.doctorsdatails,
  }) : super(key: key);
  final Map<String, dynamic> doctorsdatails;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colorpalette.secondarycolor,
        body: SafeArea(
            child: SingleChildScrollView(
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Stack(
              children: [
                Positioned(
                  child: Stack(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 1.24,
                      ),
                      Container(
                        decoration: const BoxDecoration(),
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.69,
                        child: Image.network(
                          doctorsdatails['image'],
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        left: 20,
                        top: 20,
                        child: Container(
                          width: 36,
                          height: 36,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color:
                                      const Color.fromARGB(255, 188, 187, 187)),
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white),
                          child: IconButton(
                            icon: const Icon(
                              Icons.arrow_back,
                              size: 22,
                              color: Colorpalette.backarrowcolor,
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                    top: MediaQuery.of(context).size.height * 0.43,
                    child: Endcontainer(
                      doctorsdatails: doctorsdatails,
                    )),
                Positioned(
                  top: MediaQuery.of(context).size.height * 0.37,
                  left: MediaQuery.of(context).size.width * 0.07,
                  child: Middlecontainer(
                    doctorsdatails: doctorsdatails,
                  ),
                ),
              ],
            ),
          ),
        )));
  }
}
