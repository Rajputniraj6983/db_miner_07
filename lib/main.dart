import 'package:db_miner_07/view/screens/Splashscreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'view/screens/quotes_screen.dart';
void main()
{
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: Splashscreen(),
    );
  }
}
