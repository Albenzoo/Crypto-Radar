import 'dart:html';

import 'package:flutter/material.dart';
import 'package:projectwallet/api/crypto_api.dart';
import 'package:projectwallet/components/line_chart.dart';
import 'package:projectwallet/components/my_app_bar.dart';
import 'package:projectwallet/shared/constants.dart';

class Detail extends StatefulWidget {
  final String coinSymbol;
  final String coinName;

  Detail({required this.coinSymbol, required this.coinName});

  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  @override
  void initState() {
    super.initState();
    print("siamo nel dettaglio");
    setupMethod();
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Detail;
    print("rebuild");

    return Scaffold(
      appBar: MyAppBar(
        refreshPage: () => refresh(),
      ),
      body: Container(
        //child: Text(args.coinSymbol),
        child: LineCryptoChart(),
      ),
    );
  }

  Future setupMethod() async {
    await Future.wait([
      CryptoApi.getMarketChartData(),
      CryptoApi.fetchCoin(),
    ]).then((responseList) {
      var risposta0 = responseList[0];
      var risposta1 = responseList[1];
      print("risposta 0:");
      print(risposta0);
      print("risposta 1:");
      print(risposta1);
    }, onError: (err) {
      print("errore");
    });
  }

  /* Refresh page */
  void refresh() {
    print("Aggiorno");
    setState(() {});
  }
}
