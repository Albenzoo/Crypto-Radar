import 'package:flutter/material.dart';
import 'package:projectwallet/models/CoinInfo.dart';
import 'package:projectwallet/shared/constants.dart';

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
              child: Text("Prezzo:", style: TextStyle(fontSize: 15)),
            ),
            Text(marketData.current_price['eur'].toString(),
                style: TextStyle(fontSize: 15)),
          ]),
          Row(children: [
            Padding(
              padding: EdgeInsets.only(right: 8),
              child: Text("Prezzo", style: TextStyle(fontSize: 15)),
            ),
            Text("155555€", style: TextStyle(fontSize: 15)),
          ]),
          Row(children: [
            Padding(
              padding: EdgeInsets.only(right: 8),
              child: Text("Prezzo", style: TextStyle(fontSize: 15)),
            ),
            Text("155555€", style: TextStyle(fontSize: 15)),
          ]),
          Row(children: [
            Padding(
              padding: EdgeInsets.only(right: 8),
              child: Text("Prezzo", style: TextStyle(fontSize: 15)),
            ),
            Text("155555€", style: TextStyle(fontSize: 15)),
          ]),
          Row(children: [
            Padding(
              padding: EdgeInsets.only(right: 8),
              child: Text("Prezzo", style: TextStyle(fontSize: 15)),
            ),
            Text("155555€", style: TextStyle(fontSize: 15)),
          ]),
          Row(children: [
            Padding(
              padding: EdgeInsets.only(right: 8),
              child: Text("Prezzo", style: TextStyle(fontSize: 15)),
            ),
            Text("155555€", style: TextStyle(fontSize: 15)),
          ]),
          Row(children: [
            Padding(
              padding: EdgeInsets.only(right: 8),
              child: Text("Prezzo", style: TextStyle(fontSize: 15)),
            ),
            Text("155555€", style: TextStyle(fontSize: 15)),
          ]),
          Row(children: [
            Padding(
              padding: EdgeInsets.only(right: 8),
              child: Text("Prezzo", style: TextStyle(fontSize: 15)),
            ),
            Text("155555€", style: TextStyle(fontSize: 15)),
          ]),
          Row(children: [
            Padding(
              padding: EdgeInsets.only(right: 8),
              child: Text("Prezzo", style: TextStyle(fontSize: 15)),
            ),
            Text("155555€", style: TextStyle(fontSize: 15)),
          ]),
          Row(children: [
            Padding(
              padding: EdgeInsets.only(right: 8),
              child: Text("Prezzo", style: TextStyle(fontSize: 15)),
            ),
            Text("155555€", style: TextStyle(fontSize: 15)),
          ]),
          Row(children: [
            Padding(
              padding: EdgeInsets.only(right: 8),
              child: Text("Prezzo", style: TextStyle(fontSize: 15)),
            ),
            Text("155555€", style: TextStyle(fontSize: 15)),
          ]),
          Row(children: [
            Padding(
              padding: EdgeInsets.only(right: 8),
              child: Text("Prezzo", style: TextStyle(fontSize: 15)),
            ),
            Text("155555€", style: TextStyle(fontSize: 15)),
          ]),
          Row(children: [
            Padding(
              padding: EdgeInsets.only(right: 8),
              child: Text("Prezzo", style: TextStyle(fontSize: 15)),
            ),
            Text("155555€", style: TextStyle(fontSize: 15)),
          ]),
          Row(children: [
            Padding(
              padding: EdgeInsets.only(right: 8),
              child: Text("Prezzo", style: TextStyle(fontSize: 15)),
            ),
            Text("155555€", style: TextStyle(fontSize: 15)),
          ]),
          Row(children: [
            Padding(
              padding: EdgeInsets.only(right: 8),
              child: Text("Prezzo", style: TextStyle(fontSize: 15)),
            ),
            Text("155555€", style: TextStyle(fontSize: 15)),
          ]),
          Text(
            "Hx!!",
            style: TextStyle(fontSize: 30),
            textAlign: TextAlign.left,
          ),
        ],
      ),
    );
  }
}
