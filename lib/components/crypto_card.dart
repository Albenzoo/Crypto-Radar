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
          color: Colors.blue,
          //color: kPrimaryColor,
        ),
        padding: EdgeInsets.all(12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(4),
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
                  padding: EdgeInsets.all(8),
                  child: Image.network(crypto.image),
                ),
              ),
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
