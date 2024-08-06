import 'package:db_miner_07/modal/quotes_modal.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'quotes_db_helper.dart';

class QuotesController extends GetxController {
  var isLoading = true.obs;
  var quotesList = <QuotesModal>[].obs;
  var favouriteList = <QuotesModal>[].obs;

  final DatabaseHelper _dbHelper = DatabaseHelper();

  @override
  void onInit() {
    fetchQuotes();
    super.onInit();
  }

  void fetchQuotes() async {
    try {
      final response = await http.get(Uri.parse('https://sheetdb.io/api/v1/ljnaghvhgl8w5'));
      if (response.statusCode == 200) {
        List data = json.decode(response.body);
        quotesList.value = data.map((e) => QuotesModal.fromJson(e),).toList();
      }
    } finally {
      isLoading.value = false;
    }
  }
  void fetchFavorites() async {
    List data = await _dbHelper.getFavorites();
    favouriteList.value = data.map((e) => QuotesModal.fromJson(e),).toList();
  }
  void addFavorite(QuotesModal quoteModal) async {
   Map<String,dynamic> quote= {
      "quote": quoteModal.quote,
    "author": quoteModal.author,
    "type": quoteModal.type
  };
    await _dbHelper.insertFavorite(quote);
    favouriteList.add(quoteModal);
  }
  void removeFavorite(Map<String, dynamic> quote) async {
    await _dbHelper.removeFavorite(quote['quote']);
    favouriteList.removeWhere((element) => element.quote == quote['quote']);
  }
  bool isFavorite(Map<String, dynamic> quote) {
    return favouriteList.any((element) => element.quote == quote['quote']);
  }
}