import 'package:http/http.dart' as http;
import 'package:projectwallet/models/CryptoMarket.dart';
import 'package:projectwallet/shared/constants.dart';
import 'dart:convert';

class CryptoApi {
  static Future<List<CryptoMarket>> fetchCoin() async {
    final response = await http.get(Uri.parse(baseUrl +
        '/api/v3/coins/markets?vs_currency=eur&order=market_cap_desc&per_page=20&page=1&sparkline=false'));
    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      final body = jsonDecode(response.body);
      //print(jsonDecode(response.body));

      return body.map<CryptoMarket>(CryptoMarket.fromJson).toList();
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load crypto list');
    }
  }
}