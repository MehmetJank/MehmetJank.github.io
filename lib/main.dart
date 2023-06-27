import 'package:flutter/material.dart';

import 'screens/coming_soon_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'My Portfolio - Mehmet Jank',
      debugShowCheckedModeBanner: false,
      home: ComingSoon(),
    );
  }
}
