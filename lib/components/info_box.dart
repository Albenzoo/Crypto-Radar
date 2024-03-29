import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:projectwallet/custom_icon/custom_icon.dart';
import 'package:projectwallet/models/CoinInfo.dart';
import 'package:projectwallet/shared/constants.dart';
import 'package:universal_html/js.dart' as js;

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
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          new BoxShadow(
            color: detailBoxColor,
            offset: new Offset(6.0, 6.0),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 8, bottom: 10),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade600,
                            offset: Offset(2, 2),
                            blurRadius: 10,
                            spreadRadius: 2,
                          )
                        ]),
                    height: 50,
                    width: 50,
                    child: Padding(
                      padding: EdgeInsets.all(6),
                      child: Image.network(coinInfo.image.small),
                    ),
                  ),
                ),
                Text(coinInfo.name, style: TextStyle(fontSize: 25)),
              ]),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text("Valore:", style: TextStyle(fontSize: 15)),
            ),
            Padding(
              padding: EdgeInsets.only(right: 10),
              child: Text("${marketData.current_price['eur'].toString()}€",
                  style: TextStyle(fontSize: 15)),
            ),
          ]),
          Divider(
            color: Colors.grey.shade500,
            height: 6,
            indent: 0,
            endIndent: 0,
            thickness: 1,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text("Market Cap:", style: TextStyle(fontSize: 15)),
            ),
            Padding(
              padding: EdgeInsets.only(right: 10),
              child: Text("${marketData.marketCap?['eur'].toString()}€",
                  style: TextStyle(fontSize: 15)),
            ),
          ]),
          Divider(
            color: Colors.grey.shade500,
            height: 6,
            indent: 0,
            endIndent: 0,
            thickness: 1,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text("Market Cap Rank:", style: TextStyle(fontSize: 15)),
            ),
            Padding(
              padding: EdgeInsets.only(right: 10),
              child: Text("#${marketData.marketCapRank.toString()}",
                  style: TextStyle(fontSize: 15)),
            )
          ]),
          Divider(
            color: Colors.grey.shade500,
            height: 6,
            indent: 0,
            endIndent: 0,
            thickness: 1,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text("All Time High:", style: TextStyle(fontSize: 15)),
            ),
            Padding(
              padding: EdgeInsets.only(right: 10),
              child: Text(
                  "${marketData.ath['eur'].toString()}€ nel ${dateToString(marketData.athDate['eur'])}",
                  style: TextStyle(fontSize: 15)),
            )
          ]),
          Divider(
            color: Colors.grey.shade500,
            height: 6,
            indent: 0,
            endIndent: 0,
            thickness: 1,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text("Volume:", style: TextStyle(fontSize: 15)),
            ),
            Padding(
              padding: EdgeInsets.only(right: 10),
              child: Text("${marketData.totalVolume?['eur'].toString()}€",
                  style: TextStyle(fontSize: 15)),
            )
          ]),
          Divider(
            color: Colors.grey.shade500,
            height: 6,
            indent: 0,
            endIndent: 0,
            thickness: 1,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text("High 24h:", style: TextStyle(fontSize: 15)),
            ),
            Padding(
              padding: EdgeInsets.only(right: 10),
              child: Text("${marketData.high24H?['eur'].toString()}€",
                  style: TextStyle(fontSize: 15)),
            )
          ]),
          Divider(
            color: Colors.grey.shade500,
            height: 6,
            indent: 0,
            endIndent: 0,
            thickness: 1,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text("Low 24h:", style: TextStyle(fontSize: 15)),
            ),
            Padding(
              padding: EdgeInsets.only(right: 10),
              child: Text("${marketData.low24H?['eur'].toString()}€",
                  style: TextStyle(fontSize: 15)),
            )
          ]),
          Divider(
            color: Colors.grey.shade500,
            height: 6,
            indent: 0,
            endIndent: 0,
            thickness: 1,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text("Variazione prezzo 24h:",
                  style: TextStyle(fontSize: 15)),
            ),
            Padding(
              padding: EdgeInsets.only(right: 10),
              child: Text(
                  "${marketData.priceChangePercentage24H?.toStringAsFixed(2)}%",
                  style: TextStyle(fontSize: 15)),
            )
          ]),
          Divider(
            color: Colors.grey.shade500,
            height: 6,
            indent: 0,
            endIndent: 0,
            thickness: 1,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text("Variazione prezzo 7 giorni:",
                  style: TextStyle(fontSize: 15)),
            ),
            Padding(
              padding: EdgeInsets.only(right: 10),
              child: Text(
                  "${marketData.priceChangePercentage7D?.toStringAsFixed(2)}%",
                  style: TextStyle(fontSize: 15)),
            )
          ]),
          Divider(
            color: Colors.grey.shade500,
            height: 6,
            indent: 0,
            endIndent: 0,
            thickness: 1,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text("Variazione prezzo 30 giorni:",
                  style: TextStyle(fontSize: 15)),
            ),
            Padding(
              padding: EdgeInsets.only(right: 10),
              child: Text(
                  "${marketData.priceChangePercentage30D?.toStringAsFixed(2)}%",
                  style: TextStyle(fontSize: 15)),
            )
          ]),
          Divider(
            color: Colors.grey.shade500,
            height: 6,
            indent: 0,
            endIndent: 0,
            thickness: 1,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text("Variazione prezzo 200 giorni:",
                  style: TextStyle(fontSize: 15)),
            ),
            Padding(
              padding: EdgeInsets.only(right: 10),
              child: Text(
                  "${marketData.priceChangePercentage200D?.toStringAsFixed(2)}%",
                  style: TextStyle(fontSize: 15)),
            )
          ]),
          Divider(
            color: Colors.grey.shade500,
            height: 6,
            indent: 0,
            endIndent: 0,
            thickness: 1,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text("Variazione prezzo 1 anno:",
                  style: TextStyle(fontSize: 15)),
            ),
            Padding(
              padding: EdgeInsets.only(right: 10),
              child: Text(
                  "${marketData.priceChangePercentage1Y?.toStringAsFixed(2)}%",
                  style: TextStyle(fontSize: 15)),
            )
          ]),
          Divider(
            color: Colors.grey.shade500,
            height: 6,
            indent: 0,
            endIndent: 0,
            thickness: 1,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Padding(
              padding: EdgeInsets.only(left: 10),
              child:
                  Text("Prezzi aggiornati al:", style: TextStyle(fontSize: 15)),
            ),
            Padding(
              padding: EdgeInsets.only(right: 10),
              child: Text("${dateToString(marketData.lastUpdated)}",
                  style: TextStyle(fontSize: 15)),
            )
          ]),
          Divider(
            color: Colors.grey.shade500,
            height: 6,
            indent: 0,
            endIndent: 0,
            thickness: 1,
          ),
          Padding(
            padding: EdgeInsets.only(top: 10),
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              //Text("Link: ", style: TextStyle(fontSize: 15)),
              Padding(
                padding: EdgeInsets.only(right: 11),
                child: MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: () {
                      print("vai alla homepage");
                      js.context.callMethod('open', [links?.homepage?[0]]);
                    }, // handle your image tap here
                    child: Image.network(coinInfo.image.thumb),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 10),
                child: MouseRegion(
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
              ),
              Padding(
                padding: EdgeInsets.only(right: 10),
                child: MouseRegion(
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
