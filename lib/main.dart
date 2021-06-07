import 'package:flutter/material.dart';
import 'package:language_test/dialog/dialog_box_text.dart';
import 'package:language_test/dialog/game_dialog/end_game_dialog.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          child: Test(),
        ),
      ),
    );
  }
}

class Test extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Center(
      child: Container(
        height: size.height * .9,
        width: size.width * .9,
        child: const EndGameDialog(),
      ),
    );
  }
}

// class Test extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;

//     return Center(
//       child: Container(
//         height: size.width * 0.15,
//         width: size.width * 0.9,
//         child: CustomPaint(
//           painter: CustomTextBox(),
//           child: Center(
//             child: Text(
//               'TEXTO',
//               style: TextStyle(
//                 color: const Color(0xFFFFFFFF),
//                 fontWeight: FontWeight.w900,
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
