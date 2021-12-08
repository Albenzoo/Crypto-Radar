import 'dart:js';

import 'package:flutter/material.dart';
import 'package:projectwallet/api/crypto_api.dart';
import 'package:projectwallet/components/line_chart.dart';
import 'package:projectwallet/components/my_app_bar.dart';
import 'package:projectwallet/models/CryptoMarket.dart';
import 'package:projectwallet/models/MarketChartData.dart';

class Detail extends StatefulWidget {
  final String coinSymbol;
  final String coinName;

  Detail({required this.coinSymbol, required this.coinName});

  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  late Future<MarketChartData> chartData;
  late Future<List<CryptoMarket>> response2;

  @override
  void initState() {
    super.initState();
    print("siamo nel dettaglio");

    startApiChainCall();
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
        child: chart(),
      ),
    );
  }

  Widget chart() {
    return FutureBuilder<MarketChartData>(
      future: chartData,
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return Center(child: CircularProgressIndicator());
          default:
            if (snapshot.hasError) {
              return Center(child: Text('Some error occurred!'));
            } else {
              //return Center(child: Text('Some error occurred!'));
              return LineCryptoChart(chartData: snapshot.data!);
            }
        }
      },
    );
  }

  Future startApiChainCall() async {
    await Future.wait([
      chartData = CryptoApi.getMarketChartData(),
      response2 = CryptoApi.fetchCoin()
    ]).catchError((err) {
      print(err);
    }).whenComplete(() => print("completate tutte le chiamate"));
  }

  /* Refresh page */
  void refresh() {
    print("Aggiorno");
    setState(() {});
  }
}
