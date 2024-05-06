import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:doctors_book_app/controller/bottomnavigation/bloc/bottomnavigation_bloc.dart';
import 'package:doctors_book_app/view/screens/doctorsdetails_screen.dart';
import 'package:doctors_book_app/view/screens/doctorslistscreen.dart';
import 'package:doctors_book_app/view/screens/homepage/home_screen.dart';
import 'package:doctors_book_app/view/screens/settings_Screen.dart';
import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_icon_class/font_awesome_icon_class.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class BottomNavigationWrapper extends StatefulWidget {
  const BottomNavigationWrapper({super.key});

  @override
  State<BottomNavigationWrapper> createState() =>
      _BottomNavigationWrapperState();
}

class _BottomNavigationWrapperState extends State<BottomNavigationWrapper> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BottomnavigationBloc(),
      child: BottomNavigation(),
    );
  }
}

class BottomNavigation extends StatefulWidget {
  BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  List<Widget> screens = [
    HomeScreenWrapper(),
    DoctorsScreen(),
    // HomeScreenWrapper(),
    // DoctorsDetailsScreen(),
    HomeScreenWrapper(),

    settingsScreenWrapper(),
    settingsScreenWrapper()
  ];

  var isDeviceConnected = false;
  late StreamSubscription subscription;
  bool isAlertSet = false;

  @override
  void initState() {
    super.initState();
    getConnectivity();
  }

  getConnectivity() => subscription =
          Connectivity().onConnectivityChanged.listen((result) async {
        isDeviceConnected = await InternetConnectionChecker().hasConnection;
        if (!isDeviceConnected && isAlertSet == false) {
          showDialogBox();
          setState(() {
            isAlertSet = true;
          });
        }
      });

  @override
  void dispose() {
    subscription.cancel();
    super.dispose();
  }

  showDialogBox() => showDialog(
        context: context,
        builder: (context) => AlertDialog(
          backgroundColor: const Color.fromARGB(255, 238, 219, 225),
          icon: const Icon(
            Icons.warning_amber_rounded,
            size: 35,
          ),
          iconColor: Colors.red,
          title: const Text('No Network!'),
          content: const Text('Please check your Internet Connection or try again'),
          actions: [
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 234, 28, 80)),
                onPressed: () async {
                  Navigator.pop(context);
                  setState(() {
                    isAlertSet = false;
                  });
                  isDeviceConnected =
                      await InternetConnectionChecker().hasConnection;
                  if (!isDeviceConnected) {
                    showDialogBox();
                    setState(() {
                      isAlertSet = true;
                    });
                  }
                },
                child: const Text('OK',style: TextStyle(color: Colors.white)),)
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomnavigationBloc, BottomnavigationState>(
        builder: (context, state) {
      if (state is BottomnavigationInitial) {
        return Scaffold(
          body: screens[state.changedindex],
          bottomNavigationBar: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 67,
            child: FlashyTabBar(
              height: 55,
              iconSize: 28,
              selectedIndex: state.changedindex,
              animationCurve: Curves.linear,
              animationDuration: const Duration(milliseconds: 500),
              showElevation: true,
              onItemSelected: (index) =>
                  BlocProvider.of<BottomnavigationBloc>(context)
                      .add(ChangeindexEvent(changeindex: index)),
              items: [
                FlashyTabBarItem(
                  icon: const FaIcon(
                    FontAwesomeIcons.houseChimneyMedical,
                    size: 23,
                  ),
                  title: const Text('HOME'),
                  activeColor: Color.fromARGB(255, 0, 148, 149),
                ),
                FlashyTabBarItem(
                  icon: const FaIcon(
                    FontAwesomeIcons.stethoscope,
                    size: 23,
                  ),
                  title: const Text('DOCTORS'),
                ),
                FlashyTabBarItem(
                  icon: const Icon(Icons.search),
                  title: Text('SEARCH'),
                ),
                FlashyTabBarItem(
                  icon: const Icon(Icons.library_books_outlined),
                  title: Text('APPOINTMENT'),
                ),
                FlashyTabBarItem(
                  icon: const Icon(Icons.settings),
                  title: const Text('SETTINGS'),
                ),
              ],
            ),
          ),
        );
      }
      return Container();
    });
  }
}
