import 'package:doctors_book_app/firebase_options.dart';
import 'package:doctors_book_app/view/screens/login_screen.dart';
import 'package:doctors_book_app/view/screens/settings_Screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async{

 WidgetsFlutterBinding.ensureInitialized();
 
await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  runApp( const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  const MaterialApp(
      home: SettingsScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
