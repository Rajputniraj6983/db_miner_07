import 'package:db_miner_07/view/screens/quotes_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';

class Splashscreen extends StatelessWidget {
  const Splashscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InkWell(onTap: () {
          Get.to(QuotesScreen(),
              transition: Transition.upToDown);
        },child: Container(height: 350,width: 350,child: Image.asset('assets/image-removebg-preview.png',fit: BoxFit.cover,),)),
      ),
    );
  }
}
