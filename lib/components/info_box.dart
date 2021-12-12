import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:projectwallet/custom_icon/custom_icon.dart';
import 'package:projectwallet/models/CoinInfo.dart';
import 'package:projectwallet/shared/constants.dart';
import 'dart:js' as js;

class InfoBox extends StatefulWidget {
  final CoinInfo coinInfo;

  InfoBox({Key? key, required this.coinInfo}) : super(key: key);

  @override
  _InfoBoxState createState() => _InfoBoxState();
}

class _InfoBoxState extends State<InfoBox> {
  @override
  Widget build(BuildContext context) {
    CoinInfo coinInfo = widget.coinInfo;
    MarketData marketData = coinInfo.market_data;
    Links? links = coinInfo.links;

    return Container(
      padding: EdgeInsets.all(18),
      margin: EdgeInsets.all(20),
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(children: [
            Padding(
              padding: EdgeInsets.only(right: 8),
              child: Image.network(coinInfo.image.small),
            ),
            Text(coinInfo.name, style: TextStyle(fontSize: 25)),
          ]),
          Row(children: [
            Padding(
              padding: EdgeInsets.only(right: 8),
              child: Text("Valore:", style: TextStyle(fontSize: 15)),
            ),
            Text("${marketData.current_price['eur'].toString()}€",
                style: TextStyle(fontSize: 15)),
          ]),
          Row(children: [
            Padding(
              padding: EdgeInsets.only(right: 8),
              child: Text("Market Cap:", style: TextStyle(fontSize: 15)),
            ),
            Text("${marketData.marketCap?['eur'].toString()}€",
                style: TextStyle(fontSize: 15)),
          ]),
          Row(children: [
            Padding(
              padding: EdgeInsets.only(right: 8),
              child: Text("Market Cap Rank:", style: TextStyle(fontSize: 15)),
            ),
            Text("#${marketData.marketCapRank.toString()}",
                style: TextStyle(fontSize: 15)),
          ]),
          Row(children: [
            Padding(
              padding: EdgeInsets.only(right: 8),
              child: Text("All Time High:", style: TextStyle(fontSize: 15)),
            ),
            Text(
                "${marketData.ath['eur'].toString()}€ in data ${dateToString(marketData.athDate['eur'])}",
                style: TextStyle(fontSize: 15)),
          ]),
          Row(children: [
            Padding(
              padding: EdgeInsets.only(right: 8),
              child: Text("Volume:", style: TextStyle(fontSize: 15)),
            ),
            Text("${marketData.totalVolume?['eur'].toString()}€",
                style: TextStyle(fontSize: 15)),
          ]),
          Row(children: [
            Padding(
              padding: EdgeInsets.only(right: 8),
              child: Text("High 24h:", style: TextStyle(fontSize: 15)),
            ),
            Text("${marketData.high24H?['eur'].toString()}€",
                style: TextStyle(fontSize: 15)),
          ]),
          Row(children: [
            Padding(
              padding: EdgeInsets.only(right: 8),
              child: Text("Low 24h:", style: TextStyle(fontSize: 15)),
            ),
            Text("${marketData.low24H?['eur'].toString()}€",
                style: TextStyle(fontSize: 15)),
          ]),
          Row(children: [
            Padding(
              padding: EdgeInsets.only(right: 8),
              child: Text("Variazione prezzo 24h:",
                  style: TextStyle(fontSize: 15)),
            ),
            Text("${marketData.priceChangePercentage24H?.toStringAsFixed(2)}%",
                style: TextStyle(fontSize: 15)),
          ]),
          Row(children: [
            Padding(
              padding: EdgeInsets.only(right: 8),
              child: Text("Variazione prezzo 7 giorni:",
                  style: TextStyle(fontSize: 15)),
            ),
            Text("${marketData.priceChangePercentage7D?.toStringAsFixed(2)}%",
                style: TextStyle(fontSize: 15)),
          ]),
          Row(children: [
            Padding(
              padding: EdgeInsets.only(right: 8),
              child: Text("Variazione prezzo 30 giorni:",
                  style: TextStyle(fontSize: 15)),
            ),
            Text("${marketData.priceChangePercentage30D?.toStringAsFixed(2)}%",
                style: TextStyle(fontSize: 15)),
          ]),
          Row(children: [
            Padding(
              padding: EdgeInsets.only(right: 8),
              child: Text("Variazione prezzo 200 giorni:",
                  style: TextStyle(fontSize: 15)),
            ),
            Text("${marketData.priceChangePercentage200D?.toStringAsFixed(2)}%",
                style: TextStyle(fontSize: 15)),
          ]),
          Row(children: [
            Padding(
              padding: EdgeInsets.only(right: 8),
              child: Text("Variazione prezzo 1 anno:",
                  style: TextStyle(fontSize: 15)),
            ),
            Text("${marketData.priceChangePercentage1Y?.toStringAsFixed(2)}%",
                style: TextStyle(fontSize: 15)),
          ]),
          Row(children: [
            Padding(
              padding: EdgeInsets.only(right: 8),
              child:
                  Text("Prezzi aggiornati al:", style: TextStyle(fontSize: 15)),
            ),
            Text("${dateToString(marketData.lastUpdated)}",
                style: TextStyle(fontSize: 15)),
          ]),
          Padding(
            padding: EdgeInsets.only(right: 8),
            child: Row(children: [
              Text("Link: ", style: TextStyle(fontSize: 15)),
              MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: () {
                    print("vai alla homepage");
                    js.context.callMethod('open', [links?.homepage?[0]]);
                  }, // handle your image tap here
                  child: Image.network(coinInfo.image.thumb),
                ),
              ),
              MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: () {
                    print("vai alla homepage");
                    js.context.callMethod('open', [links?.subredditUrl]);
                  }, // handle your image tap here
                  child: Icon(
                    CustomIcon.reddit_1,
                    size: 24.0,
                  ),
                ),
              ),
              MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: () {
                    print("vai alla homepage");
                    js.context.callMethod('open', [
                      'https://www.facebook.com/${links?.facebookUsername}'
                    ]);
                  }, // handle your image tap here
                  child: Icon(
                    Icons.facebook,
                    size: 25.0,
                  ),
                ),
              ),
              MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: () {
                    print("vai alla homepage");
                    js.context.callMethod('open', [
                      'https://www.twitter.com/${links?.twitterScreenName}'
                    ]);
                  }, // handle your image tap here
                  child: Icon(
                    CustomIcon.twitter_squared,
                    size: 24.0,
                  ),
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}

String dateToString(DateTime? date) {
  if (date == null) {
    return '';
  }
  final DateFormat formatter = DateFormat('dd/MM/yyyy');
  final String formatted = formatter.format(date);
  return formatted;
}
