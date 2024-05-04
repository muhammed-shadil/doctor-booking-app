import 'package:doctors_book_app/controller/bottomnavigation/bloc/bottomnavigation_bloc.dart';
import 'package:doctors_book_app/view/screens/doctorsdetails_screen.dart';
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
    HomeScreenWrapper(),
    DoctorsDetailsScreen(),
    HomeScreenWrapper(),
    settingsScreenWrapper()
  ];
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomnavigationBloc, BottomnavigationState>(
        builder: (context, state) {
      if (state is BottomnavigationInitial) {
        return Scaffold(
          body: screens[state.changedindex],
          bottomNavigationBar: FlashyTabBar(height: 55,iconSize: 28,
            selectedIndex: state.changedindex,
            animationCurve: Curves.linear,
            animationDuration: const Duration(milliseconds: 500),
            showElevation: true,
            onItemSelected: (index) =>
                BlocProvider.of<BottomnavigationBloc>(context)
                    .add(ChangeindexEvent(changeindex: index)),
            items: [
              FlashyTabBarItem(
                icon:FaIcon(FontAwesomeIcons.houseChimneyMedical),
                title: Text('Events'),
              ),
              FlashyTabBarItem(
                icon: Icon(Icons.search),
                title: Text('Search'),
              ),
              FlashyTabBarItem(
                icon: Icon(Icons.highlight),
                title: Text('Highlights'),
              ),
              FlashyTabBarItem(
                icon: Icon(Icons.settings),
                title: Text('Settings'),
              ),
              FlashyTabBarItem(
                icon: Icon(Icons.settings),
                title: Text('한국어'),
              ),
            ],
          ),
        );
      }
      return Container();
    });
  }
}
