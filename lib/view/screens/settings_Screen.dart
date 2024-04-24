import 'package:doctors_book_app/view/widgets/settingspage_listtile.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 240, 240, 241),
      body: Column(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.3,
            child: Stack(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(40),
                        bottomRight: Radius.circular(40)),
                    color: const Color.fromARGB(255, 0, 148, 149),
                  ),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.18,
                ),
                Positioned(
                  top: MediaQuery.of(context).size.width * 0.12,
                  left: MediaQuery.of(context).size.width * 0.38,
                  child: const Text(
                    "Settings",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 24,
                      color: Colors.white,
                    ),
                  ),
                ),
                Positioned(
                    top: MediaQuery.of(context).size.width * 0.24,
                    left: MediaQuery.of(context).size.width * 0.062,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      width: MediaQuery.of(context).size.width * 0.88,
                      height: MediaQuery.of(context).size.width * 0.235,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 13, right: 20),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.amberAccent,
                                  ),
                                  width: 65,
                                  height: 65,
                                ),
                              ),
                              const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Hello!",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w300,
                                      fontSize: 20,
                                      color: Color.fromARGB(255, 0, 148, 149),
                                    ),
                                  ),
                                  Text(
                                    "John samuel",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w900,
                                      fontSize: 23,
                                      color: Color.fromARGB(255, 0, 148, 149),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                          Container(
                            width: 33,
                            height: 36,
                            margin: const EdgeInsets.only(right: 7),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color:
                                    const Color.fromARGB(255, 226, 235, 237)),
                            child: IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.edit,
                                  size: 27,
                                  color: Color.fromARGB(255, 0, 148, 149),
                                )),
                          )
                        ],
                      ),
                    ))
              ],
            ),
          ),
          SettingsListTile(),
          SettingsListTile(),
          SettingsListTile(),
          SettingsListTile(),
          SettingsListTile(),
          // Container(
          //   decoration: BoxDecoration(
          //     borderRadius: BorderRadius.circular(10),
          //     color: Color.fromARGB(255, 205, 204, 200),
          //   ),
          //   width: 350,
          //   height: 85,
          //   child: const Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     children: [
          //       CircleAvatar(
          //         radius: 30,
          //       ),
          //       Text(
          //         "about us",
          //       ),
          //       Icon(Icons.arrow_forward_ios)
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }
}
