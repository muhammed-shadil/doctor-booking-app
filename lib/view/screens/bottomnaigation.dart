import 'package:doctors_book_app/controller/bottomnavigation/bloc/bottomnavigation_bloc.dart';
import 'package:doctors_book_app/view/screens/doctorsdetails_screen.dart';
import 'package:doctors_book_app/view/screens/doctorslistscreen.dart';
import 'package:doctors_book_app/view/screens/homepage/home_screen.dart';
import 'package:doctors_book_app/view/screens/settings_Screen.dart';
import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_icon_class/font_awesome_icon_class.dart';

class BottomNavigationWrapper extends StatelessWidget {
  const BottomNavigationWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BottomnavigationBloc(),
      child: BottomNavigation(),
    );
  }
}

class BottomNavigation extends StatelessWidget {
  BottomNavigation({super.key});

  List<Widget> screens = [
    HomeScreenWrapper(),
    DoctorsScreen(),
    // HomeScreenWrapper(),
    // DoctorsDetailsScreen(),
    HomeScreenWrapper(),

    settingsScreenWrapper(),
    settingsScreenWrapper()
  ];
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomnavigationBloc, BottomnavigationState>(
        builder: (context, state) {
      if (state is BottomnavigationInitial) {
        return Scaffold(
          body: screens[state.changedindex],
          bottomNavigationBar: SizedBox(width: MediaQuery.of(context).size.width,height: 67,
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
