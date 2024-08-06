import 'package:db_miner_07/modal/theme_list.dart';
import 'package:db_miner_07/view/screens/quotes_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class ThemeScreen extends StatelessWidget {
  const ThemeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          InkWell(onTap: () {
            Get.to(QuotesScreen(),
                transition: Transition.upToDown);
          },child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('X', style: TextStyle(color: Colors.black, fontSize: 30)),
          )),
          SizedBox(width: 25),
          Text('Categories', style: TextStyle(color: Colors.black, fontSize: 30)),
          Spacer(),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: GridView.builder(
              scrollDirection: Axis.vertical,
              itemCount: imgList.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemBuilder: (context, index) => Container(height: 150,width: 150,
                margin: EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.green,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(imgList[index], fit: BoxFit.cover),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}