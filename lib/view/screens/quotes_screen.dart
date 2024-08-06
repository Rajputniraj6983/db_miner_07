import 'package:db_miner_07/view/Theme_screen.dart';
import 'package:db_miner_07/view/screens/favourite_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_extend/share_extend.dart';

import '../../controller/quotes_controller.dart';

class QuotesScreen extends StatelessWidget {
  final QuotesController apiController = Get.put(QuotesController());

  QuotesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        if (apiController.isLoading.value) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return PageView.builder(
            scrollDirection: Axis.vertical,
            itemCount: apiController.quotesList.length,
            itemBuilder: (context, index) {
              final quote = apiController.quotesList[index];
              return Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images.jfif'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 40, left: 10),
                        child: Container(
                          height: 50,
                          width: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Icon(
                            Icons.menu,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                      ),
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(top: 40),
                        child: Container(
                          height: 50,
                          width: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Icon(
                            Icons.diamond,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 350),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '“${quote.quote}”',
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 24,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 8),
                          // Text(
                          //   '${quote.type}',
                          //   style: TextStyle(
                          //       color: Colors.black,
                          //       fontSize: 25,
                          //       letterSpacing: 2,
                          //       fontWeight: FontWeight.w900),
                          // ),
                          Text(
                            quote.author!,
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                  onPressed: () {
                                    ShareExtend.share(
                                        "${quote.quote}", "text");
                                  },
                                  icon: Icon(
                                    Icons.share,
                                    size: 40,
                                    color: Colors.white,
                                  )),
                              SizedBox(width: 15),
                              InkWell(onTap: () {
                                apiController.addFavorite(apiController.quotesList[index]);
                                Get.to(FavouriteScreen(),
                                    transition: Transition.upToDown);
                              },
                                child: Icon(
                                      Icons.favorite_border,
                                      size: 40,
                                      color: Colors.white,
                                    )),
                            ],
                          ),
                          SizedBox(height: 200),
                          Row(
                            children: [
                              InkWell(
                                onTap: () {
                                  Get.to(ThemeScreen(),
                                      transition: Transition.upToDown);
                                },
                                child: Container(
                                  height: 50,
                                  width: 100,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.white,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.grid_view,
                                          color: Colors.black,
                                        ),
                                        Text(
                                          "General",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 15),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: 15),
                              Container(
                                  height: 50,
                                  width: 50,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.white,
                                  ),
                                  child: Icon(Icons.star_border_purple500)),
                              SizedBox(width: 70),
                              Container(
                                  height: 50,
                                  width: 50,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.white,
                                  ),
                                  child: Icon(Icons.ac_unit_outlined)),
                              SizedBox(width: 15),
                              Container(
                                  height: 50,
                                  width: 50,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.white,
                                  ),
                                  child: Icon(Icons.person)),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
          );
        }
      }),
    );
  }
}
