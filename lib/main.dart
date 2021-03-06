import 'package:flutter/material.dart';

import 'pages/bottom_reveal_animation.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      home: BottomRevealWidget(),
    );
  }
}
