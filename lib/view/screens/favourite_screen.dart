import 'package:db_miner_07/controller/quotes_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    QuotesController quotesController = Get.put(QuotesController());
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "FavouriteScreen",
          ),
        ),
        body: Obx(() {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
                height: 450,
                width: 380,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: ListView.builder(
                  itemCount: quotesController.favouriteList.length,
                  itemBuilder: (context, index) => ListTile(
                    title: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            quotesController.favouriteList[index].quote!,
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Text(
                              quotesController.favouriteList[index].author!,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                              ),
                            ),
                          ),SizedBox(height: 10),
                          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(Icons.share,size: 40,),
                              Icon(Icons.delete,size: 40,),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                )),
          );
        }));
  }
}
