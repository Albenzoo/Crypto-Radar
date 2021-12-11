import 'package:flutter/material.dart';
import 'package:projectwallet/models/CoinInfo.dart';

class InfoBox extends StatelessWidget {
  final CoinInfo coinInfo;
  const InfoBox({Key? key, required this.coinInfo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("coinInfo");
    print(coinInfo);

    return Container(
      padding: EdgeInsets.all(35),
      margin: EdgeInsets.all(20),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 4),
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          new BoxShadow(
            color: Colors.green,
            offset: new Offset(6.0, 6.0),
          ),
        ],
      ),
      child: Text("Hello! I am in the container widget decoration box!!",
          style: TextStyle(fontSize: 30)),
    );
    ;
  }
}
