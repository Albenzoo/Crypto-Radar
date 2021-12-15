import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:projectwallet/api/crypto_api.dart';
import 'package:projectwallet/components/info_box.dart';
import 'package:projectwallet/components/line_chart.dart';
import 'package:projectwallet/components/my_app_bar.dart';
import 'package:projectwallet/models/CoinInfo.dart';
import 'package:projectwallet/models/MarketChartData.dart';
import 'package:projectwallet/shared/constants.dart';
import 'package:universal_html/js.dart' as js;

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
                  child: Align(alignment: Alignment.topCenter, child: chart())),
              Expanded(
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
    return SingleChildScrollView(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
          //child: Text(args.coinSymbol),
          children: [
            Row(children: [
              Expanded(
                child: Padding(
                    padding:
                        EdgeInsets.only(right: 20, left: 0, top: 0, bottom: 0),
                    child:
                        Align(alignment: Alignment.topCenter, child: chart())),
              )
            ]),
            Row(children: [
              Expanded(
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
              if (response.description['it'] != "") {
                description = response.description['it'];
              } else if (response.description['en'] != "") {
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
      margin: EdgeInsets.only(right: 20, left: 20, top: 5, bottom: 20),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 4),
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          new BoxShadow(
            color: detailBoxColor,
            offset: new Offset(6.0, 6.0),
          ),
        ],
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(children: [
          Padding(
            padding: EdgeInsets.only(left: 7),
            child: Text("Descrizione", style: TextStyle(fontSize: 25)),
          )
        ]),
        Row(children: [
          Flexible(
            child: Padding(
              padding: EdgeInsets.only(top: 3),
              child: Html(
                data: description,
                style: {
                  "body": Style(
                    fontSize: FontSize(18.0),
                    fontWeight: FontWeight.normal,
                  ),
                },
                onLinkTap: (url, context, attributes, element) {
                  print("Opening...");
                  js.context.callMethod('open', [url]);
                },
              ),
              //child: Text(description, style: TextStyle(fontSize: 15)),
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
