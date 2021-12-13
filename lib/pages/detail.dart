import 'package:flutter/material.dart';
import 'package:projectwallet/api/crypto_api.dart';
import 'package:projectwallet/components/info_box.dart';
import 'package:projectwallet/components/line_chart.dart';
import 'package:projectwallet/components/my_app_bar.dart';
import 'package:projectwallet/models/CoinInfo.dart';
import 'package:projectwallet/models/CryptoMarket.dart';
import 'package:projectwallet/models/MarketChartData.dart';
import 'package:projectwallet/shared/constants.dart';

class Detail extends StatefulWidget {
  final String coinSymbol;
  final String coinName;

  Detail({required this.coinSymbol, required this.coinName});

  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  late Future<MarketChartData> chartData;
  late Future<CoinInfo> coinInfo;

  @override
  void initState() {
    super.initState();
    startApiChainCall();
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    return Scaffold(
        appBar: MyAppBar(
          refreshPage: () => refresh(),
        ),
        body: queryData.size.width > 700
            ? desktopOrientation()
            : mobileOrientation());
  }

  Widget desktopOrientation() {
    return SingleChildScrollView(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
          //child: Text(args.coinSymbol),
          children: [
            Row(children: [
              Expanded(
                  // constrain height
                  child: Align(alignment: Alignment.topCenter, child: chart())),
              Expanded(
// constrain height
                  child: Align(
                      alignment: Alignment.topCenter, child: informationBox())),
            ]),
            Row(children: [
              Expanded(
                child: descriptionBoxFuture(),
              )
            ]),
          ]),
    );
  }

  Widget mobileOrientation() {
    return Column(
        //child: Text(args.coinSymbol),
        children: [
          Expanded(
              child: Align(alignment: Alignment.topCenter, child: chart())),
          Expanded(
              child: Align(
                  alignment: Alignment.topCenter, child: informationBox())),
        ]);
  }

  Widget descriptionBoxFuture() {
    return FutureBuilder<CoinInfo>(
      future: coinInfo,
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return Center(child: CircularProgressIndicator());
          default:
            if (snapshot.hasError) {
              return Center(child: Text('Some error occurred!'));
            } else {
              CoinInfo response = snapshot.data!;
              String description = "Non disponibile";
              if (response.description['it'] != null) {
                description = response.description['it'];
              } else {
                description = response.description['en'];
              }
              return descriptionBox(description);
            }
        }
      },
    );
  }

  Widget descriptionBox(String description) {
    return Container(
      padding: EdgeInsets.all(12),
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 4),
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          new BoxShadow(
            color: kPrimaryColor,
            offset: new Offset(6.0, 6.0),
          ),
        ],
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(children: [
          Text("Descrizione", style: TextStyle(fontSize: 25)),
        ]),
        Row(children: [
          Flexible(
            child: Padding(
              padding: EdgeInsets.only(top: 8),
              child: Text(description, style: TextStyle(fontSize: 15)),
            ),
          ),
        ]),
      ]),
    );
  }

  Widget informationBox() {
    return FutureBuilder<CoinInfo>(
      future: coinInfo,
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return Center(child: CircularProgressIndicator());
          default:
            if (snapshot.hasError) {
              return Center(child: Text('Some error occurred!'));
            } else {
              return InfoBox(coinInfo: snapshot.data!);
            }
        }
      },
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
              return LineCryptoChart(chartData: snapshot.data!);
            }
        }
      },
    );
  }

  Future startApiChainCall() async {
    await Future.wait([
      chartData = CryptoApi.getMarketChartData(this.widget.coinName),
      coinInfo = CryptoApi.getCoinInfo(this.widget.coinName),
    ]).catchError((Object e, StackTrace stackTrace) {
      print(e.toString());
      print(stackTrace);
      return [
        {e.toString()}
      ];
    }).whenComplete(() => print("API calls completed!"));
  }

  /* Refresh page */
  void refresh() {
    print("Refresh");
    setState(() {});
  }
}
