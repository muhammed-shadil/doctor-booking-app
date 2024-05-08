// import 'package:flutter/material.dart';

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
        
//         body: CustomPaint(
//           painter: CurvePainter(),
//           child: Container(
//            // Adjust the size of the circle
//           ),
//         ),
//       ),
//     );
//   }
// }

// // Custom painter to draw a half circle in reverse
// // class CurvePainter extends CustomPainter {
// //   @override
// //   void paint(Canvas canvas, Size size) {
// //     var paint = Paint();
// //     paint.color =  Color.fromARGB(98, 169, 219, 230);
// //     paint.style = PaintingStyle.fill; // Change this to fill

// //     var path = Path();

// //     path.moveTo(0, size.height * 0.125);
// //     path.quadraticBezierTo(
// //         size.width / 2, size.height / 2.7, size.width, size.height * 0.125);
// //     path.lineTo(size.width, 0);
// //     path.lineTo(0, 0);

// //     canvas.drawPath(path, paint);
// //   }

// //   @override
// //   bool shouldRepaint(CustomPainter oldDelegate) {
// //     return true;
// //   }
// // }
// class CurvePainter extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     var paint = Paint();
//     paint.color =  Color.fromARGB(98, 169, 219, 230);
//     paint.style = PaintingStyle.fill; // Change this to fill

//     var path = Path();

//     path.moveTo(0, size.height * 0.05);
//     path.quadraticBezierTo(
//         size.width / 2, size.height / 4, size.width, size.height * 0.05);
//     path.lineTo(size.width, 0);
//     path.lineTo(0, 0);

//     canvas.drawPath(path, paint);
//   }

//   @override
//   bool shouldRepaint(CustomPainter oldDelegate) {
//     return true;
//   }
// }




























// // ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'dart:async';

// import 'package:connectivity_plus/connectivity_plus.dart';
// import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:font_awesome_icon_class/font_awesome_icon_class.dart';
// import 'package:internet_connection_checker/internet_connection_checker.dart';

// import 'package:doctors_book_app/controller/bottomnavigation/bloc/bottomnavigation_bloc.dart';
// import 'package:doctors_book_app/controller/networkcheckerbloc/bloc/networkcheck_bloc.dart';
// import 'package:doctors_book_app/view/screens/doctorsdetails_screen.dart';
// import 'package:doctors_book_app/view/screens/doctorslistscreen.dart';
// import 'package:doctors_book_app/view/screens/homepage/home_screen.dart';
// import 'package:doctors_book_app/view/screens/searchscreen.dart';
// import 'package:doctors_book_app/view/screens/settings_Screen.dart';

// class BottomNavigationWrapper extends StatefulWidget {
//   const BottomNavigationWrapper({super.key});

//   @override
//   State<BottomNavigationWrapper> createState() =>
//       _BottomNavigationWrapperState();
// }

// class _BottomNavigationWrapperState extends State<BottomNavigationWrapper> {
//   @override
//   Widget build(BuildContext context) {
//     return MultiBlocProvider(
//       providers: [
//         BlocProvider(
//           create: (context) => BottomnavigationBloc(),
//         ),
//         BlocProvider(
//           create: (context) => NetworkcheckBloc(),
//         ),
//       ],
//       child: BlocBuilder<NetworkcheckBloc, NetworkcheckState>(
//         builder: (context, state) {
//           if (state is isAlertSetState) {
//             return BottomNavigation(
//               isAlertSet: state.isalerted,
//             );
//           }
//           return Container();
//         },
//       ),
//     );
//   }
// }

// class BottomNavigation extends StatefulWidget {
//   BottomNavigation({
//     Key? key,
//     required this.isAlertSet,
//   }) : super(key: key);
//   final bool isAlertSet;
//   @override
//   State<BottomNavigation> createState() => _BottomNavigationState();
// }

// class _BottomNavigationState extends State<BottomNavigation> {
//   List<Widget> screens = [
//     HomeScreenWrapper(),
//     DoctorsScreen(),
//     SearchScreen(),
//     settingsScreenWrapper(),
//     settingsScreenWrapper()
//   ];

//   var isDeviceConnected = false;
//   late StreamSubscription subscription;

//   @override
//   void initState() {
//     super.initState();
//     getConnectivity();
//   }

//   getConnectivity() => subscription =
//           Connectivity().onConnectivityChanged.listen((result) async {
//         isDeviceConnected = await InternetConnectionChecker().hasConnection;
//         if (!isDeviceConnected && widget.isAlertSet == false) {
//           showDialogBox();
//           BlocProvider.of<NetworkcheckBloc>(context)
//               .add(isAlertSetEvent(isalert: true));
//           // setState(() {
//           //   isAlertSet = true;
//           // });
//         }
//       });

//   @override
//   void dispose() {
//     subscription.cancel();
//     super.dispose();
//   }

//   showDialogBox() => showDialog(
//         context: context,
//         builder: (context) => AlertDialog(
//           backgroundColor: const Color.fromARGB(255, 238, 219, 225),
//           icon: const Icon(
//             Icons.warning_amber_rounded,
//             size: 35,
//           ),
//           iconColor: Colors.red,
//           title: const Text('No Network!'),
//           content:
//               const Text('Please check your Internet Connection or try again'),
//           actions: [
//             ElevatedButton(
//               style: ElevatedButton.styleFrom(
//                   backgroundColor: const Color.fromARGB(255, 234, 28, 80)),
//               onPressed: () async {
//                 Navigator.pop(context);

//                 BlocProvider.of<NetworkcheckBloc>(context)
//                     .add(isAlertSetEvent(isalert: false));
//                 // setState(() {
//                 //   isAlertSet = false;
//                 // });
//                 isDeviceConnected =
//                     await InternetConnectionChecker().hasConnection;
//                 if (!isDeviceConnected) {
//                   showDialogBox();

//                   BlocProvider.of<NetworkcheckBloc>(context)
//                       .add(isAlertSetEvent(isalert: true));
//                   // setState(() {
//                   //   isAlertSet = true;
//                   // });
//                 }
//               },
//               child: const Text('OK', style: TextStyle(color: Colors.white)),
//             )
//           ],
//         ),
//       );

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<BottomnavigationBloc, BottomnavigationState>(
//         builder: (context, state) {
//       if (state is BottomnavigationInitial) {
//         return Scaffold(
//           body: screens[state.changedindex],
//           bottomNavigationBar: SizedBox(
//             width: MediaQuery.of(context).size.width,
//             height: 67,
//             child: FlashyTabBar(
//               height: 55,
//               iconSize: 28,
//               selectedIndex: state.changedindex,
//               animationCurve: Curves.linear,
//               animationDuration: const Duration(milliseconds: 500),
//               showElevation: true,
//               onItemSelected: (index) =>
//                   BlocProvider.of<BottomnavigationBloc>(context)
//                       .add(ChangeindexEvent(changeindex: index)),
//               items: [
//                 FlashyTabBarItem(
//                   icon: const FaIcon(
//                     FontAwesomeIcons.houseChimneyMedical,
//                     size: 23,
//                   ),
//                   title: const Text('HOME', style: TextStyle(fontSize: 12)),
//                   activeColor: Color.fromARGB(255, 0, 148, 149),
//                 ),
//                 FlashyTabBarItem(
//                   icon: const FaIcon(
//                     FontAwesomeIcons.stethoscope,
//                     size: 23,
//                   ),
//                   title: const Text('DOCTORS', style: TextStyle(fontSize: 12)),
//                 ),
//                 FlashyTabBarItem(
//                   icon: const Icon(Icons.search),
//                   title: Text('SEARCH', style: TextStyle(fontSize: 12)),
//                 ),
//                 FlashyTabBarItem(
//                   icon: const Icon(Icons.library_books_outlined),
//                   title: const Text(
//                     'APPOINTMENT',
//                     style: TextStyle(fontSize: 9),
//                   ),
//                 ),
//                 FlashyTabBarItem(
//                   icon: const Icon(Icons.settings),
//                   title: const Text('SETTINGS', style: TextStyle(fontSize: 12)),
//                 ),
//               ],
//             ),
//           ),
//         );
//       }
//       return Container();
//     });
//   }
// }
