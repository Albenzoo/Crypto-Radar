import 'package:flutter/material.dart';
import 'package:projectwallet/models/CryptoMarket.dart';
import 'package:projectwallet/shared/constants.dart';
import 'package:projectwallet/home.dart';

Widget cryptoCard(BuildContext myContext, CryptoMarket crypto) {
  return Card(
    shadowColor: kPrimaryColor,
    elevation: 8,
    clipBehavior: Clip.antiAlias,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
    child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.deepPurple.shade100,
              Colors.deepPurpleAccent.shade100
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          //color: kPrimaryColor,
        ),
        padding: EdgeInsets.all(12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Ink.image(
              height: 30,
              width: 30,
              image: NetworkImage(crypto.image),
            ),
            Text(crypto.name + " (${crypto.symbol.toUpperCase()})",
                style: TextStyle(fontSize: 18)),
            const SizedBox(height: 8),
            Text(crypto.currentPrice.toString() + "€",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ],
        )),
  );
}
