import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:doctors_book_app/controller/bottomnavigation/bloc/bottomnavigation_bloc.dart';
import 'package:doctors_book_app/utility/constants.dart';
import 'package:doctors_book_app/view/screens/appointments_screen.dart';
import 'package:doctors_book_app/view/screens/doctors_list_screen.dart';
import 'package:doctors_book_app/view/screens/homepage/home_screen.dart';
import 'package:doctors_book_app/view/screens/search_screen.dart';
import 'package:doctors_book_app/view/screens/settings_screen/settings_Screen.dart';
import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_icon_class/font_awesome_icon_class.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:telephony/telephony.dart';

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
      child: const BottomNavigation(),
    );
  }
}

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  List<Widget> screens = [
    const HomeScreenWrapper(),
    const DoctorsListwrpper(),
    const SearchScreenWrapper(),
    const AppointmentScreenWrapper(),
    const settingsScreenWrapper()
  ];

  var isDeviceConnected = false;
  late StreamSubscription subscription;
  bool isAlertSet = false;

  final telephony = Telephony.instance;
  @override
  void initState() {
    super.initState();
    getConnectivity();
    smspermission();
  }

  smspermission() async {
    bool? permissionsGranted = await telephony.requestPhoneAndSmsPermissions;
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
        barrierDismissible: false,
        context: context,
        builder: (context) => AlertDialog(
          backgroundColor: const Color.fromARGB(255, 238, 219, 225),
          icon: const Icon(
            Icons.warning_amber_rounded,
            size: 35,
          ),
          iconColor: Colors.red,
          title: const Text('No Network!'),
          content:
              const Text('Please check your Internet Connection or try again'),
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
              child: const Text('OK', style: TextStyle(color: Colors.white)),
            )
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
                  title: Text('HOME', style: TextStyle(fontSize: 12.sp)),
                  activeColor: Colorpalette.primarycolor,
                ),
                FlashyTabBarItem(
                  icon: const FaIcon(
                    FontAwesomeIcons.stethoscope,
                    size: 23,
                  ),
                  title: Text('DOCTORS', style: TextStyle(fontSize: 12.sp)),
                ),
                FlashyTabBarItem(
                  icon: const Icon(Icons.search),
                  title: Text('SEARCH', style: TextStyle(fontSize: 12.sp)),
                ),
                FlashyTabBarItem(
                  icon: const Icon(Icons.library_books_outlined),
                  title: Text(
                    'APPOINTMENT',
                    style: TextStyle(fontSize: 9.sp),
                  ),
                ),
                FlashyTabBarItem(
                  icon: const Icon(Icons.settings),
                  title: Text('SETTINGS', style: TextStyle(fontSize: 12.sp)),
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
