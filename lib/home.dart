import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:projectwallet/components/crypto_card.dart';
import 'package:projectwallet/shared/constants.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Future<http.Response> fetchCoin() async {
    final response = await http.get(Uri.parse(baseUrl +
        '/api/v3/coins/markets?vs_currency=eur&order=market_cap_desc&per_page=20&page=1&sparkline=false'));
    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      //print(jsonDecode(response.body));
      return response;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchCoin();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: Icon(
            Icons.savings,
          ),
          title: Text('Crypto wallet'),
          actions: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Icon(Icons.autorenew),
            ),
          ],
          backgroundColor: kPrimaryColor,
        ),
        body: Padding(
            padding: EdgeInsets.all(8.0),
            child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200,
                    childAspectRatio: 3 / 2,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20),
                itemCount: 10,
                itemBuilder: (BuildContext ctx, index) {
                  return cryptoCard(context, "dd");
                }))

        /* ListView(
        padding: EdgeInsets.all(16),
        children: [
          cryptoCard(context, "dd"),
        ],
      ), */
        );
  }
}
