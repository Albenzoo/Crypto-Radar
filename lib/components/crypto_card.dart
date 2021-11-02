import 'package:flutter/material.dart';
import 'package:projectwallet/models/CryptoMarket.dart';
import 'package:projectwallet/shared/constants.dart';
import 'package:projectwallet/home.dart';

Widget cryptoCard(BuildContext myContext, CryptoMarket crypto) {
  return Card(
    child: Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(crypto.name + " (${crypto.symbol.toUpperCase()})",
                style: TextStyle(fontSize: 18)),
            const SizedBox(height: 8),
            Text(crypto.currentPrice.toString() + "€",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ],
        )),
  );
}
