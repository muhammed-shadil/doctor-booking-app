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